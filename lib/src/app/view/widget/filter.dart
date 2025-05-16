import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/form_filter.dart';
import 'package:flutter/material.dart';
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
          final isSmall = screenIdentifier.conditions(sm: true, md: false);

          return LightButtonSmall(
            action: DataAction.filter,
            permission: null,
            onPressed: () async {
              final formFilter = FormFilter(
                isSmallScreen: isSmall,
                fields: fields,
                filters: currentFilters,
              );

              List<Filter>? filters;
              if (isSmall) {
                filters = await showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => FractionallySizedBox(
                    heightFactor: 0.9,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 24,
                      ),
                      child: formFilter,
                    ),
                  ),
                );
              } else {
                filters = await showDialog<List<Filter>?>(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      width: 600,
                      child: formFilter,
                    ),
                  ),
                );
              }

              if (filters != null) {
                onFilterChanged(filters);
              }
            },
          );
        },
      ),
    );
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
      borderRadius: BorderRadius.circular(6),
    );

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
