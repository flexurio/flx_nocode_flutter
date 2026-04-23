import 'package:flx_nocode_flutter/core/network/models/http_data.dart';
import 'package:flx_nocode_flutter/features/layout_form/domain/form_submit_workflow.dart';

class HttpAction implements WorkflowAction {
  final String name;
  final HttpData http;
  final RetryPolicy? retry;

  /// If provided, will save result into ctx.http[name] automatically.
  /// Additionally supports "save_result_to": "http.some_name"
  /// but the canonical storage is ctx.http[name].
  final String? saveResultTo;

  const HttpAction({
    required this.name,
    required this.http,
    this.retry,
    this.saveResultTo,
  });

  @override
  Future<void> execute(WorkflowContext ctx, UiBridge ui) async {
    int attempt = 0;
    final actionLabel = name.isEmpty ? 'http' : name;
    while (true) {
      try {
        final resolvedHeaders = Template.resolve(http.headers, ctx);
        if (resolvedHeaders is! Map) {
          throw const WorkflowExecutionException(
            'HTTP headers must resolve to an object.',
          );
        }

        final resolvedBody = Template.resolve(http.body, ctx);
        if (resolvedBody is! Map) {
          throw const WorkflowExecutionException(
            'HTTP body must resolve to an object.',
          );
        }

        final resolved = HttpData(
          method:
              Template.resolve(http.method, ctx)?.toString().toUpperCase() ??
                  http.method.toUpperCase(),
          url: Template.resolve(http.url, ctx)?.toString() ?? http.url,
          headers: resolvedHeaders.map<String, String>(
            (k, v) => MapEntry(k.toString(), '$v'),
          ),
          body: resolvedBody.map<String, dynamic>(
            (k, v) => MapEntry(k.toString(), v),
          ),
          useFormData: http.useFormData,
          mockEnabled: http.mockEnabled,
          mockData: Template.resolve(http.mockData, ctx),
        );

        ui.log('Executing "$actionLabel":');
        ui.log('  > Method: ${resolved.method}');
        ui.log('  > URL: ${resolved.url}');
        // Only log body if not empty
        if (resolved.body.isNotEmpty) {
          ui.log('  > Body: ${resolved.body}');
        }

        if (resolved.url.isEmpty) {
          throw WorkflowExecutionException(
            'HTTP "$actionLabel" is missing a valid URL.',
          );
        }

        final result = await ctx.httpExecutor.execute(resolved);

        // Save by name (primary)
        ctx.http[actionLabel] = result;

        // Optional secondary save path: "http.xxx"
        if (saveResultTo != null && saveResultTo!.startsWith('http.')) {
          final alias = saveResultTo!.substring('http.'.length);
          ctx.http[alias] = result;
        }

        // If HTTP is not success, throw to let try/catch handle it.
        if (!result.isSuccess) {
          throw Exception('HTTP $name failed with status ${result.status}');
        }
        ctx.lastData = result.data;
        return;
      } catch (e) {
        ui.log('⚠️ Attempt ${attempt + 1} failed: $e');
        attempt++;
        if (retry == null || attempt > retry!.max) {
          if (e is WorkflowException) rethrow;
          throw WorkflowExecutionException(
            'HTTP "$actionLabel" failed: $e',
            cause: e,
          );
        }
        ui.log('Retrying in ${retry!.delayMs}ms...');
        await Future.delayed(Duration(milliseconds: retry!.delayMs));
      }
    }
  }
}
