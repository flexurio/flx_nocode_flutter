import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'accounts_receivable_group.freezed.dart';
part 'accounts_receivable_group.g.dart';

@freezed
class AccountsReceivableGroup with _$AccountsReceivableGroup {

  factory AccountsReceivableGroup({
    @JsonKey(name: 'id') required String id, 
    @JsonKey(name: 'name_delivery_address') required String nameDeliveryAddress, @JsonKey(name: 'date', fromJson: isoDateToDateTime) required DateTime date, @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) required DateTime dueDate, @JsonKey(name: 'city_delivery_address') String? cityDeliveryAddress, 
    @JsonKey(name: 'payment_amount') int? paymentAmount,
  }) = _AccountsReceivableGroup;

  const AccountsReceivableGroup._();

  factory AccountsReceivableGroup.empty() {
    return AccountsReceivableGroup(
      id: '', 
      nameDeliveryAddress: '', 
      date: DateTime(0), 
      dueDate: DateTime(0), 
    );
  }

  factory AccountsReceivableGroup.fromJson(Map<String, dynamic> json) => _$AccountsReceivableGroupFromJson(json);
}
