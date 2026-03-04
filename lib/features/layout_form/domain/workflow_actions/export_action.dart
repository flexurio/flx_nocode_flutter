import 'package:flutter/foundation.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart' as fcf;
import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';
import 'package:download/download.dart';
import 'package:path_provider/path_provider.dart';

class ExportAction implements WorkflowAction {
  final String format; // 'xlsx' | 'csv' | 'pdf'
  final List<TColumn> columns;
  final String? dataSource;
  final String? saveResultTo;

  const ExportAction({
    required this.format,
    required this.columns,
    this.dataSource,
    this.saveResultTo,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    print('[ExportAction] Starting execution...');
    print('[ExportAction] Format: $format');
    print('[ExportAction] Columns count: ${columns.length}');

    List items = [];
    if (dataSource != null) {
      final resolvedData = Template.resolve(dataSource, ctx);
      final printedData = resolvedData.toString();
      if (printedData.length > 500) {
        print(
            '[ExportAction] Resolved dataSource: ${printedData.substring(0, 500)}...');
      } else {
        print('[ExportAction] Resolved dataSource: $printedData');
      }

      if (resolvedData is List) {
        items = resolvedData;
      } else if (resolvedData is Map) {
        // Handle common response wrappers
        if (resolvedData.containsKey('data') && resolvedData['data'] is List) {
          items = resolvedData['data'];
        } else if (resolvedData.containsKey('results') &&
            resolvedData['results'] is List) {
          items = resolvedData['results'];
        } else if (resolvedData.containsKey('items') &&
            resolvedData['items'] is List) {
          items = resolvedData['items'];
        } else {
          print(
              '[ExportAction] Data to export is a Map but no common list key found: ${resolvedData.keys}');
        }
      } else {
        print(
            '[ExportAction] Data to export is not a List or Map: ${resolvedData.runtimeType}');
      }
    } else {
      print('[ExportAction] No dataSource specified');
    }

    if (items.isNotEmpty) {
      print('[ExportAction] Exporting ${items.length} items');

      final List<fcf.PColumnHeader> pHeaders =
          columns.map((e) => fcf.PColumnHeader(title: e.header)).toList();
      final List<fcf.PColumnBody<Map<String, dynamic>>> pBody =
          columns.map((col) {
        return fcf.PColumnBody<Map<String, dynamic>>(
          contentBuilder: (item, index) {
            final rowCtx = WorkflowContext(
              form: ctx.form,
              record: ctx.record,
              data: item,
              vars: ctx.vars,
              auth: ctx.auth,
              httpExecutor: ctx.httpExecutor,
            );
            return Template.resolve(col.body, rowCtx)?.toString() ?? '';
          },
        );
      }).toList();

      final fileName =
          'export_${DateTime.now().millisecondsSinceEpoch}.${format.toLowerCase()}';

      if (format.toLowerCase() == 'xlsx') {
        final excel = fcf.SimpleExcelExporter<Map<String, dynamic>>(
          data: items.cast<Map<String, dynamic>>(),
          headers: pHeaders,
          body: pBody,
          title: 'Export',
          printedBy: 'System',
        );

        final bytes = excel.export();

        if (!kIsWeb) {
          try {
            final dir = await getDownloadsDirectory();
            if (dir != null) {
              print(
                  '[ExportAction] File will be saved to: ${dir.path}/$fileName');
            } else {
              print('[ExportAction] Could not find Downloads directory');
            }
          } catch (e) {
            print('[ExportAction] Error getting save location: $e');
          }
        } else {
          print(
              '[ExportAction] Running on Web - file will be downloaded via browser as $fileName');
        }

        await download(Stream.fromIterable(bytes), fileName);
      } else {
        print('[ExportAction] Format "$format" is not fully implemented yet');
      }
    } else {
      print('[ExportAction] No items found to export');
    }

    // For now, save metadata or mock success
    if (saveResultTo != null) {
      print('[ExportAction] Saving results to ctx.vars["$saveResultTo"]');
      ctx.vars[saveResultTo!] = {
        'format': format,
        'columns': columns.length,
        'items_count': items.length,
        'status': items.isNotEmpty ? 'generated' : 'empty'
      };
    }
    print('[ExportAction] Execution finished.');
  }
}
