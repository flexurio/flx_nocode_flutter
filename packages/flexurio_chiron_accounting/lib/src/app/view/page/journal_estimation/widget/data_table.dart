import 'package:flexurio_chiron_accounting/src/app/bloc/jornal_estimation_query_bloc/journal_estimation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_estimation/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/journal_estimation/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalEstimationDataTable extends StatelessWidget {
  const JournalEstimationDataTable({super.key});

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => JournalEstimationQueryBloc()
            ..add(JournalEstimationQueryEvent.fetch()),
        ),
      ],
      child: const JournalEstimationDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JournalEstimationQueryBloc, JournalEstimationQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSet2<JournalEstimation>(
            key: ValueKey(state.hashCode),
            onRefresh: () => context
                .read<JournalEstimationQueryBloc>()
                .add(JournalEstimationQueryEvent.fetch()),
            data: state.maybeWhen(
              orElse: () => [],
              loaded: (journalEstimations) => journalEstimations,
            ),
            status: state.maybeWhen(
              orElse: () => Status.error,
              loading: () => Status.progress,
              loaded: (_) => Status.loaded,
            ),
            title: Entity.journalEstimation.title,
            actionRight: (refreshButton) => [
              refreshButton,
              const JournalEstimationCreateButton(),
            ],
            search: (journalEstimation) => [
              journalEstimation.id,
              journalEstimation.name,
              journalEstimation.type.id,
              journalEstimation.createdAt.yMMMdHm,
              journalEstimation.updatedAt.yMMMdHm,
            ],
            columns: [
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('code'.tr()),
                  sortString: (journalEstimation) => journalEstimation.id,
                ),
                body: (journalEstimation) => DataCell(
                  Text(journalEstimation.id),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('name'.tr()),
                  sortString: (journalEstimation) => journalEstimation.name,
                ),
                body: (journalEstimation) => DataCell(
                  Text(journalEstimation.name),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('type'.tr()),
                  sortString: (journalEstimation) => journalEstimation.name,
                ),
                body: (journalEstimation) => DataCell(
                  ChipType(journalEstimation.type),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('created_at'.tr()),
                  sortNum: (journalEstimation) =>
                      journalEstimation.createdAt.millisecondsSinceEpoch,
                ),
                body: (journalEstimation) => DataCell(
                  Text(journalEstimation.createdAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('updated_at'.tr()),
                  sortNum: (journalEstimation) =>
                      journalEstimation.updatedAt.millisecondsSinceEpoch,
                ),
                body: (journalEstimation) => DataCell(
                  Text(journalEstimation.updatedAt.yMMMdHm),
                ),
              ),
              DTColumnXX(
                head: DTHeadXX(
                  label: Text('actions'.tr()),
                ),
                body: (journalEstimation) => DataCell(
                  JournalEstimationDeleteButton.prepare(
                    journalEstimation: journalEstimation,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
