import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_order_attachment.freezed.dart';
part 'sales_order_attachment.g.dart';

@freezed
class SalesOrderAttachment with _$SalesOrderAttachment {
  const factory SalesOrderAttachment({
    required String document,
    @JsonKey(name: 'revision_no') required int revisionNo,
    String? description,
    @JsonKey(name: 'extension_document') String? extensionDocument,
  }) = _SalesOrderAttachment;
  const SalesOrderAttachment._();

  factory SalesOrderAttachment.fromJson(Map<String, Object?> json) =>
      _$SalesOrderAttachmentFromJson(json);
}
