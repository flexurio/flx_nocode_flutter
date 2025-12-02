import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Widget error ala framework, untuk menampilkan pesan error dengan gaya yang lebih proper.
class NoCodeError extends StatefulWidget {
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
  State<NoCodeError> createState() => _NoCodeErrorState();
}

class _NoCodeErrorState extends State<NoCodeError>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1A0000),
                  const Color(0xFF0D0000),
                  const Color(0xFF1A0000),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.redAccent.withOpacity(0.5),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.red.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Animated background pattern
                  Positioned.fill(
                    child: CustomPaint(
                      painter: ErrorPatternPainter(
                        animation: _controller,
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: DefaultTextStyle(
                      style: textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ) ??
                          const TextStyle(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header dengan pulse animation
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0.8, end: 1.0),
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.easeInOut,
                                builder: (context, scale, child) {
                                  return Transform.scale(
                                    scale: scale,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        gradient: RadialGradient(
                                          colors: [
                                            Colors.redAccent.withOpacity(0.4),
                                            Colors.redAccent.withOpacity(0.1),
                                          ],
                                        ),
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.redAccent
                                                .withOpacity(0.5),
                                            blurRadius: 15,
                                            spreadRadius: 2,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.error_outline_rounded,
                                        color: Colors.redAccent,
                                        size: 24,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              const Gap(14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                          colors: [
                                            Colors.redAccent,
                                            Colors.red[300]!,
                                          ],
                                        ).createShader(bounds);
                                      },
                                      child: Text(
                                        'Error Occurred',
                                        style: textTheme.titleMedium?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              letterSpacing: 0.5,
                                            ) ??
                                            const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18,
                                              letterSpacing: 0.5,
                                            ),
                                      ),
                                    ),
                                    const Gap(6),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                          color:
                                              Colors.redAccent.withOpacity(0.3),
                                        ),
                                      ),
                                      child: Text(
                                        widget.message,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'monospace',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          if (widget.description != null &&
                              widget.description!.trim().isNotEmpty) ...[
                            const Gap(16),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    size: 18,
                                    color: Colors.grey[300],
                                  ),
                                  const Gap(10),
                                  Expanded(
                                    child: Text(
                                      widget.description!,
                                      style: textTheme.bodySmall?.copyWith(
                                            color: Colors.grey[300],
                                            height: 1.5,
                                          ) ??
                                          TextStyle(
                                            color: Colors.grey[300],
                                            fontSize: 13,
                                            height: 1.5,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          if (widget.suggestion != null &&
                              widget.suggestion!.trim().isNotEmpty) ...[
                            const Gap(12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.amber.withOpacity(0.15),
                                    Colors.orange.withOpacity(0.1),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.amber.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.lightbulb_rounded,
                                    size: 18,
                                    color: Colors.amber,
                                  ),
                                  const Gap(10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Suggestion',
                                          style: TextStyle(
                                            color: Colors.amber[200],
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        const Gap(4),
                                        Text(
                                          widget.suggestion!,
                                          style: textTheme.bodySmall?.copyWith(
                                                color: Colors.amber[100],
                                                height: 1.5,
                                              ) ??
                                              TextStyle(
                                                color: Colors.amber[100],
                                                fontSize: 13,
                                                height: 1.5,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          if (widget.debugInfo != null &&
                              widget.debugInfo!.trim().isNotEmpty) ...[
                            const Gap(12),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _isExpanded = !_isExpanded;
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0A0A0A),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey[800]!,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.code_rounded,
                                          size: 16,
                                          color: Colors.grey[500],
                                        ),
                                        const Gap(8),
                                        Text(
                                          'Debug Details',
                                          style:
                                              textTheme.labelMedium?.copyWith(
                                                    color: Colors.grey[400],
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.5,
                                                  ) ??
                                                  TextStyle(
                                                    color: Colors.grey[400],
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    letterSpacing: 0.5,
                                                  ),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          _isExpanded
                                              ? Icons.expand_less_rounded
                                              : Icons.expand_more_rounded,
                                          size: 20,
                                          color: Colors.grey[500],
                                        ),
                                      ],
                                    ),
                                    AnimatedCrossFade(
                                      firstChild: const SizedBox.shrink(),
                                      secondChild: Padding(
                                        padding: const EdgeInsets.only(top: 8),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF050505),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Text(
                                              widget.debugInfo!,
                                              style: const TextStyle(
                                                fontFamily: 'monospace',
                                                fontSize: 11,
                                                color: Colors.white60,
                                                height: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      crossFadeState: _isExpanded
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],

                          // Footer: tombol Retry dengan efek hover
                          if (widget.onRetry != null) ...[
                            const Gap(16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: widget.onRetry,
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.redAccent,
                                            Colors.red[700]!,
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.redAccent
                                                .withOpacity(0.4),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.refresh_rounded,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                          const Gap(8),
                                          const Text(
                                            'Retry',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter untuk background pattern yang animated
class ErrorPatternPainter extends CustomPainter {
  final Animation<double> animation;

  ErrorPatternPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent.withOpacity(0.03)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final spacing = 30.0;
    final offset = animation.value * spacing;

    // Diagonal lines
    for (double i = -size.height; i < size.width + size.height; i += spacing) {
      canvas.drawLine(
        Offset(i - offset, 0),
        Offset(i - offset + size.height, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ErrorPatternPainter oldDelegate) => true;
}
