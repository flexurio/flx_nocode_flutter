import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/currency.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ProductPriceCreatePage extends StatefulWidget {
  const ProductPriceCreatePage._({required this.product});

  final Product product;

  static Route<bool?> route({required Product product}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductPriceBloc()),
          BlocProvider(
            create: (context) => CurrencyQueryBloc()
              ..add(
                const CurrencyQueryEvent.fetch(),
              ),
          ),
        ],
        child: ProductPriceCreatePage._(product: product),
      ),
    );
  }

  @override
  State<ProductPriceCreatePage> createState() => _ProductNieCreatePageState();
}

class _ProductNieCreatePageState extends State<ProductPriceCreatePage> {
  late DateTime _periodStart;

  final _formKey = GlobalKey<FormState>();
  final _productPriceController = TextEditingController();
  late Currency _currency;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final event = ProductPriceEvent.create(
        productPrice: stringToInt(_productPriceController.text),
        periodStart: _periodStart,
        bonusPrice: 0,
        primaryPrice: 0,
        hppStrip: 0,
        stripPrice: 0,
        tabletPrice: 0,
        idCurrency: _currency.id,
        id: widget.product.id,
      );
      context.read<ProductPriceBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.productPrice;
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
          formKey: _formKey,
          action: action,
          entity: entity,
          children: [
            Column(
              children: [
                FieldDatePicker(
                  labelText: 'Start Date',
                  controller: TextEditingController(),
                  onChanged: (value) => _periodStart = value,
                  validator: requiredObjectValidator.call,
                ),
                const Gap(24),
                FDropDownSearchCurrency(
                  label: 'currency'.tr(),
                  onChanged: (currency) {
                    if (currency != null) {
                      _currency = currency;
                    }
                  },
                ),
                const Gap(24),
                FTextFormField(
                  labelText: 'Price',
                  controller: _productPriceController,
                  validator: requiredValidator.call,
                  maxLength: 50,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsFormatter(),
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
