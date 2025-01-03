import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/review_form.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class MaterialReturnDetailPage extends StatefulWidget {
  const MaterialReturnDetailPage._({
    required this.materialReturn,
    required this.action,
    required this.isExternal,
  });

  final MaterialReturn materialReturn;
  final DataAction action;
  final bool isExternal;
  @override
  State<MaterialReturnDetailPage> createState() =>
      _MaterialReturnDetailPageState();

  static Route<bool?> route({
    required MaterialReturn materialReturn,
    required DataAction action,
    required bool isExternal,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MaterialReturnBloc()
              ..add(
                MaterialReturnEvent.initialize(materialReturn, isExternal),
              ),
          ),
        ],
        child: MaterialReturnDetailPage._(
          materialReturn: materialReturn,
          action: action,
          isExternal: isExternal,
        ),
      ),
    );
  }
}

class _MaterialReturnDetailPageState extends State<MaterialReturnDetailPage> {
  @override
  Widget build(BuildContext context) {
    final entity = widget.isExternal
        ? Entity.materialReturnExternal
        : Entity.materialReturn;
    final bloc = context.read<MaterialReturnBloc>();

    return BlocListener<MaterialReturnBloc, MaterialReturnState>(
      bloc: bloc,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () async {
            Toast(context).dataChanged(widget.action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: widget.action,
          entity: entity,
          children: [
            MaterialReturnCreateReviewForm(
              onPrevious: () {},
              materialReturn: widget.materialReturn,
              action: widget.action,
              bloc: bloc,
              isExternal: widget.isExternal,
            ),
          ],
        ),
      ),
    );
  }
}
