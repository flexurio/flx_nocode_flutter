import 'package:flexurio_chiron_product/src/app/bloc/product_formulation/product_formulation_bloc.dart';
import 'package:flexurio_chiron_product/src/app/bloc/product_formulation_query/product_formulation_query_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductFormulationConfirmButton extends StatelessWidget {
  const ProductFormulationConfirmButton._({
    required this.id,
    required this.isExternal,
  });

  final bool isExternal;

  static Widget prepare({
    required int id,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                ProductFormulationBloc(isExternal: isExternal)),
        BlocProvider(
          create: (context) =>
              ProductFormulationQueryBloc(isExternal: isExternal),
        ),
      ],
      child: ProductFormulationConfirmButton._(id: id, isExternal: isExternal),
    );
  }

  final int id;

  @override
  Widget build(BuildContext context) {
    return Button(
      permission: null,
      color: Colors.blue,
      onPressed: () {
        final bloc = context.read<ProductFormulationBloc>();
        final queryBloc = context.read<ProductFormulationQueryBloc>();
        _showConfirmDialog(context, bloc).then((success) {
          if (success ?? false) {
            queryBloc.add(const ProductFormulationQueryEvent.fetch());
            Navigator.pop(context, true);
          }
        });
      },
      action: DataAction.confirm,
    );
  }

  Future<bool?> _showConfirmDialog(
    BuildContext context,
    ProductFormulationBloc bloc,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        const action = DataAction.confirm;
        final entity = Entity.billOfMaterial;
        return BlocListener<ProductFormulationBloc, ProductFormulationState>(
          bloc: bloc,
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
          child: BlocBuilder<ProductFormulationBloc, ProductFormulationState>(
            bloc: bloc,
            builder: (context, state) {
              return CardForm(
                popup: true,
                title: 'are_you_sure'.tr(),
                icon: FontAwesomeIcons.exclamationTriangle,
                actions: [
                  Button(
                    permission: null,
                    color: Colors.white,
                    onPressed: state.maybeWhen(
                      loading: () => null,
                      orElse: () => () {
                        Navigator.pop(context);
                      },
                    ),
                    action: DataAction.cancel,
                  ),
                  const SizedBox(width: 10),
                  Button(
                    permission: null,
                    color: Colors.blue,
                    isInProgress: state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    ),
                    onPressed: () {
                      bloc.add(ProductFormulationEvent.confirm(id));
                    },
                    action: DataAction.confirm,
                  ),
                ],
                child: Text(confirmationMessage(entity, action, null)),
              );
            },
          ),
        );
      },
    );
  }
}
