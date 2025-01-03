import 'package:equatable/equatable.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sertificate_documents.freezed.dart';
part 'sertificate_documents.g.dart';

@freezed
class SertificateDocuments extends Equatable with _$SertificateDocuments {
  const factory SertificateDocuments({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
  }) = _SertificateDocuments;
  const SertificateDocuments._();

  factory SertificateDocuments.fromJson(Map<String, Object?> json) =>
      _$SertificateDocumentsFromJson(json);

  @override
  List<Object?> get props => [id];
}
