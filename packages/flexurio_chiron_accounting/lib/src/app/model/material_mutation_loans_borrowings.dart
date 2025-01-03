import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_mutation_loans_borrowings.freezed.dart';
part 'material_mutation_loans_borrowings.g.dart';

@freezed
class MaterialMutationLoansBorrowings with _$MaterialMutationLoansBorrowings {
  const factory MaterialMutationLoansBorrowings({
    @JsonKey(name: 'material_name') required String materialName,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'quantity_credit') required int quantityCredit,
    @JsonKey(name: 'value_credit') required int valueCredit,
    @JsonKey(name: 'quantity_debit') required int quantityDebit,
    @JsonKey(name: 'value_debit') required int valueDebit,
    @JsonKey(name: 'quantity_credit_summary') required int quantityCreditSummary,
    @JsonKey(name: 'value_credit_summary') required int valueCreditSummary,
    @JsonKey(name: 'quantity_debit_summary') required int quantityDebitSummary,
    @JsonKey(name: 'value_debit_summary') required int valueDebitSummary,
  }) = _MaterialMutationLoansBorrowings;

  const MaterialMutationLoansBorrowings._();

  factory MaterialMutationLoansBorrowings.empty() => const MaterialMutationLoansBorrowings(
    materialName: '', 
    materialId: '', 
    quantityCredit: 0, 
    valueCredit: 0, 
    quantityDebit: 0, 
    valueDebit: 0, 
    quantityCreditSummary: 0, 
    valueCreditSummary: 0, 
    quantityDebitSummary: 0, 
    valueDebitSummary: 0,
  );

  factory MaterialMutationLoansBorrowings.fromJson(Map<String, dynamic> json) => _$MaterialMutationLoansBorrowingsFromJson(json);
}
