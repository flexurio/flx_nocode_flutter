import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_bloc.freezed.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;
  const factory CustomerState.loading() = _Loading;
  const factory CustomerState.success() = _Success;
  const factory CustomerState.error(String error) = _Error;
}

@freezed
class CustomerEvent with _$CustomerEvent {
  const factory CustomerEvent.create({
    required String id,
    required String name,
    required String address,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required String nppkp,
    required int term,
    required int discount,
    required bool? isAdministration,
    required String parent,
    required CustomerType customerType,
    required CustomerCategory customerCategory,
  }) = _Create;
  const factory CustomerEvent.update({
    required Customer customer,
    required String name,
    required String address,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required String nppkp,
    required int term,
    required int discount,
    required bool? isAdministration,
    required String parent,
    required CustomerType customerType,
    required CustomerCategory customerCategory,
  }) = _Update;
  const factory CustomerEvent.delete(Customer customer) = _Delete;
}

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  CustomerBloc() : super(const _Initial()) {
    on<CustomerEvent>((event, emit) async {
      await event.when(
        create: (
          String id,
          String name,
          String address,
          String country,
          int postalCode,
          String phone,
          String fax,
          String pic,
          String email,
          String npwp,
          String nppkp,
          int term,
          int discount,
          bool? isAdministration,
          String parent,
          CustomerType customerType,
          CustomerCategory customerCategory,
        ) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.customerCreate(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
              name: name,
              address: address,
              country: country,
              postalCode: postalCode,
              phone: phone,
              fax: fax,
              pic: pic,
              email: email,
              npwp: npwp,
              nppkp: nppkp,
              term: term,
              discount: discount,
              isAdministration: isAdministration!,
              parent: parent,
              customerType: customerType,
              customerCategory: customerCategory,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          Customer customer,
          String name,
          String address,
          String country,
          int postalCode,
          String phone,
          String fax,
          String pic,
          String email,
          String npwp,
          String nppkp,
          int term,
          int discount,
          bool? isAdministration,
          String parent,
          CustomerType customerType,
          CustomerCategory customerCategory,
        ) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.customerUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              customer: customer,
              name: name,
              address: address,
              country: country,
              postalCode: postalCode,
              phone: phone,
              fax: fax,
              pic: pic,
              email: email,
              npwp: npwp,
              nppkp: nppkp,
              term: term,
              discount: discount,
              isAdministration: isAdministration!,
              parent: parent,
              customerType: customerType,
              customerCategory: customerCategory,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (Customer customer) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.customerDelete(
              accessToken: UserRepositoryApp.instance.token!,
              customer: customer,
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
