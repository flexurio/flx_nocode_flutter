import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/flexurio_chiron_finance.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'customer_discount_bloc.freezed.dart';

@freezed
class CustomerDiscountState with _$CustomerDiscountState {
  const factory CustomerDiscountState.initial() = _Initial;
  const factory CustomerDiscountState.loading() = _Loading;
  const factory CustomerDiscountState.success() = _Success;
  const factory CustomerDiscountState.error(String error) = _Error;
}

@freezed
class CustomerDiscountEvent with _$CustomerDiscountEvent {
  const factory CustomerDiscountEvent.create({
    required double discount,
    required DateTime startDate,
    required Customer customer,
  }) = _Create;

  const factory CustomerDiscountEvent.delete({
    required CustomerDiscount customerDiscount,
  }) = _Delete;
}

class CustomerDiscountBloc
    extends Bloc<CustomerDiscountEvent, CustomerDiscountState> {
  CustomerDiscountBloc() : super(const _Initial()) {
    on<CustomerDiscountEvent>((event, emit) async {
      await event.when(
        create: (
          discount,
          startDate,
          customer,
        ) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.customerDiscountCreate(
              accessToken: UserRepositoryApp.instance.token!,
              customer: customer,
              discount: discount,
              startDate: startDate,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (customerDiscount) async {
          emit(const _Loading());
          try {
            await FinanceRepository.instance.customerDiscountDelete(
              accessToken: UserRepositoryApp.instance.token!,
              customerDiscount: customerDiscount,
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
