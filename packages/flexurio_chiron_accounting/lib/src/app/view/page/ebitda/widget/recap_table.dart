import 'package:flexurio_chiron_accounting/src/app/bloc/ebitda_recap_query/ebitda_recap_bloc.dart';
import 'package:appointment/src/app/bloc/value/bloc/value_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/ebitda_recap.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EbitdaRecapTable extends StatelessWidget {
  const EbitdaRecapTable({
    required this.ebitdaRecapQueryBloc,
    required this.valueBloc,
    required this.closeWhenTapped,
    super.key,
  });

  final EbitdaRecapQueryBloc ebitdaRecapQueryBloc;
  final ValueBloc<String> valueBloc;
  final bool closeWhenTapped;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return BlocBuilder<EbitdaRecapQueryBloc, EbitdaRecapQueryState>(
      bloc: ebitdaRecapQueryBloc,
      builder: (context, state) {
        return YuhuTable<EbitdaRecap>(
          data: state.maybeWhen(
            loaded: (ebitdaRecaps) => ebitdaRecaps,
            orElse: () => [],
          ),
          status: state.maybeWhen(
            loaded: (_) => Status.loaded,
            loading: () => Status.progress,
            orElse: () => Status.error,
          ),
          columns: [
            TableColumn(
              width: 70,
              sortString: (ebitda) => ebitda.area,
              title: 'Area',
              builder: (ebitdaRecap, _) {
                return InkWell(
                  onTap: () {
                    valueBloc.add(ebitdaRecap.area);
                    if (closeWhenTapped) {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    ebitdaRecap.area,
                    style: TextStyle(color: primaryColor),
                  ),
                );
              },
            ),
            TableColumn(
              width: 115,
              title: 'Amount',
              sortNum: (ebitda) => ebitda.amount,
              alignment: Alignment.centerRight,
              builder: (ebitdaRecap, _) {
                return Text(ebitdaRecap.amount.format());
              },
            ),
            TableColumn(
              width: 75,
              title: 'Percent',
              sortString: (ebitda) => ebitda.amountPercent.toString(),
              alignment: Alignment.centerRight,
              builder: (ebitdaRecap, _) {
                return Text('${ebitdaRecap.amountPercent}%');
              },
            ),
            TableColumn(
              width: 130,
              title: 'Amount YTD',
              sortNum: (ebitda) => ebitda.amountYTD,
              alignment: Alignment.centerRight,
              builder: (ebitdaRecap, _) {
                return Text(ebitdaRecap.amountYTD.format());
              },
            ),
            TableColumn(
              width: 100,
              title: 'Percent YTD',
              sortString: (ebitda) => ebitda.amountPercentYTD.toString(),
              alignment: Alignment.centerRight,
              builder: (ebitdaRecap, _) {
                return Text('${ebitdaRecap.amountPercentYTD}%');
              },
            ),
          ],
        );
      },
    );
  }
}
