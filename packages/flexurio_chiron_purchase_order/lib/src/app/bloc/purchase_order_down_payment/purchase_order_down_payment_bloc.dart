import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_order/src/app/resource/purchase_order_down_payment.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_down_payment_bloc.freezed.dart';

@freezed
class PurchaseOrderDownPaymentState with _$PurchaseOrderDownPaymentState {
  const factory PurchaseOrderDownPaymentState.initial() = _Initial;
  const factory PurchaseOrderDownPaymentState.loading() = _Loading;
  const factory PurchaseOrderDownPaymentState.success() = _Success;
  const factory PurchaseOrderDownPaymentState.error(String error) = _Error;
}

@freezed
class PurchaseOrderDownPaymentEvent with _$PurchaseOrderDownPaymentEvent {
  const factory PurchaseOrderDownPaymentEvent.create({
    required String purchaseOrderId,
    required DateTime dueDate,
    required double amount,
    required String description,
    required String accountNumber,
    required String accountName,
  }) = _Create;
}

class PurchaseOrderDownPaymentBloc
    extends Bloc<PurchaseOrderDownPaymentEvent, PurchaseOrderDownPaymentState> {
  PurchaseOrderDownPaymentBloc() : super(const _Initial()) {
    on<PurchaseOrderDownPaymentEvent>((event, emit) async {
      await event.when(
        create: (purchaseOrderId, dueDate, amount, description, accountNumber, accountName) async {
          emit(const _Loading());
          try {
            await PurchaseOrderDownPaymentRepository.instance.create(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrderId,
              dueDate: dueDate,
              amount: amount,
              description: description,
              accountNumber: accountNumber,
              accountName: accountName,
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
