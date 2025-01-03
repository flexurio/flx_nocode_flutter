import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chart_of_account_group_bloc.freezed.dart';

@freezed
class ChartOfAccountGroupState with _$ChartOfAccountGroupState {
  factory ChartOfAccountGroupState.initial() = _Initial;
  factory ChartOfAccountGroupState.loading() = _Loading;
  factory ChartOfAccountGroupState.success() = _Success;
  factory ChartOfAccountGroupState.error(String error) = _Error;
}

@freezed
class ChartOfAccountGroupEvent with _$ChartOfAccountGroupEvent {
  factory ChartOfAccountGroupEvent.create({
    required String name,
    required String forecastNumber,
    required BalanceGroup balanceGroup,
  }) = _Create;
  factory ChartOfAccountGroupEvent.update({
    required String id,
    required String name,
  }) = _Update;
  factory ChartOfAccountGroupEvent.delete({
    required String id,
  }) = _Delete;
}

class ChartOfAccountGroupBloc
    extends Bloc<ChartOfAccountGroupEvent, ChartOfAccountGroupState> {
  ChartOfAccountGroupBloc() : super(_Initial()) {
    on<ChartOfAccountGroupEvent>(
      (event, emit) async {
        await event.when(
          create: (name, forecastNumber, balanceGroup) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountGroupCreate(
                name: name,
                forecastNumber: forecastNumber,
                balanceGroup: balanceGroup,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          update: (id, name) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountGroupUpdate(
                id: id,
                name: name,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountGroupDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
              );
              emit(
                _Success(),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
