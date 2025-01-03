import 'package:flexurio_chiron_product/src/app/bloc/product_group/product_group_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class ProductGroupCreatePage extends StatefulWidget {
  const ProductGroupCreatePage({super.key});

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: BlocProvider(
        create: (context) => ProductGroupBloc(),
        child: const ProductGroupCreatePage(),
      ),
    );
  }

  @override
  State<ProductGroupCreatePage> createState() => _ProductGroupCreatePageState();
}

class _ProductGroupCreatePageState extends State<ProductGroupCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductGroupBloc>().add(
            ProductGroupEvent.create(
              _idController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productGroup;
    return BlocListener<ProductGroupBloc, ProductGroupState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          success: () {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, true);
          },
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<ProductGroupBloc, ProductGroupState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: action,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              labelText: 'ID',
              controller: _idController,
              validator: requiredValidator.call,
              maxLength: 30,
            ),
          ],
        ),
      ),
    );
  }
}
