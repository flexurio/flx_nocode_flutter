import 'package:appointment/src/app/view/widget/drop_down_items/drop_down_object.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product_stock/flexurio_chiron_product_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';

class FDropDownSearchProductReturnCheckStatus extends StatelessWidget
    implements DropDownObject<ProductReturnCheckStatus> {
  const FDropDownSearchProductReturnCheckStatus({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.enabled = true,
    this.label,
  });
  @override
  final ProductReturnCheckStatus? initialValue;

  @override
  final void Function(ProductReturnCheckStatus?) onChanged;

  @override
  final String? label;

  @override
  final bool isRequired;

  @override
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? Function(ProductReturnCheckStatus?)? validator;
    if (isRequired) {
      validator = requiredObjectValidator.call;
    }
    return FDropDownSearch<ProductReturnCheckStatus>(
      labelText: label ?? 'check_status'.tr(),
      initialValue: initialValue,
      enabled: enabled,
      validator: validator,
      itemAsString: (dt) => dt.label,
      items: ProductReturnCheckStatus.list,
      onChanged: onChanged,
    );
  }
}
