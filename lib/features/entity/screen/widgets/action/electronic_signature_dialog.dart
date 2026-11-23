import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/core/utils/js/string_js_interpolation.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/features/entity/models/action_signature.dart';

/// Interactive Electronic Signature Dialog for GMP/CPOB & Audit Compliance.
///
/// Prompts the authenticated user to verify their identity via password,
/// confirms the legal meaning/intent of the signature, and verifies
/// credentials against the backend authentication service.
class ElectronicSignatureDialog extends StatefulWidget {
  final ActionSignature signature;
  final String? actionName;
  final Future<SignatureResult> Function(String meaning, String password)?
      customVerifier;

  const ElectronicSignatureDialog({
    super.key,
    required this.signature,
    this.actionName,
    this.customVerifier,
  });

  /// Helper to prompt the electronic signature dialog and return [SignatureResult]
  /// if verified, or null if cancelled/aborted.
  static Future<SignatureResult?> prompt({
    required BuildContext context,
    required ActionSignature signature,
    String? actionName,
    Future<SignatureResult> Function(String meaning, String password)?
        customVerifier,
  }) {
    return showDialog<SignatureResult>(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (ctx) => ElectronicSignatureDialog(
        signature: signature,
        actionName: actionName,
        customVerifier: customVerifier,
      ),
    );
  }

  @override
  State<ElectronicSignatureDialog> createState() =>
      _ElectronicSignatureDialogState();
}

class _ElectronicSignatureDialogState extends State<ElectronicSignatureDialog> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  late String _selectedMeaning;
  bool _obscurePassword = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    final meanings = widget.signature.meanings;
    if (widget.signature.defaultMeaning != null &&
        meanings.contains(widget.signature.defaultMeaning)) {
      _selectedMeaning = widget.signature.defaultMeaning!;
    } else if (meanings.isNotEmpty) {
      _selectedMeaning = meanings.first;
    } else {
      _selectedMeaning = 'Disetujui';
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String get _currentUserName {
    try {
      final name = UserRepositoryAppNocode.instance.userApp?.name;
      if (name != null && name.isNotEmpty) return name;
    } catch (_) {}
    return 'Pengguna';
  }

  String get _currentUserNip {
    try {
      final user = UserRepositoryAppNocode.instance.userApp;
      if (user != null) {
        if (user.role.isNotEmpty) return user.role;
        return user.id.toString();
      }
    } catch (_) {}
    return '-';
  }

  Future<void> _handleConfirm() async {
    if (widget.signature.requirePassword &&
        !(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final password = _passwordController.text.trim();
    final meaning = _selectedMeaning;

    try {
      SignatureResult result;
      if (widget.customVerifier != null) {
        result = await widget.customVerifier!(meaning, password);
      } else {
        result = await _verifyWithBackend(meaning, password);
      }

      if (mounted) {
        Navigator.of(context).pop(result);
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = _cleanErrorMessage(e);
        });
      }
    }
  }

  Future<SignatureResult> _verifyWithBackend(
    String meaning,
    String password,
  ) async {
    final dio = Api.dio;
    final verifyUrl = widget.signature.verifyUrl;
    final userName = _currentUserName;
    final userNip = _currentUserNip;
    final backendHost =
        Configuration.instance.backendHost.replaceAll(RegExp(r'/+$'), '');

    final resolvedVerifyUrl = (verifyUrl != null && verifyUrl.isNotEmpty)
        ? verifyUrl.interpolateJavascript({})
        : null;

    final targetUrl = (resolvedVerifyUrl != null && resolvedVerifyUrl.isNotEmpty)
        ? (resolvedVerifyUrl.startsWith('http')
            ? resolvedVerifyUrl
            : '$backendHost/${resolvedVerifyUrl.replaceFirst(RegExp(r'^/+'), '')}')
        : '$backendHost/auth/verify-password';

    final response = await dio.post<Map<String, dynamic>>(
      targetUrl,
      data: {
        'meaning': meaning,
        'password': password,
        'nip': userNip,
      },
      options: Options(
        headers: {
          if (UserRepositoryAppNocode.instance.token != null)
            'Authorization': 'Bearer ${UserRepositoryAppNocode.instance.token}',
        },
      ),
    );

    final respData = response.data;
    final signatureToken = (respData != null)
        ? (respData['signature_token'] ??
            respData['token'] ??
            (respData['data'] is Map
                ? respData['data']['signature_token'] ??
                    respData['data']['token']
                : null))
        : null;

    if (signatureToken == null || signatureToken.toString().isEmpty) {
      throw Exception('Server tidak mengembalikan signature_token.');
    }

    return SignatureResult(
      token: signatureToken.toString(),
      meaning: meaning,
      signerName: userName,
      signerNip: userNip,
      signedAt: DateTime.now(),
    );
  }

  String _cleanErrorMessage(Object error) {
    String msg = error.toString();
    if (error is DioException) {
      final data = error.response?.data;
      if (data is Map) {
        msg = data['message'] ?? data['error'] ?? data['detail'] ?? error.message ?? 'Verifikasi gagal';
      } else {
        msg = error.message ?? 'Gagal menghubungi server verifikasi tanda tangan.';
      }
    }
    return msg
        .replaceFirst(RegExp(r'^[a-zA-Z]+Exception:\s*'), '')
        .replaceFirst(RegExp(r'^Exception:\s*'), '')
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dialogTitle = widget.signature.title ?? 'Tanda Tangan Elektronik';
    final actionName = widget.actionName;

    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.draw_outlined,
              color: theme.colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              dialogTitle,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 440,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (actionName != null && actionName.isNotEmpty) ...[
                Text(
                  'Aksi: $actionName',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 12),
              ],
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: theme.colorScheme.primary,
                      child: Text(
                        _currentUserName.isNotEmpty
                            ? _currentUserName[0].toUpperCase()
                            : 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _currentUserName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'NIP: $_currentUserNip',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              if (widget.signature.requireMeaning) ...[
                Text(
                  'Makna Tanda Tangan (Meaning)',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  value: _selectedMeaning,
                  isExpanded: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                  items: widget.signature.meaningOptions.map((option) {
                    return DropdownMenuItem<String>(
                      value: option.value,
                      child: Text(option.label),
                    );
                  }).toList(),
                  onChanged: _isLoading
                      ? null
                      : (val) {
                          if (val != null) {
                            setState(() => _selectedMeaning = val);
                          }
                        },
                ),
                const SizedBox(height: 16),
              ],
              if (widget.signature.requirePassword) ...[
                Text(
                  'Kata Sandi Konfirmasi',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  enabled: !_isLoading,
                  decoration: InputDecoration(
                    hintText: 'Masukkan kata sandi Anda...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ),
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Kata sandi wajib diisi untuk tanda tangan elektronik';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) => _handleConfirm(),
                ),
              ],
              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline,
                          size: 18, color: Colors.red.shade700),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(
                            color: Colors.red.shade800,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(null),
          child: const Text('Batal'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _handleConfirm,
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: _isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : const Text('Tanda Tangani & Lanjutkan'),
        ),
      ],
    );
  }
}
