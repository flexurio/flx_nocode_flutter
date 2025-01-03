import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_widget/field_force_summary_widget_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/card_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartTables extends StatelessWidget {
  const ChartTables({required this.bloc, super.key});
  final FFSWB bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FFSWB, FFSWS>(
      bloc: bloc,
      builder: (context, state) {
        return Column(
          children: [
            state.parent,
            if (state.children.isNotEmpty)
              Column(
                children: [
                  const _ArrowDown(),
                  _buildChartTabTable(state),
                  if (state.chartTables[state.page] != null &&
                      state.chartTables[state.page]!.items.isNotEmpty)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const _ArrowDown(),
                        state.chartTables[state.page] ?? const SizedBox(),
                      ],
                    ),
                ],
              ),
          ],
        );
      },
    );
  }

  CardTab _buildChartTabTable(FieldForceSummaryWidgetState state) {
    return CardTab(
      items: state.children,
      initialPage: state.page,
      onPageChanged: (page) {
        final event = FFSWE.switchPage(page);
        bloc.add(event);
      },
      onPageAdded: (page) {
        final event = FFSWE.addSub(page);
        bloc.add(event);
      },
      onPageRemoved: (page) {
        final event = FFSWE.remove(page);
        bloc.add(event);
      },
    );
  }
}

class _ArrowDown extends StatelessWidget {
  const _ArrowDown();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Icon(Icons.arrow_downward),
    );
  }
}
