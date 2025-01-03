import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'medical_treatment_expense_department.freezed.dart';
part 'medical_treatment_expense_department.g.dart';

@freezed
class MedicalTreatmentExpenseDepartment
    with _$MedicalTreatmentExpenseDepartment {
  const factory MedicalTreatmentExpenseDepartment({
    @JsonKey(name: 'department') required String department,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'delivery_order_id') required String deliveryOrderId,
    @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
    required DateTime deliveryOrderDate,
    @JsonKey(name: 'ex_date', fromJson: isoDateToDateTime)
    required DateTime expiredDate,
    @JsonKey(name: 'batch_no') required String batchNo,
    @JsonKey(name: 'unit_id') required String unitId,
    @JsonKey(name: 'qty') required int quantity,
    @JsonKey(name: 'product_price') required double productPrice,
    @JsonKey(name: 'amount') required double amount,
  }) = _MedicalTreatmentExpenseDepartment;
  const MedicalTreatmentExpenseDepartment._();

  factory MedicalTreatmentExpenseDepartment.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MedicalTreatmentExpenseDepartmentFromJson(json);

  factory MedicalTreatmentExpenseDepartment.empty() =>
      MedicalTreatmentExpenseDepartment(
        department: '',
        productId: '',
        productName: '',
        deliveryOrderId: '',
        deliveryOrderDate: DateTime(0),
        expiredDate: DateTime(0),
        batchNo: '',
        unitId: '',
        quantity: 0,
        productPrice: 0,
        amount: 0,
      );
}
