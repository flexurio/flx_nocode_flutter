import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_sales_credit_note.freezed.dart';
part 'report_sales_credit_note.g.dart';

@freezed
class ReportSalesCreditNote with _$ReportSalesCreditNote {
  const factory ReportSalesCreditNote({
    @JsonKey(name: 'customer') required String customer,
    @JsonKey(name: 'transaction_no') required String transactionNo,
    @JsonKey(name: 'date', fromJson: isoDateToDateTime)
    required DateTime date,
    @JsonKey(name: 'purchase_order_id') required String purchaseOrderId,
    @JsonKey(name: 'subtotal') required int subTotal,
    @JsonKey(name: 'discount_value') required int discountValue,
    @JsonKey(name: 'ppn_value') required int ppnValue,
    @JsonKey(name: 'total') required int total,
  }) = _ReportSalesCreditNote;
  const ReportSalesCreditNote._();

  factory ReportSalesCreditNote.fromJson(Map<String, dynamic> json) =>
      _$ReportSalesCreditNoteFromJson(json);

  factory ReportSalesCreditNote.empty() => ReportSalesCreditNote(
        customer: '',
        transactionNo: '',
        date: DateTime(0),
        purchaseOrderId: '',
        subTotal: 0,
        discountValue: 0,
        ppnValue: 0,
        total: 0,
      );
}
