import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductReturnCheckDeleteButton extends StatelessWidget {
  const ProductReturnCheckDeleteButton({
    required this.productReturnCheck,
    required this.productReturnDetail,
    required this.productReturnDetailQueryBloc,
    super.key,
  });

  final ProductReturnCheck productReturnCheck;
  final ProductReturnDetail productReturnDetail;
  final ProductReturnDetailQueryBloc productReturnDetailQueryBloc;

  static Widget prepare({
    required ProductReturnCheck productReturnCheck,
    required ProductReturnDetail productReturnDetail,
    required ProductReturnDetailQueryBloc productReturnDetailQueryBloc,
  }) {
    return BlocProvider(
      create: (context) => ProductReturnCheckBloc(),
      child: ProductReturnCheckDeleteButton(
        productReturnCheck: productReturnCheck,
        productReturnDetail: productReturnDetail,
        productReturnDetailQueryBloc: productReturnDetailQueryBloc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.delete;

    return LightButton(
      permission: PermissionProductStock.productReturnCheckDelete,
      action: action,
      onPressed: () async {
        final bloc = context.read<ProductReturnCheckBloc>();
        await _showDeleteDialog(
          context: context,
          bloc: bloc,
        ).then((value) {
          if (value ?? false) {
            Navigator.pop(context, true);  
            productReturnDetailQueryBloc.add(
              ProductReturnDetailQueryEvent.fetchById(
                productReturnId: productReturnDetail.productReturn.id,
                idDetail: productReturnDetail.id,
              ),
            );
          }
          
        });
      },
    );
  }

  Future<bool?> _showDeleteDialog({
    required BuildContext context,
    required ProductReturnCheckBloc bloc,
  }) {
    const action = DataAction.delete;
    final entity = Entity.productReturnCheck;
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<ProductReturnCheckBloc, ProductReturnCheckState>(
          bloc: bloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, entity);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error!),
              orElse: () {},
            );
          },
          child: BlocBuilder<ProductReturnCheckBloc, ProductReturnCheckState>(
            bloc: bloc,
            builder: (context, state) {
              return CardConfirmation(
                isProgress: state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                action: action,
                data: entity,
                label: productReturnCheck.productReturnId.id,
                onConfirm: () {
                  bloc.add(
                    ProductReturnCheckEvent.delete(
                      id: productReturnCheck.id,
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
