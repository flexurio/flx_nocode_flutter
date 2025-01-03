import 'package:flexurio_chiron_accounting/src/app/model/type_cost.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_cost_query_bloc.freezed.dart';

@freezed
class TypeCostQueryState with _$TypeCostQueryState {
  const factory TypeCostQueryState.initial() = _Initial;
  const factory TypeCostQueryState.loading() = _Loading;
  const factory TypeCostQueryState.loaded(
    List<TypeCost> typeCosts,
  ) = _Loaded;
  const factory TypeCostQueryState.error(String error) = _Error;
}

@freezed
class TypeCostQueryEvent with _$TypeCostQueryEvent {
  const factory TypeCostQueryEvent.fetch() = _Fetch;
}

class TypeCostQueryBloc extends Bloc<TypeCostQueryEvent, TypeCostQueryState> {
  TypeCostQueryBloc() : super(const _Initial()) {
    on<TypeCostQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(const _Loading());
          try {
            final type = await FinanceRepository.instance.typeCostFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Loaded(type));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
