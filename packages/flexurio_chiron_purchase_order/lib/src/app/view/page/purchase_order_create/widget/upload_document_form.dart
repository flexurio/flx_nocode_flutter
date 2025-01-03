import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_purchase_order/src/app/bloc/purchase_order/purchase_order_bloc.dart';
import 'package:flexurio_chiron_purchase_order/src/app/model/purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UploadDocumentForm extends StatefulWidget {
  const UploadDocumentForm._({
    required this.purchaseOrder,
    required this.onPickFile,
  });

  static Widget prepare({
    required PurchaseOrder purchaseOrder,
    required OnPickFile onPickFile,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => PurchaseOrderBloc())],
      child: UploadDocumentForm._(
        purchaseOrder: purchaseOrder,
        onPickFile: onPickFile,
      ),
    );
  }

  final PurchaseOrder purchaseOrder;
  final OnPickFile onPickFile;

  @override
  State<UploadDocumentForm> createState() =>
      _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState extends State<UploadDocumentForm> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  late PlatformFile _file;

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final event = PurchaseOrderEvent.uploadDocument(
        purchaseOrder: widget.purchaseOrder,
        description: _descriptionController.text,
        file: _file,
      );
      context.read<PurchaseOrderBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    final entity = Entity.purchaseOrderDocument;

    return BlocListener<PurchaseOrderBloc, PurchaseOrderState>(
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
      child: SingleFormPanel(
        actions: [
          BlocBuilder<PurchaseOrderBloc, PurchaseOrderState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: () => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        formKey: _formKey,
        action: action,
        entity: entity,
        children: [
          ChooseFile(
            onChange: (file) => _file = file.first,
            type: const ['pdf'],
            onPickFile: widget.onPickFile,
          ),
          const Gap(12),
          FTextFormField(
            labelText: 'Description',
            controller: _descriptionController,
            validator: requiredValidator.call,
            maxLength: 50,
          ),
        ],
      ),
    );
  }
}
