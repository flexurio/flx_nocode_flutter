import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'budget_type_bloc.freezed.dart';

@freezed
class BudgetTypeState with _$BudgetTypeState {
  const factory BudgetTypeState.initial() = _Initial;
  const factory BudgetTypeState.loading() = _Loading;
  const factory BudgetTypeState.success() = _Success;
  const factory BudgetTypeState.error(String error) = _Error;
}

@freezed
class BudgetTypeEvent with _$BudgetTypeEvent {
  const factory BudgetTypeEvent.create({
    required String name,
    required int level,
    required BudgetTypeUsageType usageType,
    required BudgetTypeDepartmentType departmentType,
    required int parent,
  }) = _Create;

  const factory BudgetTypeEvent.edit({
    required int id,
    required String name,
  }) = _Edit;

  const factory BudgetTypeEvent.delete(BudgetType budgetType) = _Delete;
}

class BudgetTypeBloc extends Bloc<BudgetTypeEvent, BudgetTypeState> {
  BudgetTypeBloc() : super(const _Initial()) {
    on<BudgetTypeEvent>((event, emit) async {
      await event.when(
        create: (name, level, usageType, departmentType, parent) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.budgetTypeCreate(
              accessToken: UserRepositoryApp.instance.token!,
              name: name,
              level: level,
              usageType: usageType,
              parent: parent,
              departmentType: departmentType,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (id, name) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.budgetTypeEdit(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (budgetType) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.budgetTypeDelete(
              accessToken: UserRepositoryApp.instance.token!,
              budgetType: budgetType,
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
