import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_a1.freezed.dart';
part 'form_a1.g.dart';

@freezed
class FormA1 with _$FormA1 {
  factory FormA1({
    required String type,
    required DateTime date,
    required String customer,
    required String npwp,
    @JsonKey(name: 'tax_invoice_no') required String taxInvoiceNo, 
    @JsonKey(name: 'sub_after_tax') required int subAfterTax, 
    @JsonKey(name: 'ppn_value') required int ppnValue, 
    @JsonKey(name: 'pph_22_value') required int pph22Value, 
  }) = _FormA1;
  const FormA1._();

  factory FormA1.empty() {
    return FormA1(
      type: '', 
      date: DateTime(0), 
      customer: '', 
      npwp: '', 
      taxInvoiceNo: '', 
      subAfterTax: 0, 
      ppnValue: 0, 
      pph22Value: 0,
    );
  }

  factory FormA1.fromJson(Map<String, dynamic> json) => _$FormA1FromJson(json);
}
