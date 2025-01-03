import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_bloc.freezed.dart';

@freezed
class ProductReturnNoteState with _$ProductReturnNoteState {
  const factory ProductReturnNoteState.initial() = _Initial;
  const factory ProductReturnNoteState.loading() = _Loading;
  const factory ProductReturnNoteState.success() = _Success;
  const factory ProductReturnNoteState.error(String error) = _Error;
}

@freezed
class ProductReturnNoteEvent with _$ProductReturnNoteEvent {
  const factory ProductReturnNoteEvent.create({
    required String currencyId,
    required String customerId,
    required String departmentId,
    required String transactionTypeId,
    required int rateId,
    required String purchaseOrderId,
    required DateTime returnDate,
    required String shippingAddress,
    required String addressName,
    required DateTime deliveryNoteDate,
    required int termOfPayment,
    required String remark,
    required double subtotal,
    required double discountPercentage,
    required double discountValue,
    required Ppn ppnPercentage,
    required double ppnValue,
    required double total,
  }) = _Create;
  const factory ProductReturnNoteEvent.edit({
    required String productReturnNoteId,
    required String shippingAddress,
    required String addressName,
    required DateTime deliveryNoteDate,
    required int termOfPayment,
    required String remark,
    required double subtotal,
    required double discountPercentage,
    required double discountValue,
    required Ppn ppnPercentage,
    required double ppnValue,
    required double total,
    required String currencyId,
    required String transactionTypeId,
    required int rateId,
    required String purchaseOrderId,
  }) = _Edit;
  const factory ProductReturnNoteEvent.delete({
    required String productReturnNoteId,
  }) = _Delete;
  const factory ProductReturnNoteEvent.approve({
    required String productReturnNoteId,
  }) = _Approve;
}

class ProductReturnNoteBloc
    extends Bloc<ProductReturnNoteEvent, ProductReturnNoteState> {
  ProductReturnNoteBloc() : super(const _Initial()) {
    on<ProductReturnNoteEvent>((event, emit) async {
      await event.when(
        create: (
          currencyId,
          customerId,
          departmentId,
          transactionTypeId,
          rateId,
          purchaseOrderId,
          returnDate,
          shippingAddress,
          addressName,
          deliveryNoteDate,
          termOfPayment,
          remark,
          subtotal,
          discountPercentage,
          discountValue,
          ppnPercentage,
          ppnValue,
          total,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteCreate(
              accessToken: UserRepositoryApp.instance.token!,
              currencyId: currencyId,
              customerId: customerId,
              departmentId: departmentId,
              transactionTypeId: transactionTypeId,
              rateId: rateId,
              purchaseOrderId: purchaseOrderId,
              returnDate: returnDate,
              shippingAddress: shippingAddress,
              addressName: addressName,
              deliveryNoteDate: deliveryNoteDate,
              termOfPayment: termOfPayment,
              remark: remark,
              subtotal: subtotal,
              discountPercentage: discountPercentage,
              discountValue: discountValue,
              ppnPercentage: ppnPercentage,
              ppnValue: ppnValue,
              total: total,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (productReturnNoteId,
            shippingAddress,
            addressName,
            deliveryNoteDate,
            termOfPayment,
            remark,
            subtotal,
            discountPercentage,
            discountValue,
            ppnPercentage,
            ppnValue,
            total,
            currencyId,
            transactionTypeId,
            rateId,
            purchaseOrderId) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnNoteId: productReturnNoteId,
              shippingAddress: shippingAddress,
              addressName: addressName,
              deliveryNoteDate: deliveryNoteDate,
              termOfPayment: termOfPayment,
              remark: remark,
              subtotal: subtotal,
              discountPercentage: discountPercentage,
              discountValue: discountValue,
              ppnPercentage: ppnPercentage,
              ppnValue: ppnValue,
              total: total,
              currencyId: currencyId,
              transactionTypeId: transactionTypeId,
              rateId: rateId,
              purchaseOrderId: purchaseOrderId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (productReturnNoteId) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnNoteId: productReturnNoteId,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approve: (productReturnNoteId) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteApprove(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnNoteId: productReturnNoteId,
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
