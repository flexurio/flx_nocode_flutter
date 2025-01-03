import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class FDropDownSmallSearchYear extends StatelessWidget
    implements DropDownObject<int> {
  const FDropDownSmallSearchYear({
    required this.onChanged,
    required this.minDate,
    required this.maxDate,
    super.key,
    this.initialValue,
    this.enabled = true,
    this.label,
  });

  @override
  final int? initialValue;

  @override
  final void Function(int?) onChanged;

  @override
  final String? label;

  @override
  final bool enabled;

  final DateTime minDate;
  final DateTime maxDate;

  @override
  Widget build(BuildContext context) {
    final maxYear = maxDate.year;
    final minYear = minDate.year;
    final years = <int>[];
    for (var i = maxYear; i >= minYear; i--) {
      years.add(i);
    }

    return DropDownSmall<int>(
      icon: Icons.calendar_month_rounded,
      initialValue: initialValue,
      labelText: 'year'.tr(),
      itemAsString: (year) => year.toString(),
      items: years,
      onChanged: onChanged,
    );
  }

  @override
  bool get isRequired => throw UnimplementedError();
}
