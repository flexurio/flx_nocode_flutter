import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'type_cost_bloc.freezed.dart';

@freezed
class TypeCostState with _$TypeCostState {
  const factory TypeCostState.initial() = _Initial;
  const factory TypeCostState.loading() = _Loading;
  const factory TypeCostState.success() = _Success;
  const factory TypeCostState.error(String error) = _Error;
}

@freezed
class TypeCostEvent with _$TypeCostEvent {
  const factory TypeCostEvent.create({
    required String name,
    required ChartOfAccountNumber chartOfAccountNumber,
  }) = _Create;
  const factory TypeCostEvent.edit({
    required String name,
    required ChartOfAccountNumber chartOfAccountNumber,
    required int id,
  }) = _Edit;
  const factory TypeCostEvent.delete({
    required int id,
  }) = _Delete;
}

class TypeCostBloc extends Bloc<TypeCostEvent, TypeCostState> {
  TypeCostBloc() : super(const _Initial()) {
    on<TypeCostEvent>((event, emit) async {
      await event.when(
        create: (name, chartOfAccountNumber) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.typeCostCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              chartOfAccountNumber: chartOfAccountNumber,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (name, chartOfAccountNumber, id) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.typeCostEdit(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              chartOfAccountNumber: chartOfAccountNumber,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.typeCostDelete(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
