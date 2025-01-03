import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/customer.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/product_return.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_note_recap_query/product_return_note_recap_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/product_return_query/product_return_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/view/page/product_return_note/util/pdf_product_return_note_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ProductReturnNoteExportPdfForm extends StatefulWidget {
  const ProductReturnNoteExportPdfForm._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductReturnNoteRecapQueryBloc(),
        ),
        BlocProvider(
          create: (context) => CustomerQueryBloc()
            ..add(
              CustomerQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => ProductReturnQueryBloc()
            ..add(
              ProductReturnQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: const ProductReturnNoteExportPdfForm._(),
    );
  }

  @override
  State<ProductReturnNoteExportPdfForm> createState() =>
      _ProductReturnNoteExportPdfFormState();
}

class _ProductReturnNoteExportPdfFormState
    extends State<ProductReturnNoteExportPdfForm> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _periodStart;
  DateTime? _periodEnd;
  Customer? _customer;
  ProductReturn? _productReturn;

  final _periodStartController = TextEditingController();
  final _periodEndController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ProductReturnNoteRecapQueryBloc>().add(
            ProductReturnNoteRecapQueryEvent.fetch(
              periodStart: _periodStart!,
              periodEnd: _periodEnd!,
              customer: _customer!,
              productReturn: _productReturn,
              pageOptions: PageOptions.emptyNoLimit(
                sortBy: 'PR.id',
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.exportPdf;

    return BlocListener<ProductReturnNoteRecapQueryBloc,
        ProductReturnNoteRecapQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfProductReturnNoteRecap(
                  data: pageOptions.data,
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: 'product_return_note_recap.pdf',
            );
            Navigator.pop(context);
          },
        );
      },
      child: CardForm(
        popup: true,
        title: '${action.title} ${'product_return_note_recap'.tr()}',
        icon: action.icon,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            onPressed: () => Navigator.pop(context),
            action: DataAction.cancel,
          ),
          const Gap(12),
          BlocBuilder<ProductReturnNoteRecapQueryBloc,
              ProductReturnNoteRecapQueryState>(
            builder: (context, state) {
              return Button(
                permission: null,
                isInProgress: state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                ),
                onPressed: () => _submit(context),
                action: action,
              );
            },
          ),
        ],
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowFields(
                children: [
                  FieldDatePicker(
                    validator: requiredObjectValidator.call,
                    labelText: 'start_date'.tr(),
                    onChanged: (value) {
                      _periodStart = value;
                      setState(() {
                        _periodEnd = _periodStart!.endOfMonth;
                      });
                    },
                    initialSelectedDate: _periodStart,
                    controller: _periodStartController,
                  ),
                  FieldDatePicker(
                    key: ValueKey(_periodStart),
                    validator: requiredObjectValidator.call,
                    labelText: 'end_date'.tr(),
                    onChanged: (value) {
                      _periodEnd = value;
                    },
                    initialSelectedDate: _periodEnd,
                    controller: _periodEndController,
                  ),
                ],
              ),
              const Gap(24),
              FDropDownSearchCustomer(
                onChanged: (customer) {
                  if (customer != null) {
                    _customer = customer;
                  }
                },
              ),
              const Gap(24),
              FDropDownSearchProductReturn(
                isRequired: false,
                onChanged: (productReturn) {
                  if (productReturn != null) {
                    _productReturn = productReturn;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
