import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flexurio_no_code/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flexurio_no_code/src/app/model/filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Export {
  final String name;
  final String backend;
  final String type;
  final List<String> fields;

  Export({
    required this.name,
    required this.backend,
    required this.type,
    required this.fields,
  });

  static List<String> allowedTypes = ['pdf', 'xlsx'];

  factory Export.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    if (!allowedTypes.contains(type)) throw Exception('Invalid export type');
    return Export(
      name: json['name'],
      backend: json['backend'],
      type: type,
      fields: json['fields'].cast<String>(),
    );
  }

  bool get isPdf => type == 'pdf';
  bool get isXlsx => type == 'xlsx';

  Widget buildButton({
    required List<Filter> filters,
  }) {
    return ButtonExport.prepare(export: this, filters: filters);
  }
}

class ButtonExport extends StatelessWidget {
  const ButtonExport({super.key, required this.export, this.filters});

  final Export export;
  final List<Filter>? filters;

  static Widget prepare({
    required Export export,
    required List<Filter>? filters,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => EntityCustomQueryBloc())],
      child: ButtonExport(export: export),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EntityCustomQueryBloc, EntityCustomQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data) async {
            final pdf = pw.Document()
              ..addPage(
                await pdfGeneral(
                  data: data.data,
                  title: export.name,
                  fields: export.fields,
                  printedBy: 'Anonymous',
                ),
              );
            await Printing.sharePdf(
              bytes: await pdf.save(),
              filename: '${export.name}.${export.type}',
            );
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action:
                export.isPdf ? DataAction.exportPdf : DataAction.exportExcel,
            title: export.name,
            permission: null,
            onPressed: () async {
              context.read<EntityCustomQueryBloc>().add(
                    EntityCustomQueryEvent.fetch(
                      method: 'GET',
                      url: export.backend,
                      filters: filters,
                      pageOptions: null,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
