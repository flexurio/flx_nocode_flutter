import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';

class FDropDownSearchPaymentType extends StatelessWidget
    implements DropDownObject<PaymentType> {
  const FDropDownSearchPaymentType({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });
  @override
  final PaymentType? initialValue;

  @override
  final void Function(PaymentType?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(PaymentType?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    return FDropDownSearch<PaymentType>(
      labelText: label ?? 'Usage Type',
      initialValue: initialValue,
      enabled: enabled,
      validator: validator,
      itemAsString: (dt) => dt.label,
      items: List.from(PaymentType.values)..remove(PaymentType.empty),
      onChanged: onChanged,
    );
  }
}
