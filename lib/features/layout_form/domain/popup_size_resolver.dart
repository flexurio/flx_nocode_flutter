import 'dart:math' as math;

import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';

/// Resolves the responsive target width for popup forms using:
/// 1. Explicit [actionWidth] override (number, percentage, or semantic preset)
/// 2. Explicit [formWidth] from `LayoutForm` (number, percentage, or semantic preset)
/// 3. Smart content-aware inference from [layoutForm] components
///
/// The resulting width is always clamped to the available [viewportWidth].
class PopupSizeResolver {
  const PopupSizeResolver._();

  static const double sm = 440.0;
  static const double md = 560.0;
  static const double lg = 760.0;
  static const double xl = 960.0;
  static const double xxl = 1120.0;
  static const double minDesktopWidth = 280.0;
  static const double mobileBreakpoint = 600.0;
  static const double desktopMaxRatio = 0.92;

  /// Resolves the final popup width in logical pixels for [viewportWidth].
  static double resolve({
    required LayoutForm layoutForm,
    required double viewportWidth,
    Object? actionWidth,
    Object? formWidth,
  }) {
    final target = _parseWidthSpec(actionWidth, viewportWidth) ??
        _parseWidthSpec(formWidth ?? layoutForm.width, viewportWidth) ??
        inferFromLayoutForm(layoutForm);

    return clampToViewport(target, viewportWidth);
  }

  /// Clamps a target [width] to safe bounds for the current [viewportWidth].
  static double clampToViewport(double width, double viewportWidth) {
    if (viewportWidth <= 0) return width;
    if (viewportWidth < mobileBreakpoint) {
      return math.max(240.0, viewportWidth - 32.0);
    }
    final maxAllowed = math.max(
      minDesktopWidth,
      viewportWidth * desktopMaxRatio,
    );
    return width.clamp(minDesktopWidth, maxAllowed).toDouble();
  }

  /// Infers an appropriate width from the structure and complexity of [form].
  static double inferFromLayoutForm(LayoutForm form) {
    var recommended = sm;

    if (form.multiForms.isNotEmpty) {
      recommended = math.max(recommended, lg);
    }

    final topLevelCount = form.components.length;
    if (topLevelCount > 4) {
      recommended = math.max(recommended, md);
    }

    final all = form.allComponents;
    for (final component in all) {
      if (component is ComponentFieldArray) {
        if (component.presentation == FieldArrayPresentation.table) {
          recommended = math.max(
            recommended,
            _tableWidthForColumns(component.columns.length),
          );
        } else {
          recommended = math.max(recommended, md);
        }
      } else if (component is ComponentTable) {
        recommended = math.max(
          recommended,
          _tableWidthForColumns(component.columns.length),
        );
      } else if (component is ComponentRow) {
        if (component.children.length >= 3) {
          recommended = math.max(recommended, lg);
        } else if (component.children.length == 2) {
          recommended = math.max(recommended, md);
        }
      } else if (component is ComponentForm) {
        if (component.children.length > 4) {
          recommended = math.max(recommended, md);
        }
      }
    }

    return recommended;
  }

  static double _tableWidthForColumns(int columnCount) {
    if (columnCount >= 6) return xxl;
    if (columnCount >= 4) return xl;
    return lg;
  }

  static double? _parseWidthSpec(Object? spec, double viewportWidth) {
    if (spec == null) return null;
    if (spec is num) {
      final value = spec.toDouble();
      return value > 0 ? value : null;
    }
    if (spec is String) {
      final normalized = spec.trim().toLowerCase();
      if (normalized.isEmpty || normalized == 'auto') return null;
      switch (normalized) {
        case 'sm':
        case 'small':
          return sm;
        case 'md':
        case 'medium':
          return md;
        case 'lg':
        case 'large':
          return lg;
        case 'xl':
          return xl;
        case 'xxl':
        case '2xl':
          return xxl;
        case 'full':
          return viewportWidth * desktopMaxRatio;
      }
      if (normalized.endsWith('%')) {
        final pct = double.tryParse(
          normalized.substring(0, normalized.length - 1).trim(),
        );
        if (pct != null && pct > 0) {
          return viewportWidth * (pct.clamp(10.0, 100.0) / 100.0);
        }
      }
      final parsed = double.tryParse(normalized);
      if (parsed != null && parsed > 0) {
        return parsed;
      }
    }
    return null;
  }
}
