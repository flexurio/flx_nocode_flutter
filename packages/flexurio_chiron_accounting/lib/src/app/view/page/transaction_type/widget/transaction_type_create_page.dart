import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type/transaction_type_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/transaction_type_query/transaction_type_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TransactionTypeCreatePage extends StatefulWidget {
  const TransactionTypeCreatePage({super.key, this.transactionTypes});

  final TransactionType? transactionTypes;

  static Widget prepare({TransactionType? transactionTypes}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TransactionTypeBloc()),
        BlocProvider(create: (context) => TransactionTypeQueryBloc()),
      ],
      child: TransactionTypeCreatePage(
        transactionTypes: transactionTypes,
      ),
    );
  }

  @override
  State<TransactionTypeCreatePage> createState() =>
      _TransactionTypeCreatePageState();
}

class _TransactionTypeCreatePageState extends State<TransactionTypeCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _valueController = TextEditingController();
  late TransactionTypeFlag _flag;
  late TypeTransaction _type;

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.transactionTypes);

    if (_action.isEdit) {
      _idController.text = widget.transactionTypes!.id;
      _nameController.text = widget.transactionTypes!.name;
      _flag = widget.transactionTypes!.flag;
      _codeController.text = widget.transactionTypes!.code;
      _valueController.text = widget.transactionTypes!.value!;
      _type = widget.transactionTypes!.type;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<TransactionTypeBloc>().add(
              TransactionTypeEvent.update(
                id: _idController.text,
                name: _nameController.text,
                value: _valueController.text,
              ),
            );
      } else {
        context.read<TransactionTypeBloc>().add(
              TransactionTypeEvent.create(
                id: _idController.text,
                name: _nameController.text,
                code: _codeController.text,
                flag: _flag,
                value: _valueController.text,
                type: _type,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.transactionType;
    return BlocListener<TransactionTypeBloc, TransactionTypeState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Toast(context).dataChanged(_action, entity);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            BlocBuilder<TransactionTypeBloc, TransactionTypeState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                );
              },
            ),
          ],
          children: [
            FTextFormField(
              enabled: _action.isCreate,
              labelText: 'ID',
              controller: _idController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FDropDownSearch<TypeTransaction>(
              labelText: 'Type',
              itemAsString: (type) => type.label,
              items: TypeTransaction.list,
              enabled: _action.isCreate,
              validator: requiredObjectValidator.call,
              initialValue: widget.transactionTypes?.type,
              onChanged: (type) {
                if (type != null) {
                  _type = type;
                }
              },
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Name',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              enabled: _action.isCreate,
              labelText: 'Code',
              controller: _codeController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FDropDownSearch<TransactionTypeFlag>(
              validator: requiredObjectValidator.call,
              enabled: _action.isCreate,
              labelText: 'Flag',
              itemAsString: (listFlag) => listFlag.label,
              items: TransactionTypeFlag.list,
              initialValue: widget.transactionTypes?.flag,
              onChanged: (listFlag) {
                if (listFlag != null) {
                  _flag = listFlag;
                }
              },
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Value',
              controller: _valueController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
