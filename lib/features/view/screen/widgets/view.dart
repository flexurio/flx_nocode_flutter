import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

extension DViewWidget on DView {
  Widget buttonLarge(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
    bool bypassPermission, {
    bool expanded = false,
    VoidCallback? onRefresh,
    EntityCustom? entityOverride,
    bool forceLoading = false,
  }) {
    if (forceLoading) {
      return _buildLoading(context, expanded);
    }

    if (entityOverride != null) {
      return _buildButton(
        context,
        entityOverride,
        data,
        parentData,
        bypassPermission,
        expanded,
        onRefresh,
      );
    }

    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entity),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoading(context, expanded);
        }

        final e = snapshot.data;

        if (e == null) {
          return NoCodeError('Entity not found! Id: $entity');
        }

        return _buildButton(
          context,
          e,
          data,
          parentData,
          bypassPermission,
          expanded,
          onRefresh,
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context,
    EntityCustom e,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
    bool bypassPermission,
    bool expanded,
    VoidCallback? onRefresh,
  ) {
    return LightButton(
      action: DataAction.view,
      title: label,
      permission: null,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuCustom.fromId(
              parentData: List.from(parentData)..add(data),
              breadcrumbList: [e.label],
              entityId: entity,
              initialFilters: filters(e, data),
              bypassPermission: bypassPermission,
            ),
          ),
        );
        onRefresh?.call();
      },
      expanded: expanded,
    );
  }

  Widget _buildLoading(BuildContext context, bool expanded) {
    return LightButton(
      permission: null,
      action: DataAction.view,
      title: label,
      isInProgress: true,
      expanded: expanded,
      onPressed: () {},
    );
  }
}

extension ListDViewWidget on List<DView> {
  List<Widget> buildButtons(BuildContext context, Map<String, dynamic> data,
      List<Map<String, dynamic>> parentData, bool bypassPermission,
      {bool expanded = false, VoidCallback? onRefresh}) {
    const bool enableLog = false;

    if (enableLog) {
      print('\n======================================================');
      print('[View] buildButtons | Total items: ${this.length}');
    }

    final filtered = this.where((e) {
      if (e.rule == null) {
        if (enableLog) {
          print('------------------------------------------------------');
          print('[View] "${e.label}" -> SHOW (No Rule)');
        }
        return true;
      }

      final result = e.rule!.evaluate(data);

      if (enableLog) {
        print('------------------------------------------------------');
        print('[View] Checking Rule for "${e.label}"');
        print('Result    : ${result ? "✅ MATCH" : "❌ NO MATCH"}');
        print('Rules     : ${e.rule?.toMap()}');
        print('Data      : $data');
      }

      return result;
    }).toList();

    if (enableLog) {
      print('======================================================\n');
    }

    return filtered
        .map(
          (e) => e.buttonLarge(
            context,
            data,
            parentData,
            bypassPermission,
            expanded: expanded,
            onRefresh: onRefresh,
          ),
        )
        .toList();
  }
}
