import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/entity_create_button_old.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';
import 'package:flutter/material.dart';

class MenuDataTableActions extends StatelessWidget {
  const MenuDataTableActions({
    super.key,
    required this.entity,
    required this.parentData,
    required this.embedded,
    required this.bypassPermission,
    required this.filters,
    required this.refreshButton,
    required this.onFilterChanged,
    required this.onRefresh,
  });

  final EntityCustom entity;
  final List<Map<String, dynamic>> parentData;
  final bool embedded;
  final bool bypassPermission;
  final List<Filter> filters;
  final Widget refreshButton;
  final ValueChanged<List<Filter>> onFilterChanged;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      crossAxisAlignment: WrapCrossAlignment.end,
      runAlignment: WrapAlignment.end,
      alignment: WrapAlignment.end,
      children: [
        _buildButtonExports(),
        FilterButton(
          fields: entity.filters.isNotEmpty
              ? entity.filters
                  .map((e) => entity.getField(e.reference))
                  .whereType<EntityField>()
                  .toList()
              : entity.fields,
          currentFilters: filters,
          onFilterChanged: onFilterChanged,
        ),
        ..._buildHomeActions(context),
        refreshButton,
        ...entity.actionsHome.map((e) => e.buildButtonRegular(
              context: context,
              entity: entity,
              parentData: parentData,
              filters: filters.toMap(),
              bypassPermission: bypassPermission,
              onSuccess: onRefresh,
            )),
      ],
    );
  }

  Widget _buildButtonExports() {
    final exportButtons = entity.exports
        .where((e) => e.visibility)
        .map((e) => e.buildButton(filters: filters))
        .toList();
    if (exportButtons.isEmpty) return const SizedBox.shrink();
    return LightButtonSmallGroup(
      action: DataAction.export,
      childrenList: exportButtons,
    );
  }

  List<Widget> _buildHomeActions(BuildContext context) {
    final actions = entity.layoutForm.homeActionForms;
    return actions.map((action) {
      return LightButtonSmall(
        title: action.label,
        action: DataAction.reprocess,
        permissions: null,
        onPressed: () async {
          await Navigator.push(
            context,
            EntityCreatePageOld.route(
              layoutForm: action,
              entity: entity,
              onSuccess: (_) => onRefresh(),
              embedded: false,
              parentData: parentData,
              filters: filters.toMap(),
            ),
          );
        },
      );
    }).toList();
  }
}
