import 'package:flexurio_chiron_accounting/src/app/bloc/balance_group/balance_group_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:appointment/src/app/view/widget/select_field_chip.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class BalanceGroupCreatePage extends StatefulWidget {
  const BalanceGroupCreatePage._(this.balanceGroup);

  final BalanceGroup? balanceGroup;

  static Route<bool?> route({BalanceGroup? balanceGroup}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BalanceGroupBloc(),
          ),
        ],
        child: BalanceGroupCreatePage._(balanceGroup),
      ),
    );
  }

  @override
  State<BalanceGroupCreatePage> createState() => _BalanceGroupCreatePageState();
}

class _BalanceGroupCreatePageState extends State<BalanceGroupCreatePage> {
  final _formKey = GlobalKey<FormState>();

  final _typeController = TextEditingController();
  final _categoryController = TextEditingController();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  late BalanceGroupType _type;
  late BalanceGroupCategory _category;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late BalanceGroupEvent event;

      if (widget.balanceGroup != null) {
      } else {
        event = BalanceGroupEvent.create(
          name: _nameController.text,
          type: _type,
          category: _category,
          id: _idController.text,
        );
      }
      context.read<BalanceGroupBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = createOrEdit(widget.balanceGroup);
    return BlocListener<BalanceGroupBloc, BalanceGroupState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(action, Entity.balanceGroup);
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
          entity: Entity.balanceGroup,
          actions: [
            BlocBuilder<BalanceGroupBloc, BalanceGroupState>(
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
            FTextFormField(
              labelText: 'Group',
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const SizedBox(
              height: 24,
            ),
            FTextFormField(
              labelText: 'Number',
              controller: _idController,
              validator: requiredValidator.call,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(
              height: 24,
            ),
            SelectChipField<BalanceGroupType>(
              label: 'Type',
              getLabel: (type) => type.type,
              controller: _typeController,
              options: const [
                BalanceGroupType.credit,
                BalanceGroupType.debt,
              ],
              onChanged: (value) {
                _type = value;
              },
            ),
            const SizedBox(
              height: 24,
            ),
            SelectChipField<BalanceGroupCategory>(
              label: 'Category',
              getLabel: (category) => category.label,
              controller: _categoryController,
              options: const [
                BalanceGroupCategory.balanceSheet,
                BalanceGroupCategory.profitLoss,
              ],
              onChanged: (value) {
                _category = value;
              },
            ),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
