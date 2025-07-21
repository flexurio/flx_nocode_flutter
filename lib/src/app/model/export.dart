import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/resource/user_repository.dart';
import 'package:flx_nocode_flutter/src/app/util/picker_file.dart';
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
    if (!allowedTypes.contains(type))
      throw Exception('Invalid export type: $type');
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
  const ButtonExport._({required this.export, required this.filters});

  final Export export;
  final List<Filter>? filters;

  static Widget prepare({
    required Export export,
    required List<Filter>? filters,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => EntityCustomQueryBloc())],
      child: ButtonExport._(export: export, filters: filters),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EntityCustomQueryBloc, EntityCustomQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          loaded: (data) async {
            if (export.isPdf) {
              final pdf = pw.Document()
                ..addPage(
                  await pdfGeneral(
                    data: data.data,
                    title: export.name,
                    fields: export.fields,
                    printedBy: UserRepositoryApp.instance.user?.name ?? '-',
                  ),
                );
              await Printing.sharePdf(
                bytes: await pdf.save(),
                filename: '${export.name}.pdf',
              );
            } else {
              final bytes = generalXlsx(context, data.data, export.fields);
              saveFile(bytes, '${export.name}.xlsx');
            }
            Toast(context).notify('Exported successfully');
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
            permissions: null,
            onPressed: () async {
              context.read<EntityCustomQueryBloc>().add(
                    EntityCustomQueryEvent.fetch(
                      method: 'GET',
                      url: export.backend,
                      filters: filters,
                      pageOptions: PageOptions.emptyNoLimit(sortBy: ''),
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}
