import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location/asset_location_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_accumulation_query/chart_of_account_number_accumulation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/chart_of_account_number_invoice_query/chart_of_account_number_invoice_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class AssetLocationCreatePage extends StatefulWidget {
  const AssetLocationCreatePage({super.key, this.assetLocation});

  final AssetLocation? assetLocation;

  static Route<bool?> route({AssetLocation? assetLocation}) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AssetLocationBloc(),
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
        child: AssetLocationCreatePage(
          assetLocation: assetLocation,
        ),
      ),
    );
  }

  @override
  State<AssetLocationCreatePage> createState() =>
      _AssetLocationCreatePageState();
}

class _AssetLocationCreatePageState extends State<AssetLocationCreatePage> {
  late DataAction _action;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.assetLocation);

    if (_action.isEdit) {
      _nameController.text = widget.assetLocation!.locationName;
      _idController.text = widget.assetLocation!.id;
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<AssetLocationBloc>().add(
            AssetLocationEvent.create(
              name: _nameController.text,
              id: _idController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.assetLocation;
    return BlocListener<AssetLocationBloc, AssetLocationState>(
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
            BlocBuilder<AssetLocationBloc, AssetLocationState>(
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
            FTextFormField(
              labelText: 'ID',
              maxLength: 20,
              controller: _idController,
              validator: requiredValidator.call,
            ),
            const Gap(24),
            FTextFormField(
              labelText: 'Name',
              maxLength: 200,
              controller: _nameController,
              validator: requiredValidator.call,
            ),
          ],
        ),
      ),
    );
  }
}
