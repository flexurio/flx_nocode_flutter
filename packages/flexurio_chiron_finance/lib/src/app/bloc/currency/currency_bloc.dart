import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_bloc.freezed.dart';

@freezed
class CurrencyState with _$CurrencyState {
  const factory CurrencyState.initial() = _Initial;
  const factory CurrencyState.loading() = _Loading;
  const factory CurrencyState.success({
    Currency? currency,
  }) = _Success;
  const factory CurrencyState.error(String error) = _Error;
}

@freezed
class CurrencyBlocEvent with _$CurrencyBlocEvent {
  const factory CurrencyBlocEvent.create({required String id}) = _Create;
  const factory CurrencyBlocEvent.delete({required String id}) = _Delete;
}

Future<void> offlineActionHandler(
  Future<void> Function() request, {
  required Function(RequestOptions request, DateTime dateTime) whenOffline,
}) async {
  try {
    return await request();
  } catch (e) {
    if (e is DioError) {
      final dateTime = DateTime.now();
      whenOffline(e.requestOptions, dateTime);
    } else {
      rethrow;
    }
  }
}

class CurrencyBloc extends Bloc<CurrencyBlocEvent, CurrencyState> {
  CurrencyBloc() : super(const _Initial()) {
    on<CurrencyBlocEvent>((event, emit) async {
      await event.when(
        create: (id) async {
          Currency? currency;
          emit(const _Loading());
          try {
            await offlineActionHandler(
              () {
                return AccountingRepository.instance.currencyCreate(
                  id: id,
                  accessToken: UserRepositoryApp.instance.token!,
                );
              },
              whenOffline: (request, dateTime) async {
                currency = Currency(
                  createdAt: dateTime,
                  updatedAt: dateTime,
                  id: id,
                  offline: Offline(
                    host: request.path,
                  ),
                );
              },
            );

            emit(_Success(currency: currency));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.currencyDelete(
              id: id,
              accessToken: UserRepositoryApp.instance.token!,
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
