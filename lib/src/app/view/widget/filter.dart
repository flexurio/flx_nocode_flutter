import 'package:appointment/src/app/model/entity_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.onFilterChanged,
    required this.currentFilters,
    required this.fields,
  });

  final List<EntityField> fields;
  final List<Filter> currentFilters;
  final void Function(List<Filter> filters) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = currentFilters.length;
    return Badge.count(
      isLabelVisible: count > 0,
      count: count,
      child: LightButtonSmall(
        action: DataAction.filter,
        permission: null,
        onPressed: () async {
          final filters = await showDialog<List<Filter>?>(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: theme.cardColor,
              child: Container(
                padding: const EdgeInsets.all(24),
                width: 600,
                child: FormFilter(
                  fields: fields,
                  filters: currentFilters,
                ),
              ),
            ),
          );
          if (filters != null) {
            onFilterChanged(filters);
          }
        },
      ),
    );
  }
}

class FormFilter extends StatefulWidget {
  const FormFilter({super.key, required this.fields, required this.filters});

  final List<EntityField> fields;
  final List<Filter> filters;

  @override
  State<FormFilter> createState() => _FormFilterState();
}

class _FormFilterState extends State<FormFilter> {
  final _filters = <Filter>[];

  @override
  void initState() {
    super.initState();
    _filters.addAll(widget.filters);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_filters.isNotEmpty)
          ...List.generate(
            _filters.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Expanded(child: _buildFieldName(index)),
                  Gap(12),
                  Expanded(
                    child: FTextFormField(
                      labelText: 'value'.tr(),
                      controller:
                          TextEditingController(text: _filters[index].value),
                      onChanged: (p0) {
                        _setValue(index, p0);
                      },
                    ),
                  ),
                  Gap(12),
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () => _removeFilter(index),
                  ),
                ],
              ),
            ),
          ),
        if (_filters.isEmpty) Gap(12),
        _buildFieldName(-1),
        Gap(12),
        Button(
          action: DataAction.applyFilter,
          permission: null,
          onPressed: () {
            Navigator.pop(context, _filters);
          },
        ).pullRight(),
      ],
    );
  }

  void _addFilter(int index, EntityField field) {
    if (index == -1) {
      _filters.add(
        Filter(
          reference: field.reference,
          label: field.label,
          value: '',
        ),
      );
    } else {
      _filters[index] = _filters[index].copyWith(reference: field.reference);
    }

    setState(() {});
  }

  void _setValue(int index, String value) {
    _filters[index] = _filters[index].copyWith(value: value);
  }

  void _removeFilter(int index) {
    _filters.removeAt(index);
    setState(() {});
  }

  Widget _buildFieldName(int index) {
    return FDropDownSearch<EntityField>(
      labelText: 'field'.tr(),
      initialValue: index == -1
          ? null
          : widget.fields
              .firstWhere((e) => e.reference == _filters[index].reference),
      itemAsString: (data) => data.label,
      items: widget.fields,
      onChanged: (entityField) {
        _addFilter(index, entityField!);
      },
    );
  }
}

class Filter {
  final String label;
  final String reference;
  final String value;

  Filter({required this.label, required this.reference, required this.value});

  Filter copyWith({
    String? reference,
    String? value,
    String? label,
  }) {
    return Filter(
      label: label ?? this.label,
      reference: reference ?? this.reference,
      value: value ?? this.value,
    );
  }
}
