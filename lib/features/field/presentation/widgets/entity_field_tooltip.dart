import 'package:flutter/material.dart';

/// A reusable, theme-aware tooltip wrapper for any [child] widget.
///
/// The visual style follows the rest of the app: a soft surface with a subtle
/// border, rounded corners, and a small drop shadow. Hover/tap targets behave
/// like Material's stock [Tooltip] so it can be dropped in without changes to
/// existing call sites.
///
/// If [message] is empty, the wrapper is a no-op and returns the [child]
/// unchanged — callers can safely enable the tooltip on a per-column basis
/// without worrying about empty values.
class EntityFieldTooltip extends StatelessWidget {
  const EntityFieldTooltip({
    super.key,
    required this.message,
    required this.child,
  });

  /// The text shown when the user hovers over (or long-presses) [child].
  final String message;

  /// The widget that will receive the hover/long-press gesture.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final trimmed = message.trim();
    if (trimmed.isEmpty) {
      return child;
    }

    // Always dark theme colors (as requested, for both light and dark mode)
    const backgroundColor = Color(0xFF111214);
    const borderColor = Color(0xFF2E3033);
    const textColor = Color(0xFFE3E2E6);

    final theme = Theme.of(context);

    return Tooltip(
      message: trimmed,
      waitDuration: const Duration(milliseconds: 350),
      showDuration: const Duration(milliseconds: 1800),
      preferBelow: true,
      verticalOffset: 12,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      textStyle: (theme.textTheme.labelMedium ?? const TextStyle()).copyWith(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        letterSpacing: 0.3,
      ),
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: TooltipShapeBorder(
          borderColor: borderColor,
          borderWidth: 0.8,
          radius: 8,
          arrowHeight: 6,
          arrowWidth: 10,
        ),
        shadows: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// A custom [ShapeBorder] that draws a rounded rectangle with an arrow pointing upwards.
class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double radius;
  final Color borderColor;
  final double borderWidth;

  const TooltipShapeBorder({
    this.arrowWidth = 10.0,
    this.arrowHeight = 6.0,
    this.radius = 8.0,
    required this.borderColor,
    this.borderWidth = 0.8,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(top: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final double left = rect.left;
    final double top = rect.top + arrowHeight;
    final double right = rect.right;
    final double bottom = rect.bottom;
    final double centerX = rect.left + rect.width / 2;

    return Path()
      ..moveTo(centerX, rect.top) // Start at the tip of the arrow (top-center)
      ..lineTo(centerX + arrowWidth / 2, top) // Down and right to base of arrow
      ..lineTo(right - radius, top) // Right to the start of top-right curve
      ..arcToPoint(Offset(right, top + radius), radius: Radius.circular(radius))
      ..lineTo(right, bottom - radius) // Down to start of bottom-right curve
      ..arcToPoint(Offset(right - radius, bottom),
          radius: Radius.circular(radius))
      ..lineTo(left + radius, bottom) // Left to start of bottom-left curve
      ..arcToPoint(Offset(left, bottom - radius),
          radius: Radius.circular(radius))
      ..lineTo(left, top + radius) // Up to start of top-left curve
      ..arcToPoint(Offset(left + radius, top), radius: Radius.circular(radius))
      ..lineTo(centerX - arrowWidth / 2, top) // Right to base of arrow
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return TooltipShapeBorder(
      arrowWidth: arrowWidth * t,
      arrowHeight: arrowHeight * t,
      radius: radius * t,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TooltipShapeBorder) return false;
    return other.arrowWidth == arrowWidth &&
        other.arrowHeight == arrowHeight &&
        other.radius == radius &&
        other.borderColor == borderColor &&
        other.borderWidth == borderWidth;
  }

  @override
  int get hashCode => Object.hash(
        arrowWidth,
        arrowHeight,
        radius,
        borderColor,
        borderWidth,
      );
}
