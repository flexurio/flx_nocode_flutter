import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class ProductPriceDetailCreatePage extends StatefulWidget {
  const ProductPriceDetailCreatePage({
    required this.product,
    required this.productPrice,
    super.key,
  });

  final Product product;
  final ProductPrice productPrice;

  static Route<bool?> route({
    required Product product,
    required ProductPrice productPrice,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductPriceBloc()),
        ],
        child: ProductPriceDetailCreatePage(
          product: product,
          productPrice: productPrice,
        ),
      ),
    );
  }

  @override
  State<ProductPriceDetailCreatePage> createState() =>
      _ProductPriceDetailCreatePageState();
}

class _ProductPriceDetailCreatePageState
    extends State<ProductPriceDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _bonusPriceController = TextEditingController();
  final _primaryPriceController = TextEditingController();
  final _hppStripController = TextEditingController();
  final _stripPriceController = TextEditingController();
  final _tabletPriceController = TextEditingController();
  final _qtyStripController = TextEditingController();
  final _qtyTabletController = TextEditingController();
  final _productPriceController = TextEditingController();

  @override
  void initState() {
    _hppStripController.text = widget.productPrice.stripHpp.format();
    _bonusPriceController.text = widget.productPrice.bonusPrice.format();
    _stripPriceController.text = widget.productPrice.stripPrice.format();
    _primaryPriceController.text = widget.productPrice.primaryPrice.format();
    _tabletPriceController.text = widget.productPrice.tabletPrice.format();
    _qtyStripController.text = widget.product.quantityStrip.toString();
    _qtyTabletController.text = widget.product.quantityTablet.toString();
    _productPriceController.text = widget.productPrice.price.toString();
    super.initState();
  }

  double valueStripHpp() {
    final primaryPrice = stringDecimalToDouble(
      _primaryPriceController.text == '0'
          ? '0.0'
          : _primaryPriceController.text,
    );
    final qtyStrip = stringDecimalToDouble(
      _qtyStripController.text.isEmpty ? '0.0' : _qtyStripController.text,
    );
    return qtyStrip != 0.0 ? primaryPrice / qtyStrip : 0.0;
  }

  double stripPrice() {
    final primaryPrice = stringDecimalToDouble(
      _productPriceController.text == '0'
          ? '0.0'
          : _productPriceController.text,
    );
    final qtyStrip = stringDecimalToDouble(
      _qtyStripController.text == '0' ? '0.0' : _qtyStripController.text,
    );
    return qtyStrip != 0.0 ? primaryPrice / qtyStrip : 0.0;
  }

  double tabletPrice() {
    final primaryPrice = stringDecimalToDouble(
      _productPriceController.text == '0'
          ? '0.0'
          : _productPriceController.text,
    );
    final qtyTablet = stringDecimalToDouble(
      _qtyTabletController.text == '0' ? '0.0' : _qtyTabletController.text,
    );
    return qtyTablet != 0.0 ? primaryPrice / qtyTablet : 0.0;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = ProductPriceEvent.edit(
        productPrice: widget.productPrice,
        periodStart: widget.productPrice.startDate,
        bonusPrice: stringDecimalToDouble(_bonusPriceController.text),
        primaryPrice: stringDecimalToDouble(_primaryPriceController.text),
        hppStrip: double.tryParse(valueStripHpp().toStringAsFixed(2)) ?? 0.0,
        stripPrice: double.tryParse(stripPrice().toStringAsFixed(2)) ?? 0.0,
        tabletPrice: double.tryParse(tabletPrice().toStringAsFixed(2)) ?? 0.0,
        currency: widget.productPrice.currency,
        product: widget.product,
        price: widget.productPrice.price,
      );
      context.read<ProductPriceBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.insertPrice;
    final entity = Entity.product;
    return BlocListener<ProductPriceBloc, ProductPriceState>(
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
        body: SingleFormPanel(
          formKey: _formKey,
          action: action,
          entity: entity,
          actions: [
            BlocBuilder<ProductPriceBloc, ProductPriceState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: action,
                );
              },
            ),
          ],
          children: [
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Product',
                  child: Text(widget.product.name),
                ),
                TileDataVertical(
                  label: 'currency'.tr(),
                  child: Text(widget.productPrice.currency.id),
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                TileDataVertical(
                  label: 'Start Date',
                  child: Text(widget.productPrice.startDate.yMMMMd),
                ),
                TileDataVertical(
                  label: 'Price',
                  child: Text(widget.productPrice.price.format()),
                ),
              ],
            ),
            const Gap(24),
            RowFields(
              children: [
                FTextFormField(
                  labelText: 'Bonus Price',
                  controller: _bonusPriceController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                  inputFormatters: [
                    currencyFormatter,
                  ],
                ),
                FTextFormField(
                  labelText: 'Primary Price',
                  controller: _primaryPriceController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                  inputFormatters: [
                    currencyFormatter,
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
