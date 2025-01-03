import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JournalTransactionExportExcelButton extends StatefulWidget {
  const JournalTransactionExportExcelButton({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => JournalTransactionQueryBloc(),
      child: const JournalTransactionExportExcelButton(),
    );
  }

  @override
  State<JournalTransactionExportExcelButton> createState() =>
      _JournalTransactionExportExcelButtonState();
}

class _JournalTransactionExportExcelButtonState
    extends State<JournalTransactionExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<JournalTransactionQueryBloc>();

    return BlocListener<JournalTransactionQueryBloc,
        JournalTransactionQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<JournalTransaction>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'date'.tr(),
                  builder: (data, index) => data.date.ddMMyyyy,
                ),
                TColumn(
                  title: 'transaction'.tr(),
                  builder: (data, index) => data.transactionNo,
                ),
                TColumn(
                  title: 'chart_of_account'.tr(),
                  builder: (data, index) => data.chartOfAccountName,
                ),
                TColumn(
                  title: 'debit'.tr(),
                  numeric: true,
                  builder: (data, index) => data.debet.format(),
                ),
                TColumn(
                  title: 'credit'.tr(),
                  numeric: true,
                  builder: (data, index) => data.credit.format(),
                ),
                TColumn(
                  title: 'description'.tr(),
                  builder: (data, index) => data.description,
                ),
                TColumn(
                  title: 'department'.tr(),
                  builder: (data, index) => data.departmentName,
                ),
                TColumn(
                  title: 'LPB',
                  builder: (data, index) => data.lpb,
                ),
                TColumn(
                  title: 'period'.tr(),
                  builder: (data, index) => data.period,
                ),
              ],
            );
            saveFile(bytes, 'Journal_Transaction_Report.xlsx');
          },
        );
      },
      child: BlocBuilder<JournalTransactionQueryBloc,
          JournalTransactionQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionAccounting.journalTransactionExportExcel,
            onPressed: () {
              bloc.add(
                JournalTransactionQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(sortBy: 'date'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
