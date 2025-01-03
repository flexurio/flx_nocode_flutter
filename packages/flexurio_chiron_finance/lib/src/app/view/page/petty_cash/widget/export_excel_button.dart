import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_finance/src/app/bloc/petty_cash_query/petty_cash_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/permission.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/petty_cash/util/excell_petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PettyCashExportExcelButton extends StatefulWidget {
  const PettyCashExportExcelButton({super.key});

  static String permission = PermissionFinance.pettyCashExportExcel;

  static Widget prepare() {
    return BlocProvider(
      create: (context) => PettyCashQueryBloc(),
      child: const PettyCashExportExcelButton(),
    );
  }

  @override
  State<PettyCashExportExcelButton> createState() =>
      _PettyCashExportExcelButtonState();
}

class _PettyCashExportExcelButtonState
    extends State<PettyCashExportExcelButton> {
  DateTime? _startDate;
  DateTime? _endDate;

  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  @override
  void initState() {
    _startDateController.text = _startDate?.yMMMMd ?? '';
    _endDateController.text = _endDate?.yMMMMd ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
      builder: (context, state) {
        final bloc = context.read<PettyCashQueryBloc>();
        return LightButtonSmall(
          action: DataAction.exportExcel,
          permission: PettyCashExportExcelButton.permission,
          onPressed: () {
            _showPeriod(context, bloc);
          },
        );
      },
    );
  }

  Future<void> _showPeriod(
    BuildContext context,
    PettyCashQueryBloc bloc,
  ) async {
    await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) => CardForm(
        popup: true,
        title: 'Select Period',
        icon: Icons.calendar_month_rounded,
        actions: [
          Button(
            action: DataAction.cancel,
            permission: null,
            isSecondary: true,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 12),
          BlocListener<PettyCashQueryBloc, PettyCashQueryState>(
            bloc: bloc,
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                error: (error) => Toast(context).fail(error),
                loaded: (pettyCash) async {
                  if (_startDate != null && _endDate != null) {
                    final bytes = excelPettyCash(pettyCash.data);
                    saveFile(bytes, 'Petty_Cash_Report.xlsx');
                  }
                },
              );
            },
            child: BlocBuilder<PettyCashQueryBloc, PettyCashQueryState>(
              bloc: bloc,
              builder: (context, state) {
                final isProgress = state.maybeWhen(
                  orElse: () => false,
                  loading: (_) => true,
                );
                return Button(
                  action: DataAction.export,
                  permission: null,
                  isInProgress: isProgress,
                  onPressed: () async {
                    if (_startDate != null && _endDate != null) {
                      bloc.add(
                        PettyCashQueryEvent.fetch(
                          startDate: _startDate,
                          endDate: _endDate,
                          pageOptions: PageOptions.emptyNoLimit(),
                        ),
                      );
                    } else {
                      Toast(context).fail('You must insert the Date');
                    }
                  },
                );
              },
            ),
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldDatePicker(
              labelText: 'Period Start',
              controller: _startDateController,
              onChanged: (value) {
                _startDate = value;
              },
            ),
            const SizedBox(height: 12),
            FieldDatePicker(
              labelText: 'Period End',
              controller: _endDateController,
              onChanged: (value) {
                _endDate = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
