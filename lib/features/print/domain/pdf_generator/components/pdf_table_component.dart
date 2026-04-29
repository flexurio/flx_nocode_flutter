import 'package:flx_nocode_flutter/features/print/domain/pdf_generator/models/pdf_component_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../utils/pdf_interpolation_utils.dart';
import '../models/pdf_table_model.dart';

class PdfTableComponent {
  static pw.Widget build(
    Map<String, dynamic> comp,
    String defaultUnit,
    Map<String, pw.ImageProvider> imageCache,
    Function(Map<String, dynamic>, String, Map<String, pw.ImageProvider>)
        buildRawChild,
  ) {
    final model = PdfTableModel.fromJson(comp, defaultUnit);

    // Derive column widths from any available configs
    final columnWidths = <int, pw.TableColumnWidth>{};
    List<PdfTableColumnModel>? refConfigs;

    if (model.header.isNotEmpty) {
      refConfigs = model.header.first is List
          ? model.header.first
          : model.header.cast<PdfTableColumnModel>();
    } else if (model.body.isNotEmpty) {
      refConfigs = model.body.first is List
          ? model.body.first
          : model.body.cast<PdfTableColumnModel>();
    }

    if (refConfigs != null) {
      for (var i = 0; i < refConfigs.length; i++) {
        final flex = refConfigs[i].flex;
        if (flex != null) {
          columnWidths[i] = pw.FlexColumnWidth(flex);
        }
      }
    }

    final tableRows = <pw.TableRow>[];
    final cellPadding = model.cellPadding ?? const pw.EdgeInsets.all(4);

    // Helper to render a single row of column models
    pw.TableRow buildRow(List<PdfTableColumnModel> configs,
        {PdfColor? bgColor,
        PdfColor? textColor,
        Map<String, dynamic>? rowContext}) {
      return pw.TableRow(
        decoration: pw.BoxDecoration(color: bgColor),
        children: configs.map((config) {
          PdfComponentModel cellContent = config.content;

          // Interpolate if we have context (body rows)
          if (rowContext != null) {
            final interpolated = PdfInterpolationUtils.interpolate(
                cellContent.rawJson, rowContext);
            cellContent = cellContent
                .copyWithInterpolatedJson(interpolated as Map<String, dynamic>);

            if (config.templates != null || config.template != null) {
              PdfComponentModel? selectedTemplate;
              final index = rowContext['index'] as int;
              if (config.templates != null && config.templates!.isNotEmpty) {
                selectedTemplate =
                    config.templates![index % config.templates!.length];
              } else if (config.template != null) {
                selectedTemplate = config.template;
              }
              if (selectedTemplate != null) {
                final interpolatedTemplate = PdfInterpolationUtils.interpolate(
                    selectedTemplate.rawJson, rowContext);
                cellContent = selectedTemplate.copyWithInterpolatedJson(
                    interpolatedTemplate as Map<String, dynamic>);
              }
            }
          }

          pw.Widget cellWidget;
          final json = cellContent.rawJson;
          if (json.containsKey('type')) {
            cellWidget = buildRawChild(
                Map<String, dynamic>.from(json), defaultUnit, imageCache);
          } else {
            cellWidget = pw.Text(
              json['value']?.toString() ?? '',
              style: pw.TextStyle(
                fontSize: 10,
                fontWeight:
                    bgColor != null ? pw.FontWeight.bold : pw.FontWeight.normal,
                color: textColor ?? PdfColors.black,
              ),
            );
          }

          return pw.Container(
            padding: cellPadding,
            alignment: _parseAlignment(config.align),
            child: cellWidget,
          );
        }).toList(),
      );
    }

    // Render Header
    if (model.header.isNotEmpty) {
      final textColor = model.headerTextColor ??
          (model.headerBgColor != null ? PdfColors.white : PdfColors.black);
      if (model.header.first is List) {
        for (final row in model.header) {
          tableRows.add(buildRow(row as List<PdfTableColumnModel>,
              bgColor: model.headerBgColor, textColor: textColor));
        }
      } else {
        tableRows.add(buildRow(model.header.cast<PdfTableColumnModel>(),
            bgColor: model.headerBgColor, textColor: textColor));
      }
    }

    // Render Body
    if (model.body.isNotEmpty) {
      if (model.data.isNotEmpty) {
        // Dynamic data-driven rows
        final template = model.body.first is List
            ? model.body.first as List<PdfTableColumnModel>
            : model.body.cast<PdfTableColumnModel>();
        int rowIndex = 0;
        for (final rawRow in model.data) {
          if (rawRow is! Map) continue;
          final context = {
            'data': rawRow,
            'index': rowIndex,
            'no': rowIndex + 1
          };
          tableRows.add(buildRow(template, rowContext: context));
          rowIndex++;
        }
      } else {
        // Static rows
        if (model.body.first is List) {
          for (final row in model.body) {
            tableRows.add(buildRow(row as List<PdfTableColumnModel>));
          }
        } else {
          tableRows.add(buildRow(model.body.cast<PdfTableColumnModel>()));
        }
      }
    }

    // Render Footer
    if (model.footer.isNotEmpty) {
      if (model.footer.first is List) {
        for (final row in model.footer) {
          tableRows.add(buildRow(row as List<PdfTableColumnModel>));
        }
      } else {
        tableRows.add(buildRow(model.footer.cast<PdfTableColumnModel>()));
      }
    }

    return pw.Table(
      columnWidths: columnWidths,
      border: pw.TableBorder.all(color: PdfColors.grey, width: 0.5),
      children: tableRows,
    );
  }

  static pw.Alignment _parseAlignment(String? align) {
    final value = align?.toLowerCase();
    if (value == 'center' || value == 'middle') {
      return pw.Alignment.center;
    } else if (value == 'right' || value == 'end') {
      return pw.Alignment.centerRight;
    }
    return pw.Alignment.centerLeft;
  }
}
