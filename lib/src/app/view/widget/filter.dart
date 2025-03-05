import 'package:flexurio_no_code/src/app/model/entity_field.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/view/widget/filter_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:screen_identifier/screen_identifier.dart';

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
    final count = currentFilters.length;
    return Badge.count(
      isLabelVisible: count > 0,
      count: count,
      child: ScreenIdentifierBuilder(
        builder: (context, screenIdentifier) {
          return LightButtonSmall(
            action: DataAction.filter,
            permission: null,
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.9,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 24,
                    ),
                    child: FormFilter(
                      isSmallScreen: true,
                      fields: fields,
                      filters: currentFilters,
                    ),
                  ),
                ),
              );

              // final filters = await showDialog<List<Filter>?>(
              //   context: context,
              //   builder: (context) => Dialog(
              //     backgroundColor: theme.cardColor,
              //     child: Container(
              //       padding: const EdgeInsets.all(24),
              //       width: 600,
              //       child: FormFilter(
              //         fields: fields,
              //         filters: currentFilters,
              //       ),
              //     ),
              //   ),
              // );
              // if (filters != null) {
              //   onFilterChanged(filters);
              // }
            },
          );
        },
      ),
    );
  }
}

class FormFilter extends StatefulWidget {
  const FormFilter({
    super.key,
    required this.fields,
    required this.filters,
    required,
    required this.isSmallScreen,
  });

  final List<EntityField> fields;
  final List<Filter> filters;
  final bool isSmallScreen;

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
              padding: const EdgeInsets.only(bottom: 6),
              child: FilterField(
                addFilter: _addFilter,
                fields: widget.fields,
                index: index,
                isSmallScreen: widget.isSmallScreen,
                setValue: _setValue,
                removeFilter: _removeFilter,
                filter: _filters[index],
              ),
            ),
          ),
        if (_filters.isEmpty) Gap(6),
        _buildFilterFirstLarge(),
        Gap(12),
        Button(
          action: DataAction.applyFilter,
          permission: null,
          onPressed: () => Navigator.pop(context, _filters),
        ).pullRight(),
      ],
    );
  }

  void _setValue(int index, String value) {
    _filters[index] = _filters[index].copyWith(value: value);
  }

  void _removeFilter(int index) {
    _filters.removeAt(index);
    setState(() {});
  }

  Widget _buildFilterFirstLarge() {
    return Row(
      children: [
        Expanded(
          child: FilterFieldName(
            index: -1,
            fields: widget.fields,
            addFilter: _addFilter,
            filter: null,
          ),
        ),
        Gap(12),
        Spacer(),
        Gap(12),
        SizedBox(width: 39),
      ],
    );
  }

  void _addFilter(int index, List<EntityField> field) {
    final reference = field.map((e) => e.reference).join('|');
    if (index == -1) {
      _filters.add(
        Filter(reference: reference, value: ''),
      );
    } else {
      _filters[index] = _filters[index].copyWith(reference: reference);
    }

    setState(() {});
  }
}

class FTextFieldSmall extends StatelessWidget {
  const FTextFieldSmall({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.modeCondition(
      Colors.blueGrey.shade100,
      const Color(0xff343640),
    );

    final border = OutlineInputBorder(
        borderSide: BorderSide(color: borderColor),
        borderRadius: BorderRadius.circular(6));

    return SizedBox(
      height: isPlatformMobile() ? 36 : 32,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 12),
          enabledBorder: border,
          border: border,
          focusedBorder: border,
        ),
        style: const TextStyle(fontSize: 14),
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}
