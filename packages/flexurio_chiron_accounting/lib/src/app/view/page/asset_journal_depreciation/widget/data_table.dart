import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/src/app/bloc/asset_journal_depreciation_query/asset_journal_depreciation_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_journal_depreciation.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_journal_depreciation/widget/create_button.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/asset_journal_depreciation/widget/delete_button.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssetJournalDepreciationDataTable extends StatelessWidget {
  const AssetJournalDepreciationDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => AssetJournalDepreciationQueryBloc()
        ..add(AssetJournalDepreciationQueryEvent.fetch()),
      child: const AssetJournalDepreciationDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetJournalDepreciationQueryBloc,
        AssetJournalDepreciationQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<AssetJournalDepreciation>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onChanged: (pageOptions) {
              context.read<AssetJournalDepreciationQueryBloc>().add(
                    AssetJournalDepreciationQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            key: ValueKey(state.hashCode),
            onRefresh: () =>
                context.read<AssetJournalDepreciationQueryBloc>().add(
                      AssetJournalDepreciationQueryEvent.fetch(),
                    ),
            actionRight: (refreshButton) => [
              refreshButton,
              const AssetJournalDepreciationCreateButton(),
            ],
            columns: [
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  label: 'transaction_id'.tr(),
                  backendColumn: 'transaction_id',
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.transactionId),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'debit',
                  numeric: true,
                  label: 'debt'.tr(),
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.debit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  backendColumn: 'credit',
                  numeric: true,
                  label: 'credit'.tr(),
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.credit.format()),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'transaction_date'.tr(),
                  backendColumn: 'transaction_date',
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.transactionDate.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'period_start'.tr(),
                  backendColumn: 'period_start',
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.periodStart.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'period_end'.tr(),
                  backendColumn: 'period_end',
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.periodEnd.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Text(assetJournalDepreciation.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: null,
                  label: 'actions'.tr(),
                ),
                body: (assetJournalDepreciation) => DataCell(
                  Row(
                    children: [
                      AssetJournalDepreciationDeleteButton.prepare(
                        assetJournalDepreciation:
                            assetJournalDepreciation,
                      ),
                    ],
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
