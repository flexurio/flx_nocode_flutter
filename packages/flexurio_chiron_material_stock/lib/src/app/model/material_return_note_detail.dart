import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_note_detail.freezed.dart';
part 'material_return_note_detail.g.dart';

@freezed
class MaterialReturnNoteDetail with _$MaterialReturnNoteDetail {
  factory MaterialReturnNoteDetail({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'return_note', fromJson: MaterialReturnNote.fromJson)
    required MaterialReturnNote returnNote,
    @JsonKey(name: 'currency', fromJson: Currency.fromJson)
    required Currency currency,
    required String description,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    required String unit,
    required int quantity,
    required int price,
    @JsonKey(name: 'sub_total') required int subtotal,
  }) = _MaterialReturnNoteDetail;
  const MaterialReturnNoteDetail._();

  factory MaterialReturnNoteDetail.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnNoteDetailFromJson(json);
}
