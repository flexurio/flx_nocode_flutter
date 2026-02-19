enum ComponentSizeMode {
  fill,
  hug,
  fixed;

  static ComponentSizeMode? fromString(String? value) {
    if (value == null) return null;
    try {
      return ComponentSizeMode.values.byName(value);
    } catch (_) {
      return null;
    }
  }

  String get label {
    switch (this) {
      case ComponentSizeMode.fill:
        return 'Fill';
      case ComponentSizeMode.hug:
        return 'Hug';
      case ComponentSizeMode.fixed:
        return 'Fixed';
    }
  }
}
