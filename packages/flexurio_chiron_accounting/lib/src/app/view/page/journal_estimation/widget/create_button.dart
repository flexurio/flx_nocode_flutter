import 'package:flexurio_chiron_accounting/src/app/bloc/jornal_estimation_query_bloc/journal_estimation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_estimation_create/journal_estimation_create_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalEstimationCreateButton extends StatelessWidget {
  const JournalEstimationCreateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button.small(
      permission: Permission.journalEstimationCreate,
      action: DataAction.create,
      onPressed: () async {
        final queryBloc = context.read<JournalEstimationQueryBloc>();
        final event = JournalEstimationQueryEvent.fetch();
        final success = await Navigator.push(
          context,
          JournalEstimationCreatePage.route(),
        );
        if (success ?? false) {
          queryBloc.add(event);
        }
      },
    );
  }
}
