import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finance_return_note.freezed.dart';
part 'finance_return_note.g.dart';

@freezed
class FinanceReturnNote with _$FinanceReturnNote {
  const factory FinanceReturnNote(
    @JsonKey(name: 'no_cnj') String cnjNo,
    @JsonKey(name: 'no_srp') String srpNo,
    @JsonKey(name: 'nota_return') String returnNote,
    @JsonKey(name: 'no_sj') String deliveryNo,
    @JsonKey(name: 'tgl_no_sj', fromJson: dateTimeFromJson)
    DateTime deliveryDate,
    @JsonKey(name: 'no_faktur_pajak') String taxInvoiceNo,
    @JsonKey(name: 'nama_customer') String customer,
    @JsonKey(name: 'no_ref') String referenceNo,
    @JsonKey(name: 'divisi_name') String division,
    @JsonKey(name: 'product_name') String product,
    @JsonKey(name: 'qty') int quantity,
    @JsonKey(name: 'unit') String unit,
    @JsonKey(name: 'harsat') double unitPrice,
    @JsonKey(name: 'harga') double price,
    @JsonKey(name: 'persen_disc') double discountPercent,
    @JsonKey(name: 'dpp') double dpp,
    @JsonKey(name: 'ppn') double ppn,
    @JsonKey(name: 'total') double total,
    @JsonKey(name: 'ex_date', fromJson: dateTimeFromJson) DateTime expiredDate,
    @JsonKey(name: 'no_batch') String batch,
  ) = _FinanceReturnNote;
  const FinanceReturnNote._();

  factory FinanceReturnNote.fromJson(Map<String, Object?> json) =>
      _$FinanceReturnNoteFromJson(json);
}
