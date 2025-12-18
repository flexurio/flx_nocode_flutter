enum FormType {
  home,
  view,
  create,
  update;

  factory FormType.fromString(String? s) {
    if (s == null) return FormType.create;
    try {
      return FormType.values.byName(s);
    } catch (_) {
      throw ArgumentError('Invalid FormType: $s');
    }
  }
}

extension FormTypeExtension on FormType {
  bool get isHome => this == FormType.home;
  bool get isView => this == FormType.view;
  bool get isCreate => this == FormType.create;
  bool get isUpdate => this == FormType.update;
}
