import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/rate_bloc/rate_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RateCreatePage extends StatefulWidget {
  const RateCreatePage._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RateBloc()),
        BlocProvider(
          create: (context) =>
              CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
        ),
      ],
      child: const RateCreatePage._(),
    );
  }

  @override
  State<RateCreatePage> createState() => _RateCreatePageState();
}

class _RateCreatePageState extends State<RateCreatePage> {
  late Currency _currency;
  late DateTime _validityDate;
  final _formKey = GlobalKey<FormState>();
  final _validityController = TextEditingController();
  final _rateController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<RateBloc>().add(
            RateBlocEvent.create(
              validityDate: _validityDate,
              currency: _currency,
              rate: int.parse(_rateController.text),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.rate;
    return BlocListener<RateBloc, RateBlocState>(
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
            BlocBuilder<RateBloc, RateBlocState>(
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
            BlocBuilder<CurrencyQueryBloc, CurrencyQueryState>(
              builder: (context, state) {
                return FDropDownSearch<Currency>(
                  labelText: 'currency'.tr(),
                  status: state.maybeWhen(
                    error: (_) => Status.error,
                    loading: (_) => Status.progress,
                    orElse: () => Status.loaded,
                  ),
                  validator: requiredObjectValidator.call,
                  itemAsString: (currencies) => currencies.id,
                  items: state.maybeWhen(
                    orElse: () => [],
                    loaded: (currencies) => currencies.data.toList(),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      _currency = value;
                    }
                  },
                );
              },
            ),
            const Gap(12),
            FieldDatePicker(
              labelText: 'Validity Date',
              controller: _validityController,
              validator: requiredObjectValidator.call,
              onChanged: (value) => _validityDate = value,
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Rate',
              controller: _rateController,
              validator: requiredValidator.call,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 500,
            ),
          ],
        ),
      ),
    );
  }
}
