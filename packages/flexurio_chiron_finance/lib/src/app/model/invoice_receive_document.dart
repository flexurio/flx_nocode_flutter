import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_document.freezed.dart';
part 'invoice_receive_document.g.dart';

@freezed
class InvoiceReceiveDocument with _$InvoiceReceiveDocument {
  const factory InvoiceReceiveDocument({
    required int id,
    @JsonKey(name: 'document') required String documentPath,
    required String description,
    required String name,
  }) = _InvoiceReceiveDocument;
  const InvoiceReceiveDocument._();

  factory InvoiceReceiveDocument.fromJson(Map<String, dynamic> json) =>
      _$InvoiceReceiveDocumentFromJson(json);

  String get fileName => documentPath.split('/').last;
}
