/// A class that represents a theme with a primary color and a soft color.
class ThemeC {
  /// The primary color of the theme, represented as a hexadecimal string (e.g., '#F0F0F0').
  final String color;

  /// The soft or secondary color of the theme, also represented as a hexadecimal string.
  final String colorSoft;

  /// Creates a [ThemeC] instance.
  ///
  /// The [color] and [colorSoft] parameters have default values of '#F0F0F0' if not provided.
  ThemeC({
    this.color = '#F0F0F0',
    this.colorSoft = '#F0F0F0',
  });

  /// Creates a [ThemeC] instance from a JSON object.
  ///
  /// The JSON object must contain keys 'color' and 'color_soft' with corresponding string values.
  factory ThemeC.fromJson(Map<String, dynamic> json) {
    return ThemeC(
      color: json['color'],
      colorSoft: json['color_soft'],
    );
  }

  /// Converts this [ThemeC] instance into a JSON object.
  ///
  /// The returned map contains keys 'color' and 'color_soft' with their respective values.
  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'color_soft': colorSoft,
    };
  }

  /// Creates a copy of this [ThemeC] instance with the given fields replaced by the new values.
  ThemeC copyWith({
    String? color,
    String? colorSoft,
  }) {
    return ThemeC(
      color: color ?? this.color,
      colorSoft: colorSoft ?? this.colorSoft,
    );
  }
}
