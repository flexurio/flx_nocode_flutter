import 'package:flx_nocode_flutter/features/component/models/component_table.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

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
    // Note: Actual export logic might depend on how the HTTP action runs,
    // or you might want to fetch data and then generate the file using
    // flx_core_flutter's SimpleExcel. For now, this is a placeholder
    // acknowledging the step exists. In a full implementation, you would:
    // 1. Resolve data Source (maybe from vars or HTTP result context)
    // 2. Map data applying TColumn 'body' expressions via Template.resolve
    // 3. Generate the file bytes
    // 4. Save bytes to ctx.vars or trigger download

    print(
        '[ExportAction] Exporting to format "$format" with ${columns.length} columns');

    // For now, save metadata or mock success
    if (saveResultTo != null) {
      ctx.vars[saveResultTo!] = {
        'format': format,
        'columns': columns.length,
        'status': 'generated'
      };
    }
  }
}
