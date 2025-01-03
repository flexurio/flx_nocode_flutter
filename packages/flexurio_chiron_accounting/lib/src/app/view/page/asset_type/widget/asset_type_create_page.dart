import 'package:flexurio_chiron_accounting/src/app/bloc/asset_type/asset_type_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_accumulation_query/chart_of_account_number_accumulation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_invoice_query/chart_of_account_number_invoice_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/chart_of_account_number_accumulation.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/chart_of_account_number_invoice.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class AssetTypeCreatePage extends StatefulWidget {
  const AssetTypeCreatePage({super.key, this.assetType});

  final AssetType? assetType;

  static Route<bool?> route({AssetType? assetType}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AssetTypeBloc(),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountNumberAccumulationQueryBloc()
              ..add(
                ChartOfAccountNumberAccumulationQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
          BlocProvider(
            create: (context) => ChartOfAccountNumberInvoiceQueryBloc()
              ..add(
                ChartOfAccountNumberInvoiceQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              ),
          ),
        ],
        child: AssetTypeCreatePage(
          assetType: assetType,
        ),
      ),
    );
  }

  @override
  State<AssetTypeCreatePage> createState() => _AssetTypeCreatePageState();
}

class _AssetTypeCreatePageState extends State<AssetTypeCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  ChartOfAccountNumber? _coa;
  ChartOfAccountNumber? _coaInvoice;
  ChartOfAccountNumber? _coaAccumulation;
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _amountOfDepreciationController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.assetType);

    if (_action.isEdit) {
      _nameController.text = widget.assetType!.name;
      _idController.text = widget.assetType!.id;
      _amountOfDepreciationController.text =
          widget.assetType!.amountOfDepreciation.toString();
      _coa = widget.assetType!.coa;
      _coaAccumulation = widget.assetType!.coaAccumulation;
      _coaInvoice = widget.assetType!.coaInvoice;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_action.isEdit) {
        context.read<AssetTypeBloc>().add(
              AssetTypeEvent.update(
                assetType: widget.assetType!,
                name: _nameController.text,
                amountOfDepreciation:
                    int.parse(_amountOfDepreciationController.text),
                coa: _coa,
                coaAccumulation: _coaAccumulation,
                coaInvoice: _coaInvoice,
              ),
            );
      } else {
        context.read<AssetTypeBloc>().add(
              AssetTypeEvent.create(
                name: _nameController.text,
                id: _idController.text,
                amountOfDepreciation:
                    int.parse(_amountOfDepreciationController.text),
                coa: _coa,
                coaAccumulation: _coaAccumulation,
                coaInvoice: _coaInvoice,
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.assetType;
    return BlocListener<AssetTypeBloc, AssetTypeState>(
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
            BlocBuilder<AssetTypeBloc, AssetTypeState>(
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
            if (_action.isCreate)
              FTextFormField(
                labelText: 'ID',
                maxLength: 2,
                controller: _idController,
                validator: requiredValidator.call,
              ),
            if (_action.isEdit)
              FTextFormField(
                labelText: 'ID',
                maxLength: 2,
                enabled: false,
                controller: _idController,
                validator: requiredValidator.call,
              ),
            const Gap(24),
            FTextFormField(
              labelText: 'name'.tr(),
              maxLength: 100,
              controller: _nameController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'amount_of_depreciation'.tr(),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: _amountOfDepreciationController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FDropDownSearchChartOfAccountNumberAccumulation(
              label: 'chart_of_account'.tr(),
              initialValue: widget.assetType?.coa,
              isRequired: false,
              onChanged: (coa) {
                _coa = coa;
              },
            ),
            const Gap(24),
            FDropDownSearchChartOfAccountNumberAccumulation(
              label: 'chart_of_account_accumulation'.tr(),
              initialValue: widget.assetType?.coaAccumulation,
              isRequired: false,
              onChanged: (coa) {
                _coaAccumulation = coa;
              },
            ),
            const Gap(24),
            FDropDownSearchChartOfAccountNumberInvoice(
              label: 'chart_of_account_invoice'.tr(),
              initialValue: widget.assetType?.coaInvoice,
              isRequired: false,
              onChanged: (coa) {
                _coaInvoice = coa;
              },
            ),
          ],
        ),
      ),
    );
  }
}
