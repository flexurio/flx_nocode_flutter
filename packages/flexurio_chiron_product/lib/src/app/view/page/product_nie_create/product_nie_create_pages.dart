import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class ProductNieCreatePage extends StatefulWidget {
  const ProductNieCreatePage._({required this.product, this.productNie});

  final ProductNie? productNie;
  final Product? product;

  static Route<bool?> route({ProductNie? productNie, Product? product}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductNieBloc()),
        ],
        child: ProductNieCreatePage._(
          productNie: productNie,
          product: product,
        ),
      ),
    );
  }

  @override
  State<ProductNieCreatePage> createState() => _ProductNieCreatePageState();
}

class _ProductNieCreatePageState extends State<ProductNieCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _periodStartController = TextEditingController();
  final _periodEndController = TextEditingController();
  final _publisherController = TextEditingController();
  late ProductNieCategory _category;

  @override
  void initState() {
    super.initState();
    _action = createOrEdit(widget.productNie);
    if (_action.isEdit) {
      _idController.text = widget.productNie!.id;
      _periodStartController.text =
          DateFormat().format(widget.productNie!.periodStart);
      _periodEndController.text =
          DateFormat().format(widget.productNie!.periodEnd);
      _publisherController.text = widget.productNie!.publisher;
      _category = widget.productNie!.category;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ProductNieBloc>().add(
            ProductNieEvent.create(
              id: _idController.text,
              periodEnd: _periodEndController.text,
              periodStart: _periodStartController.text,
              publisher: _publisherController.text,
              productId: widget.product!.id,
              category: _category,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final toast = Toast(context);
    final publisherList = ['BPOM', 'KEMENKES RI'];
    return BlocListener<ProductNieBloc, ProductNieState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (success) {
            toast.success(success!);
            Navigator.pop(context, true);
          },
          error: (error) {
            toast.fail(error);
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.productNie,
          actions: [
            BlocBuilder<ProductNieBloc, ProductNieState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            Column(
              children: [
                FTextFormField(
                  labelText: 'NIE',
                  controller: _idController,
                  validator: requiredValidator.call,
                  maxLength: 20,
                ),
                const Gap(24),
                FDropDownSearch<ProductNieCategory>(
                  labelText: 'Category',
                  itemAsString: (category) => category.label,
                  items: ProductNieCategory.list,
                  validator: requiredObjectValidator.call,
                  onChanged: (category) {
                    if (category != null) {
                      _category = category;
                    }
                  },
                ),
                const Gap(24),
                RowFields(
                  children: [
                    FieldDatePicker(
                      labelText: 'Period Start',
                      controller: _periodStartController,
                      maxDate: DateTime.now(),
                      validator: requiredObjectValidator.call,
                    ),
                    FieldDatePicker(
                      labelText: 'Period End',
                      controller: _periodEndController,
                      validator: requiredObjectValidator.call,
                      minDate: DateTime.now(),
                    ),
                  ],
                ),
                const Gap(24),
                FDropDownSearch<String>(
                  validator: requiredObjectValidator.call,
                  labelText: 'Publisher',
                  items: publisherList,
                  onChanged: (publisherList) {
                    _publisherController.text = publisherList!;
                  },
                  itemAsString: (publisherList) => publisherList,
                  initialValue: widget.productNie?.publisher,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
