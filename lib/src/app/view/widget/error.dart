import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Widget error ala framework, untuk menampilkan pesan error dengan gaya yang lebih proper.
class NoCodeError extends StatelessWidget {
  /// Pesan error utama (biasanya singkat/padat).
  final String message;

  /// Deskripsi tambahan (opsional), misalnya penjelasan singkat kenapa error ini terjadi.
  final String? description;

  /// Saran perbaikan (opsional), misalnya "Cek kembali konfigurasi XYZ".
  final String? suggestion;

  /// Info debug (opsional), bisa diisi stacktrace, parameter, atau payload.
  final String? debugInfo;

  /// Callback tombol Retry (opsional). Kalau null, tombol tidak akan muncul.
  final VoidCallback? onRetry;

  const NoCodeError(
    this.message, {
    super.key,
    this.description,
    this.suggestion,
    this.debugInfo,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.redAccent, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: textTheme.bodyMedium?.copyWith(color: Colors.white) ??
            const TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.error_outline,
                    color: Colors.redAccent,
                    size: 20,
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Oops, an error occurred',
                        style: textTheme.titleMedium?.copyWith(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700,
                            ) ??
                            const TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                      ),
                      const Gap(4),
                      Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'monospace', // ala-ala error console
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Gap(12),

            if (description != null && description!.trim().isNotEmpty) ...[
              Text(
                description!,
                style: textTheme.bodySmall?.copyWith(
                      color: Colors.grey[300],
                    ) ??
                    TextStyle(color: Colors.grey[300], fontSize: 12),
              ),
              const Gap(8),
            ],

            if (suggestion != null && suggestion!.trim().isNotEmpty) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const Gap(6),
                  Expanded(
                    child: Text(
                      suggestion!,
                      style: textTheme.bodySmall?.copyWith(
                            color: Colors.amber[200],
                          ) ??
                          TextStyle(color: Colors.amber[200], fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Gap(8),
            ],

            if (debugInfo != null && debugInfo!.trim().isNotEmpty) ...[
              Text(
                'Details',
                style: textTheme.labelMedium?.copyWith(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ) ??
                    TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const Gap(4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C1C),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Colors.grey[800]!,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    debugInfo!,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              const Gap(8),
            ],

            // Footer: tombol Retry kalau ada
            if (onRetry != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(
                    Icons.refresh,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Retry',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
