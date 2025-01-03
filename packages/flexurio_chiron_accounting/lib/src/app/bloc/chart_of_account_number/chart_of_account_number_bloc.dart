import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'chart_of_account_number_bloc.freezed.dart';

@freezed
class ChartOfAccountNumberState with _$ChartOfAccountNumberState {
  factory ChartOfAccountNumberState.initial() = _Initial;
  factory ChartOfAccountNumberState.loading() = _Loading;
  factory ChartOfAccountNumberState.success() = _Success;
  factory ChartOfAccountNumberState.error(String error) = _Error;
}

@freezed
class ChartOfAccountNumberEvent with _$ChartOfAccountNumberEvent {
  factory ChartOfAccountNumberEvent.create({
    required String name,
    required String number,
    required ChartOfAccountGroup chartOfAccountGroup,
    required ChartOfAccountNumberStatus status,
    required bool isFactoryOverhead,
  }) = _Create;
  factory ChartOfAccountNumberEvent.update({
    required String id,
    required String name,
    required ChartOfAccountNumberStatus status,
  }) = _Update;
  factory ChartOfAccountNumberEvent.delete({
    required String id,
  }) = _Delete;
}

class ChartOfAccountNumberBloc
    extends Bloc<ChartOfAccountNumberEvent, ChartOfAccountNumberState> {
  ChartOfAccountNumberBloc() : super(_Initial()) {
    on<ChartOfAccountNumberEvent>(
      (event, emit) async {
        await event.when(
          create: (
            name,
            number,
            chartOfAccountGroup,
            status,
            isFactoryOverhead,
          ) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountNumberCreate(
                name: name,
                number: number,
                chartOfAccountGroup: chartOfAccountGroup,
                status: status,
                isFactoryOverhead: isFactoryOverhead,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          update: (id, name, status) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountNumberUpdate(
                id: id,
                name: name,
                accessToken: UserRepositoryApp.instance.token!,
                status: status,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.chartOfAccountNumberDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
