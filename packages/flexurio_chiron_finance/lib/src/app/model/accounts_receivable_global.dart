import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_global.freezed.dart';
part 'accounts_receivable_global.g.dart';

@freezed
class AccountsReceivableGlobal with _$AccountsReceivableGlobal {

  factory AccountsReceivableGlobal({
    @JsonKey(name: 'customer') required String customer, 
    @JsonKey(name: 'address_customer') required String addressCustomer, @JsonKey(name: 'total_customer') required int totalCustomer, @JsonKey(name: 'city_customer') String? cityCustomer, 
  }) = _AccountsReceivableGlobal;

  const AccountsReceivableGlobal._();

  factory AccountsReceivableGlobal.empty() {
    return AccountsReceivableGlobal(
      customer: '',
      cityCustomer: '', 
      addressCustomer: '', 
      totalCustomer: 0,
    );
  }

  factory AccountsReceivableGlobal.fromJson(Map<String, dynamic> json) => _$AccountsReceivableGlobalFromJson(json);
}
