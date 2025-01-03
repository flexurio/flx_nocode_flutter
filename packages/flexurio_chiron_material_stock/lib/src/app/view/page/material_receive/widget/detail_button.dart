import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_view/material_receive_view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailButton extends StatelessWidget {
  const MaterialReceiveDetailButton({
    required this.materialReceive,
    required this.action,
    required this.detail,
    required this.isExternal,
    super.key,
  });

  final MaterialReceive materialReceive;
  final DataAction action;
  final MaterialReceiveDetail detail;
  final bool isExternal;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: action,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => MaterialReceiveDetailPage.prepare(
              materialReceive: materialReceive,
              action: action,
              detail: detail,
              isExternal: isExternal,
            ),
          ),
        ).then((value) {
          if (value ?? false) {
            context.read<MaterialReceiveDetailQueryBloc>().add(
                  MaterialReceiveDetailQueryEvent.fetch(
                    materialReceive: materialReceive,
                  ),
                );
          }
        });
      },
    );
  }
}
