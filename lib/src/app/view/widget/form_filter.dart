import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            'Filter',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        _buildListFilter(),
        Gap(12),
        _buildButtonApplyFilter(),
      ],
    );
  }

  Widget _buildListFilter() {
    final children = <Widget>[
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
      _buildFilterEmpty(),
    ];
    if (widget.isSmallScreen) {
      return Expanded(
        child: SingleChildScrollView(child: Column(children: children)),
      );
    } else {
      return Column(children: children);
    }
  }

  Widget _buildButtonApplyFilter() {
    return Button.action(
      action: DataAction.applyFilter,
      permission: null,
      onPressed: () => Navigator.pop(context, _filters),
    ).pullRight();
  }

  void _setValue(int index, String value) {
    _filters[index] = _filters[index].copyWith(value: value);
  }

  void _removeFilter(int index) {
    _filters.removeAt(index);
    setState(() {});
  }

  Widget _buildFilterEmpty() {
    final child = FilterFieldName(
      index: -1,
      fields: widget.fields,
      addFilter: _addFilter,
      filter: null,
    );
    if (widget.isSmallScreen) {
      return Row(
        children: [Expanded(child: child)],
      );
    } else {
      return Row(
        children: [
          Expanded(child: child),
          Gap(12),
          Spacer(),
          Gap(12),
          SizedBox(width: 39),
        ],
      );
    }
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
