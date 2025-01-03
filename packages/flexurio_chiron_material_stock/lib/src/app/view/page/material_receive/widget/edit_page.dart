import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive/material_receive_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_receive_create/widget/purchase_form.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveFormEditPage extends StatefulWidget {
  const MaterialReceiveFormEditPage._(this.materialReceive);

  final MaterialReceive materialReceive;

  static Widget prepare(
      {required MaterialReceive materialReceive, required bool isExternal}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialReceiveBloc(
            isExternal: false,
          )..add(MaterialReceiveEvent.initialize(materialReceive)),
        ),
        BlocProvider(create: (context) => MaterialQueryBloc()),
      ],
      child: MaterialReceiveFormEditPage._(materialReceive),
    );
  }

  @override
  State<MaterialReceiveFormEditPage> createState() =>
      _MaterialReceiveFormEditPageState();
}

class _MaterialReceiveFormEditPageState
    extends State<MaterialReceiveFormEditPage> {
  @override
  Widget build(BuildContext context) {
    const action = DataAction.edit;
    final entity = EntityMaterialStock.materialReceive;

    return BlocListener<MaterialReceiveBloc, MaterialReceiveState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<MaterialReceiveBloc, MaterialReceiveState>(
          builder: (context, state) {
            return SingleFormPanel(
              action: action,
              entity: entity,
              children: [
                MaterialReceiveCreatePurchaseForm.prepare(
                  type: widget.materialReceive.type,
                  onMaterialGroupSelected: (_) => true,
                  onNext: () {},
                  onPrevious: () {},
                  materialReceive: widget.materialReceive,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
