import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_ticket/src/app/view/page/ticket/widget/ticket_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final department = UserRepositoryApp.instance.departmentTicket;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      children: [
        Row(
          children: [
            Expanded(
              child: FCard(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (department != null)
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TicketDataTable.prepare(
                          department: department,
                        ),
                      )
                    else
                      const Text(
                        'Oops! Your account has not been '
                        'assigned to any department.',
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
