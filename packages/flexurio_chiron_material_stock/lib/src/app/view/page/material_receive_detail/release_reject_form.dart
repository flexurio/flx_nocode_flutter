import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_bloc/material_receive_detail_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/entity.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReceiveDetailReleaseRejectForm extends StatefulWidget {
  const MaterialReceiveDetailReleaseRejectForm({
    required this.detail,
    required this.action,
    required this.onSubmitted,
    super.key,
  });

  final MaterialReceiveDetail detail;
  final DataAction action;
  final void Function(
      {required MaterialReceiveDetailBloc bloc,
      required int vatNoFirst,
      required int vatNoLast,
      String? rejectStatus,
      String? rejectReason,
      DateTime? date}) onSubmitted;

  static Widget prepare({
    required MaterialReceiveDetail detail,
    required DataAction action,
    required bool isExternal,
    required void Function(
            {required MaterialReceiveDetailBloc bloc,
            required int vatNoFirst,
            required int vatNoLast,
            String? rejectStatus,
            String? rejectReason,
            DateTime? date})
        onSubmitted,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MaterialQueryBloc()),
        BlocProvider(
          create: (context) => MaterialReceiveDetailBloc(
            isExternal: isExternal,
          ),
        ),
      ],
      child: MaterialReceiveDetailReleaseRejectForm(
        detail: detail,
        action: action,
        onSubmitted: onSubmitted,
      ),
    );
  }

  @override
  State<MaterialReceiveDetailReleaseRejectForm> createState() =>
      _MaterialReceiveDetailReleaseRejectFormState();
}

class _MaterialReceiveDetailReleaseRejectFormState
    extends State<MaterialReceiveDetailReleaseRejectForm> {
  final _formKey = GlobalKey<FormState>();
  final _vatNoFirstController = TextEditingController();
  final _vatNoLastController = TextEditingController();
  final _retestDateController = TextEditingController();
  final _statusRejectController = TextEditingController();
  final _reasonRejectController = TextEditingController();
  DateTime? _retestDate;

  @override
  dispose() {
    _vatNoFirstController.dispose();
    _vatNoLastController.dispose();
    _retestDateController.dispose();
    _statusRejectController.dispose();
    _reasonRejectController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var vatNoFirst = int.parse(_vatNoFirstController.text);
      var vatNoLast = int.parse(_vatNoLastController.text);
      if (vatNoFirst <= vatNoLast) {
        widget.onSubmitted(
          bloc: context.read<MaterialReceiveDetailBloc>(),
          vatNoFirst: vatNoFirst,
          vatNoLast: vatNoLast,
          rejectStatus: _statusRejectController.text,
          rejectReason: _reasonRejectController.text,
          date: _retestDate,
        );
      } else {
        Toast(context).fail('error.required_value_first_lower_than_second'
            .tr(namedArgs: {'data': 'VAT'}));
        ;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final action = widget.action;
    final entity = EntityMaterialStock.material;
    final isReject = action == DataAction.reject;

    return BlocListener<MaterialReceiveDetailBloc, MaterialReceiveDetailState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          success: () {
            Navigator.pop(context, true);
            Toast(context).dataChanged(action, entity);
          },
          error: (error) => Toast(context).fail(error),
        );
      },
      child: SingleFormPanel(
        formKey: _formKey,
        action: action,
        entity: entity,
        actions: [
          BlocBuilder<MaterialReceiveDetailBloc, MaterialReceiveDetailState>(
            builder: (context, state) {
              final isProgress = state.maybeWhen(
                orElse: () => false,
                loading: () => true,
              );
              return Button(
                isInProgress: isProgress,
                action: action,
                permission: null,
                onPressed: () => _submit(context),
              );
            },
          ),
        ],
        children: _buildCreateFields(context),
      ),
    );
  }

  List<Widget> _buildCreateFields(BuildContext context) {
    return [
      RowFields(
        children: [
          FTextFormField(
            labelText: 'Vat no First',
            controller: _vatNoFirstController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: requiredValidator.call,
          ),
          FTextFormField(
            labelText: 'Vat no Last',
            controller: _vatNoLastController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            validator: requiredValidator.call,
          ),
        ],
      ),
      const SizedBox(height: 24),
      if (widget.action == DataAction.reject)
        RowFields(
          children: [
            FDropDownSearch<String>(
              labelText: 'Status Reject',
              items: const [
                'MINOR',
                'MAYOR',
                'KRITIS',
              ],
              onChanged: (status) {
                if (status != null) {
                  _statusRejectController.text = status;
                }
              },
              itemAsString: (status) => status,
              validator: requiredObjectValidator.call,
            ),
          ],
        )
      else
        FieldTimePicker(
          labelText: 'Retest Date QC',
          controller: _retestDateController,
          onChanged: (value) => _retestDate = value,
        ),
      if (widget.action == DataAction.reject) const SizedBox(height: 24),
      if (widget.action == DataAction.reject)
        FTextFormField(
          labelText: 'Reason Reject',
          maxLines: 3,
          controller: _reasonRejectController,
          validator: requiredValidator.call,
        ),
    ];
  }
}
