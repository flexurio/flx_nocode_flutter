// import 'package:appointment/src/app/model/city.dart';
// import 'package:appointment/src/app/model/country.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_bloc.freezed.dart';

@freezed
class VendorState with _$VendorState {
  const factory VendorState.initial() = _Initial;
  const factory VendorState.loading() = _Loading;
  const factory VendorState.success() = _Success;
  const factory VendorState.error(String error) = _Error;
}

@freezed
class VendorEvent with _$VendorEvent {
  const factory VendorEvent.create({
    required String id,
    required String name,
    required String address,
    required String city,
    required String country,
    // required City city,
    // required Country country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
  }) = _Create;
  const factory VendorEvent.update({
    required String id,
    required String name,
    required String address,
    // required City city,
    // required Country country,
    required String city,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
  }) = _Update;
  const factory VendorEvent.delete(String id) = _Delete;
}

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorBloc() : super(const _Initial()) {
    on<VendorEvent>((event, emit) async {
      await event.when(
        create: (
          id,
          name,
          address,
          // City city,
          // Country country,
          city,
          country,
          postalCode,
          phone,
          fax,
          pic,
          email,
          npwp,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vendorCreate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              address: address,
              city: city,
              country: country,
              postalCode: postalCode,
              phone: phone,
              fax: fax,
              pic: pic,
              email: email,
              npwp: npwp,
              termOfPayment: 1,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          id,
          name,
          address,
          city,
          country,
          // City city,
          // Country country,
          postalCode,
          phone,
          fax,
          pic,
          email,
          npwp,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vendorUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              address: address,
              city: city,
              country: country,
              postalCode: postalCode,
              phone: phone,
              fax: fax,
              pic: pic,
              email: email,
              npwp: npwp,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.vendorDelete(
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
