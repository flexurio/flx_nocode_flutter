import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/model/entity_field.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flexurio_no_code/src/app/view/widget/filter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilterField extends StatelessWidget {
  const FilterField({
    super.key,
    required this.isSmallScreen,
    required this.index,
    required this.setValue,
    required this.removeFilter,
    required this.filter,
    required this.fields,
    required this.addFilter,
  });

  final bool isSmallScreen;
  final int index;
  final void Function(int index, String value) setValue;
  final void Function(int index) removeFilter;
  final Filter filter;
  final void Function(int index, List<EntityField> field) addFilter;
  final List<EntityField> fields;

  @override
  Widget build(BuildContext context) {
    return isSmallScreen
        ? _buildFilterItemSmall(index)
        : _buildFilterItemLarge(index);
  }

  Widget _buildFieldValue(int index) {
    return FTextFieldSmall(
      hintText: 'value'.tr(),
      controller: TextEditingController(text: filter.value),
      onChanged: (p0) {
        setValue(index, p0);
      },
    );
  }

  Widget _buildButtonRemove(int index) {
    return LightButtonSmall(
      action: DataAction.delete,
      title: 'Filter',
      permission: null,
      onPressed: () => removeFilter(index),
    );
    // return IconButton(
    //   icon: Icon(
    //     Icons.delete_outline_rounded,
    //     color: Colors.red,
    //   ),
    //   onPressed: () => _removeFilter(index),
    // );
  }

  Widget _buildFilterItemSmall(int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildFieldName(index),
          Gap(12),
          _buildFieldValue(index),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildButtonRemove(index),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldName(int index) {
    return FilterFieldName(
      index: index,
      fields: fields,
      addFilter: addFilter,
      filter: filter,
    );
  }

  Widget _buildFilterItemLarge(int index) {
    return Row(
      children: [
        Expanded(child: _buildFieldName(index)),
        Gap(12),
        Expanded(child: _buildFieldValue(index)),
        Gap(12),
        _buildButtonRemove(index),
      ],
    );
  }
}

class FilterFieldName extends StatelessWidget {
  const FilterFieldName({
    super.key,
    required this.index,
    required this.fields,
    required this.addFilter,
    required this.filter,
  });

  final int index;
  final List<EntityField> fields;
  final Filter? filter;
  final void Function(int index, List<EntityField> field) addFilter;

  @override
  Widget build(BuildContext context) {
    return FDropDownSearchSmallMultiple<EntityField>(
      labelText: 'field'.tr(),
      initialValue: index == -1
          ? []
          : fields
              .where((e) => filter!.reference.split('|').contains(e.reference))
              .toList(),
      itemAsString: (data) => data.label,
      items: fields,
      onChanged: (entityField) {
        addFilter(index, entityField);
      },
      iconField: Icons.business_rounded,
    );
  }
}
