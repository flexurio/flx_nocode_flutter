import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_detail.freezed.dart';
part 'accounts_receivable_detail.g.dart';

@freezed
class AccountsReceivableDetail with _$AccountsReceivableDetail {

  factory AccountsReceivableDetail({
    @JsonKey(name: 'transaction_no') required String transactionNo, 
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime) required DateTime transactionDate,
    @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) required DateTime dueDate, @JsonKey(name: 'customer') required String customer, @JsonKey(name: 'city_customer') required String cityCustomer, @JsonKey(name: 'address_customer') required String addressCustomer, @JsonKey(name: 'amount') required int amount, @JsonKey(name: 'total_customer') required int totalCustomer, @JsonKey(name: 'customer_id') required String customerId, @JsonKey(name: 'transaction_type') String? transactionType, 
    
  }) = _AccountsReceivableDetail;

  const AccountsReceivableDetail._();

  factory AccountsReceivableDetail.empty() {
    return AccountsReceivableDetail(
      transactionNo: '', 
      transactionDate: DateTime(0), 
      transactionType: '',
      dueDate: DateTime(0), 
      customer: '',
      cityCustomer: '', 
      addressCustomer: '', 
      amount: 0, 
      totalCustomer: 0,
      customerId: '', 
    );
  }

  factory AccountsReceivableDetail.fromJson(Map<String, dynamic> json) => _$AccountsReceivableDetailFromJson(json);
}
