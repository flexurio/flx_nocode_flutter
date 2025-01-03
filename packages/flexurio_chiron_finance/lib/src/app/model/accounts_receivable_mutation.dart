import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_mutation.freezed.dart';
part 'accounts_receivable_mutation.g.dart';

@freezed
class AccountsReceivableMutation with _$AccountsReceivableMutation {

  factory AccountsReceivableMutation({
    @JsonKey(name: 'customer') required String customer, 
    @JsonKey(name: 'beginning_balance') required int beginningBalance, 
    @JsonKey(name: 'debit') required int debit, 
    @JsonKey(name: 'credit') required int credit, 
    @JsonKey(name: 'ending_balance') required int endingBalance, 
  }) = _AccountsReceivableMutation;

  const AccountsReceivableMutation._();

  factory AccountsReceivableMutation.empty() {
    return AccountsReceivableMutation(
      customer: '', 
      beginningBalance: 0, 
      debit: 0, 
      credit: 0, 
      endingBalance: 0,
    );
  }

  factory AccountsReceivableMutation.fromJson(Map<String, dynamic> json) => _$AccountsReceivableMutationFromJson(json);
}
