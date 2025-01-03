import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/form_a1.dart';
import 'package:flexurio_chiron_finance/src/app/resource/finance_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_a1_query_bloc.freezed.dart';

@freezed
class FormA1QueryEvent with _$FormA1QueryEvent {
  const factory FormA1QueryEvent.fetch({
    PageOptions<FormA1>? pageOptions, 
    DateTime? periodStart,
    DateTime? periodEnd,
    String? divisi,
  }) = _Fetch;
}

@freezed
class FormA1QueryState with _$FormA1QueryState {
  const factory FormA1QueryState.error(String error) = _Error;
  const factory FormA1QueryState.initial() = _Initial;
  const factory FormA1QueryState.loading(
    PageOptions<FormA1> pageOptions,
  ) = _Loading;
  const factory FormA1QueryState.loaded(
    PageOptions<FormA1> pageOptions,
  ) = _Success;
}

class FormA1QueryBloc extends Bloc<FormA1QueryEvent, FormA1QueryState> {
  FormA1QueryBloc() : super(const _Initial()) {
    on<FormA1QueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, periodStart, periodEnd, divisi) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await FinanceRepository.instance.formA1Fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              periodStart: periodStart,
              periodEnd: periodEnd,
              divisi: divisi,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<FormA1> _pageOptions = PageOptions.empty(sortBy: 'date, C.name');
}
