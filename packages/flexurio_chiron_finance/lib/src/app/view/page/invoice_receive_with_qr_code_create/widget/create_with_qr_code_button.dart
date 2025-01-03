import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/invoice_receive_with_qr_code_create/invoice_receive_with_qr_code_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateWithQrCodeButton extends StatelessWidget {
  const CreateWithQrCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return LightButtonSmall(
      action: DataAction.scanQrCode,
      title: 'invoice'.tr(),
      permission: Permission.invoiceReceiveCreate,
      onPressed: () async {
        final validateInvoice = await _showPopUpListener(context);
        if (validateInvoice != null) {
          await Navigator.push(
            context,
            InvoiceReceiveWithQrCodeCreatePage.route(
              resValidateInvoicePm: validateInvoice,
            ),
          ).then((value) {
            if (value ?? false) {
              context
                  .read<InvoiceReceiveQueryBloc>()
                  .add(const InvoiceReceiveQueryEvent.fetch());
            }
          });
        }
      },
    );
  }

  Future<ResValidateInvoicePm?> _showPopUpListener(BuildContext context) async {
    return showDialog<ResValidateInvoicePm?>(
      context: context,
      builder: (BuildContext context) {
        return ScannerPopUp.prepare();
      },
    );
  }
}

class ScannerPopUp extends StatefulWidget {
  const ScannerPopUp._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValidateInvoiceQueryBloc(),
        ),
      ],
      child: const ScannerPopUp._(),
    );
  }

  @override
  State<ScannerPopUp> createState() => _ScannerPopUpState();
}

class _ScannerPopUpState extends State<ScannerPopUp> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      context.read<ValidateInvoiceQueryBloc>().add(
            ValidateInvoiceQueryEvent.fetch(
              url: _controller.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CardForm(
      popup: true,
      title: 'scanner'.tr(),
      icon: Icons.qr_code_scanner,
      actions: [
        Button(
          action: DataAction.cancel,
          permission: null,
          isSecondary: true,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 12),
        BlocListener<ValidateInvoiceQueryBloc, ValidateInvoiceQueryState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              error: (error) => Toast(context).fail(error),
              loaded: (validateInvoice) async {
                Navigator.pop(context, validateInvoice);
              },
            );
          },
          child:
              BlocBuilder<ValidateInvoiceQueryBloc, ValidateInvoiceQueryState>(
            builder: (context, state) {
              return Button(
                action: DataAction.submit,
                permission: null,
                onPressed: _submit,
              );
            },
          ),
        ),
      ],
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldText(
              labelText: 'qr_code'.tr(),
              autoFocus: true,
              controller: _controller,
              onEditingComplete: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
