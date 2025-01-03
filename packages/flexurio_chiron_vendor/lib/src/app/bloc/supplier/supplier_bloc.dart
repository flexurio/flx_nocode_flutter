import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_bloc.freezed.dart';

@freezed
class SupplierState with _$SupplierState {
  const factory SupplierState.initial() = _Initial;
  const factory SupplierState.loading() = _Loading;
  const factory SupplierState.success() = _Success;
  const factory SupplierState.error(String error) = _Error;
}

@freezed
class SupplierEvent with _$SupplierEvent {
  const factory SupplierEvent.create({
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
    required int termOfPayment,
  }) = _Create;
  const factory SupplierEvent.update({
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
    required int termOfPayment,
  }) = _Update;
  const factory SupplierEvent.delete(String id) = _Delete;
}

class SupplierBloc extends Bloc<SupplierEvent, SupplierState> {
  SupplierBloc() : super(const _Initial()) {
    on<SupplierEvent>((event, emit) async {
      await event.when(
        create: (
          String id,
          String name,
          String address,
          String city,
          String country,
          // City city,
          // Country country,
          int postalCode,
          String phone,
          String fax,
          String pic,
          String email,
          String npwp,
          int termOfPayment,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.supplierCreate(
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
              termOfPayment: termOfPayment,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          String id,
          String name,
          String address,
          // City city,
          // Country country,
          String city,
          String country,
          int postalCode,
          String phone,
          String fax,
          String pic,
          String email,
          String npwp,
          int termOfPayment,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.supplierUpdate(
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
              termOfPayment: termOfPayment,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.supplierDelete(
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
