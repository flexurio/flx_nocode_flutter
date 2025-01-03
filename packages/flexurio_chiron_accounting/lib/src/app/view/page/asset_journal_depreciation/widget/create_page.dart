import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_journal_depreciation/asset_journal_depreciation_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/entity.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class AssetJournalDepreciationCreatePage extends StatefulWidget {
  const AssetJournalDepreciationCreatePage({super.key});

  static Route<bool?> route() {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AssetJournalDepreciationBloc(),
          ),
        ],
        child: AssetJournalDepreciationCreatePage(),
      ),
    );
  }

  @override
  State<AssetJournalDepreciationCreatePage> createState() =>
      _AssetJournalDepreciationCreatePageState();
}

class _AssetJournalDepreciationCreatePageState
    extends State<AssetJournalDepreciationCreatePage> {
  final _action = DataAction.create;
  final _formKey = GlobalKey<FormState>();
  final _periodStartController = TextEditingController();
  final _periodEndController = TextEditingController();

  DateTime? _periodStart;
  DateTime? _periodEnd;

  @override
  void initState() {
    super.initState();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AssetJournalDepreciationBloc>().add(
            AssetJournalDepreciationEvent.create(
              periodStart: _periodStart!,
              periodEnd: _periodEnd!,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = EntityAccounting.assetJournalDepreciation;
    return BlocListener<AssetJournalDepreciationBloc, AssetJournalDepreciationState>(
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
            BlocBuilder<AssetJournalDepreciationBloc, AssetJournalDepreciationState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  action: _action,
                  onPressed: _submit,
                  isInProgress: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                );
              },
            ),
          ],
          children: [
            FieldDatePicker(
              onChanged: (date) => _periodStart = date,
              controller: _periodStartController,
              validator: requiredObjectValidator.call,
              labelText: 'period_start'.tr(),
            ),
            const Gap(24),
            FieldDatePicker(
              onChanged: (date) => _periodEnd = date,
              controller: _periodEndController,
              validator: requiredObjectValidator.call,
              labelText: 'period_end'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
