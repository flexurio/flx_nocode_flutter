import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CustomerDiscountPage extends StatelessWidget {
  const CustomerDiscountPage._({
    required this.customer,
  });
  final Customer customer;

  static Route<void> route({required Customer customer}) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => CustomerDiscountQueryBloc()
          ..add(CustomerDiscountQueryEvent.fetch(customer: customer)),
        child: Material(
          color: Colors.transparent,
          child: CustomerDiscountPage._(customer: customer),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        Row(
          children: [
            BackButtonWithTitle(title: customer.name),
          ],
        ),
        TitlePage(entity: Entity.customerDiscount),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CustomerDiscountDataTable(customer: customer),
        ),
      ],
    );
  }
}
