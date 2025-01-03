import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_stock_card_rupiah.freezed.dart';
part 'material_stock_card_rupiah.g.dart';

@freezed
class MaterialStockCardRupiah with _$MaterialStockCardRupiah {
  const factory MaterialStockCardRupiah({
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'na') String? na,
    @JsonKey(name: 'material_date', fromJson: isoDateToDateTime) required DateTime materialDate,
    @JsonKey(name: 'material_id') required String materialId, @JsonKey(name: 'quantity_credit') required int quantityCredit, @JsonKey(name: 'price_credit') required int priceCredit, @JsonKey(name: 'value_credit') required int valueCredit, @JsonKey(name: 'quantity_debit') required int quantityDebit, @JsonKey(name: 'price_debit') required int priceDebit, @JsonKey(name: 'value_debit') required int valueDebit, @JsonKey(name: 'quantity_credit_summary') required int quantityCreditSummary, @JsonKey(name: 'price_credit_summary') required int priceCreditSummary, @JsonKey(name: 'value_credit_summary') required int valueCreditSummary, @JsonKey(name: 'quantity_debit_summary') required int quantityDebitSummary, @JsonKey(name: 'price_debit_summary') required int priceDebitSummary, @JsonKey(name: 'value_debit_summary') required int valueDebitSummary, @JsonKey(name: 'material_name') String? materialName,
    @JsonKey(name: 'quantity_balance') int? quantityBalance,
    @JsonKey(name: 'price_balance') int? priceBalance,
    @JsonKey(name: 'value_balance') int? valueBalance,
    @JsonKey(name: 'quantity_balance_summary') int? quantityBalanceSummary,
    @JsonKey(name: 'price_balance_summary') int? priceBalanceSummary,
    @JsonKey(name: 'value_balance_summary') int? valueBalanceSummary,
  }) = _MaterialStockCardRupiah;

  const MaterialStockCardRupiah._();

  factory MaterialStockCardRupiah.empty() => MaterialStockCardRupiah(
    transactionId: '', 
    materialDate: DateTime(0), 
    materialId: '', 
    quantityCredit: 0, 
    priceCredit: 0, 
    valueCredit: 0, 
    quantityDebit: 0,
    priceDebit: 0, 
    valueDebit: 0, 
    quantityCreditSummary: 0, 
    priceCreditSummary: 0, 
    valueCreditSummary: 0, 
    quantityDebitSummary: 0, 
    priceDebitSummary: 0, 
    valueDebitSummary: 0,
  );

  factory MaterialStockCardRupiah.fromJson(Map<String, dynamic> json) => _$MaterialStockCardRupiahFromJson(json);
}
