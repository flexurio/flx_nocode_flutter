import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'rate_bloc.freezed.dart';

@freezed
class RateBlocState with _$RateBlocState {
  const factory RateBlocState.initial() = _Initial;
  const factory RateBlocState.loading() = _Loading;
  const factory RateBlocState.success() = _Success;
  const factory RateBlocState.error(String error) = _Error;
}

@freezed
class RateBlocEvent with _$RateBlocEvent {
  const factory RateBlocEvent.create({
    required DateTime validityDate,
    required Currency currency,
    required int rate,
  }) = _Create;
  const factory RateBlocEvent.delete(
    int id,
  ) = _Delete;
}

class RateBloc extends Bloc<RateBlocEvent, RateBlocState> {
  RateBloc() : super(const _Initial()) {
    on<RateBlocEvent>(
      (event, emit) async {
        await event.when(
          create: (
            validityDate,
            currency,
            rate,
          ) async {
            emit(const _Loading());
            try {
              await AccountingRepository.instance.rateCreate(
                accessToken: UserRepositoryApp.instance.token!,
                rate: rate,
                validityDate: validityDate,
                currency: currency,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(const _Loading());
            try {
              await AccountingRepository.instance.rateDelete(
                accessToken: UserRepositoryApp.instance.token!,
                id: id,
              );
              emit(const _Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
