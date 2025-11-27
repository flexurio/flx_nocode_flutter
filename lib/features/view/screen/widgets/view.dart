import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';

extension DViewWidget on DView {
  Widget buttonLarge(
    BuildContext context,
    Map<String, dynamic> data,
    List<Map<String, dynamic>> parentData,
    bool bypassPermission,
  ) {
    return FutureBuilder<EntityCustom?>(
      future: EntityCustom.getEntity(entity),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            width: 24,
            height: 24,
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }

        final e = snapshot.data;

        if (e == null) {
          return NoCodeError('Entity not found! Id: $entity');
        }

        return LightButton(
          action: DataAction.view,
          title: label,
          permission: null,
          onPressed: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuCustom.fromId(
                  parentData: List.from(parentData)..add(data),
                  breadcrumbList: [e.label],
                  entityId: this.entity,
                  initialFilters: filters(e, data),
                  bypassPermission: bypassPermission,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

extension ListDViewWidget on List<DView> {
  List<Widget> buildButtons(BuildContext context, Map<String, dynamic> data,
      List<Map<String, dynamic>> parentData, bool bypassPermission) {
    return this
        .map(
          (e) => e.buttonLarge(
            context,
            data,
            parentData,
            bypassPermission,
          ),
        )
        .toList();
  }
}
