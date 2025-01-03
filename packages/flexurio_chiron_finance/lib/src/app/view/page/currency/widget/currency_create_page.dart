import 'package:flexurio_chiron_finance/src/app/bloc/currency/currency_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCreatePage extends StatefulWidget {
  const CurrencyCreatePage({
    super.key,
  });

  static Route<Currency?> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => CurrencyBloc(),
        child: const CurrencyCreatePage(),
      ),
    );
  }

  @override
  State<CurrencyCreatePage> createState() => _CurrencyCreatePageState();
}

class _CurrencyCreatePageState extends State<CurrencyCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const action = DataAction.create;
    final entity = Entity.currency;
    return BlocListener<CurrencyBloc, CurrencyState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: (currency) {
            Toast(context).dataChanged(action, entity);
            Navigator.pop(context, currency);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          action: action,
          entity: entity,
          formKey: _formKey,
          actions: [
            BlocBuilder<CurrencyBloc, CurrencyState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<CurrencyBloc>().add(
                            CurrencyBlocEvent.create(
                              id: _idController.text,
                            ),
                          );
                    }
                  },
                  action: action,
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
