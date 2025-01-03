import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CustomerExportPdfButton extends StatelessWidget {
  const CustomerExportPdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerQueryBloc, CustomerQueryState>(
      bloc: CustomerQueryBloc()
        ..add(
          CustomerQueryEvent.fetch(
            pageOptions: PageOptions.emptyNoLimit(),
          ),
        ),
      builder: (context, state) {
        return LightButtonSmall(
          action: DataAction.printPDF,
          permission: null,
          onPressed: () {
            state.maybeWhen(
              orElse: () => Toast(context).fail(errorSomethingWentWrong),
              loaded: (customers) async {
                final data = customers.data
                  ..sort((a, b) => a.name.compareTo(b.name));
                final pdf = pw.Document()
                  ..addPage(
                    await pdfCustomer(data, context),
                  );
                await Printing.sharePdf(
                  bytes: await pdf.save(),
                  filename: 'Customer Report.pdf',
                );
              },
            );
          },
        );
      },
    );
  }
}
