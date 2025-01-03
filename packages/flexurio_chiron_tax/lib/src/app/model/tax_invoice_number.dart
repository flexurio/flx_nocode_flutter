import 'package:freezed_annotation/freezed_annotation.dart';

part 'tax_invoice_number.freezed.dart';
part 'tax_invoice_number.g.dart';

@freezed
class TaxInvoiceNumber with _$TaxInvoiceNumber {
  factory TaxInvoiceNumber(
    String year,
    String prefix,
    int sequence,
    int id,
    @JsonKey(name: 'min_value') int minValue,
    @JsonKey(name: 'max_value') int maxValue,
    @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
  ) = _TaxInvoiceNumber;

  factory TaxInvoiceNumber.fromJson(Map<String, dynamic> json) =>
      _$TaxInvoiceNumberFromJson(json);
  const TaxInvoiceNumber._();

  int get remainingInvoice => maxValue - sequence;
}
