import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cek_address_detail_query_bloc.freezed.dart';

@freezed
class CekAddressDetailQueryState with _$CekAddressDetailQueryState {
  const factory CekAddressDetailQueryState.initial() = _Initial;
  const factory CekAddressDetailQueryState.loading() = _Loading;
  const factory CekAddressDetailQueryState.loaded(
    String cekAddress,
  ) = _Loaded;
  const factory CekAddressDetailQueryState.error(String message) = _Error;
}

@freezed
class CekAddressDetailQueryEvent with _$CekAddressDetailQueryEvent {
  const factory CekAddressDetailQueryEvent.fetch({
    required String latitude,
    required String longitude,
  }) = _Fetch;
}

class CekAddressDetailQueryBloc
    extends Bloc<CekAddressDetailQueryEvent, CekAddressDetailQueryState> {
  CekAddressDetailQueryBloc() : super(const _Initial()) {
    on<CekAddressDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (latitude, longitude) async {
          emit(const _Loading());
          try {
            final cekAddressDetail =
                await PurchasingRepository.instance.cekAddressDetailFetch(
              latitude: latitude,
              longitude: longitude,
            );
            emit(
              _Loaded(
                cekAddressDetail,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
