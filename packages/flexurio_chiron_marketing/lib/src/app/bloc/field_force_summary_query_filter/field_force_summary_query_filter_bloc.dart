import 'package:flutter_bloc/flutter_bloc.dart';

class FieldForceSummaryQueryFilterState {
  FieldForceSummaryQueryFilterState({
    required this.areaCode,
    required this.periodStart,
    required this.periodEnd,
  });

  final String areaCode;
  final DateTime periodStart;
  final DateTime periodEnd;
}

class FieldForceSummaryQueryFilterBloc extends Bloc<
    FieldForceSummaryQueryFilterState, FieldForceSummaryQueryFilterState> {
  FieldForceSummaryQueryFilterBloc(super.initialState) {
    on<FieldForceSummaryQueryFilterState>((event, emit) async => emit(event));
  }
}
