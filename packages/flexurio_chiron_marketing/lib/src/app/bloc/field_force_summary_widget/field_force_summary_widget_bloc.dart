import 'package:flexurio_chiron_marketing/src/app/bloc/field_force_summary_query/field_force_summary_query_bloc.dart';
import 'package:flexurio_chiron_marketing/src/app/model/field_force_summary.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/card_tab.dart';
import 'package:flexurio_chiron_marketing/src/app/view/page/marketing_field_force_summary/widget/dimension_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'field_force_summary_widget_bloc.freezed.dart';

typedef FFSWE = FieldForceSummaryWidgetEvent;
typedef FFSWS = FieldForceSummaryWidgetState;
typedef FFSWB = FieldForceSummaryWidgetBloc;

@freezed
class FieldForceSummaryWidgetEvent with _$FieldForceSummaryWidgetEvent {
  const factory FieldForceSummaryWidgetEvent.add(CardTabItem child) = _Add;
  const factory FieldForceSummaryWidgetEvent.addSub(CardTab child) = _AddSub;
  const factory FieldForceSummaryWidgetEvent.remove(int index) = _Remove;
  const factory FieldForceSummaryWidgetEvent.removeSub(int index) = _RemoveSub;
  const factory FieldForceSummaryWidgetEvent.switchPage(int index) =
      _SwitchPage;
  const factory FieldForceSummaryWidgetEvent.switchPageSub(int index) =
      _SwitchPageSub;
  const factory FieldForceSummaryWidgetEvent.setState() = _SetState;
}

class FieldForceSummaryWidgetState {
  FieldForceSummaryWidgetState({
    required this.parent,
    required this.children,
    required this.page,
    required this.chartTables,
  });
  FieldForceSummaryWidgetState copyWith({
    Widget? parent,
    List<CardTabItem>? children,
    int? page,
    Map<int, CardTab?>? chartTables,
  }) {
    return FieldForceSummaryWidgetState(
      children: children ?? this.children,
      page: page ?? this.page,
      parent: parent ?? this.parent,
      chartTables: chartTables ?? this.chartTables,
    );
  }

  final Widget parent;
  final List<CardTabItem> children;
  final int page;
  final Map<int, CardTab?> chartTables;
}

class FieldForceSummaryWidgetBloc
    extends Bloc<FieldForceSummaryWidgetEvent, FieldForceSummaryWidgetState> {
  FieldForceSummaryWidgetBloc({
    required FieldForceSummaryQueryBloc bloc,
    required String areaCode,
    required DateTime periodStart,
    required DateTime periodEnd,
    required String title,
    required int index,
    required FieldForceSummaryCategorySub categorySub,
    required FieldForceSummaryFlag flag,
  }) : super(
          FieldForceSummaryWidgetState(
            parent: DimensionChart.prepare(
              bloc: bloc,
              areaCode: areaCode,
              periodEnd: periodEnd,
              periodStart: periodStart,
              title: title,
              categorySub: categorySub,
              index: index,
              flag: flag,
            ),
            children: [],
            page: 0,
            chartTables: {},
          ),
        ) {
    on<FieldForceSummaryWidgetEvent>((event, emit) async {
      await event.when(
        add: (tab) async {
          late FFSWS newState;
          final indexExists =
              state.children.indexWhere((child) => child.name == tab.name);
          if (indexExists > -1) {
            newState = state.copyWith(page: indexExists);
          } else {
            final children = List<CardTabItem>.from(state.children)..add(tab);
            newState = state.copyWith(
              children: children,
              page: children.length - 1,
            );
          }
          emit(newState);
        },
        switchPage: (page) async {
          final newState = state.copyWith(page: page);
          emit(newState);
        },
        setState: () async {
          emit(state.copyWith());
        },
        remove: (index) async {
          final children = List<CardTabItem>.from(state.children)
            ..removeAt(index);
          var page = state.page;
          if (state.children.length > 1 &&
              state.page >= state.children.length - 1) {
            page = state.children.length - 2;
          }
          final newState = state.copyWith(children: children, page: page);
          emit(newState);
        },
        addSub: (child) {
          final chartTables = state.chartTables;
          if (chartTables.containsKey(state.page)) {
            final children = chartTables[state.page]!
                .copyWithNewItem(item: child.items.first);
            chartTables[state.page] = children;
          } else {
            chartTables[state.page] = child;
          }
          final newState = state.copyWith(chartTables: chartTables);
          emit(newState);
        },
        switchPageSub: (index) {
          final chartTables = state.chartTables;
          final children =
              chartTables[state.page]!.copyWithSetPage(page: index);
          chartTables[state.page] = children;
          final newState = state.copyWith(chartTables: chartTables);
          emit(newState);
        },
        removeSub: (index) {
          final chartTables = state.chartTables;
          chartTables[state.page]!.items.removeAt(index);
          final lengthItems = chartTables[state.page]!.items.length;
          final initialPage = chartTables[state.page]!.initialPage;
          var page = initialPage;
          if (initialPage > lengthItems - 1) {
            page = lengthItems - 1;
          }
          final children = chartTables[state.page]!.copyWithSetPage(page: page);
          chartTables[state.page] = children;
          final newState = state.copyWith(chartTables: chartTables);
          emit(newState);
        },
      );
    });
  }
}
