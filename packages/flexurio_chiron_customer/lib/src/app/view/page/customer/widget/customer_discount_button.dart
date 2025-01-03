import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class CustomerDiscountButton extends StatelessWidget {
  const CustomerDiscountButton({
    required this.customer,
    super.key,
  });

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: Permission.customerDiscountViewMenu,
      action: DataAction.showDiscount,
      onPressed: () {
        Navigator.push(
          context,
          CustomerDiscountPage.route(customer: customer),
        );
      },
    );
  }
}
