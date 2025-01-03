import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_detail_bloc.freezed.dart';

@freezed
class ProductReturnNoteDetailState with _$ProductReturnNoteDetailState {
  const factory ProductReturnNoteDetailState.initial() = _Initial;
  const factory ProductReturnNoteDetailState.loading() = _Loading;
  const factory ProductReturnNoteDetailState.success() = _Success;
  const factory ProductReturnNoteDetailState.error(String error) = _Error;
}

@freezed
class ProductReturnNoteDetailEvent with _$ProductReturnNoteDetailEvent {
  const factory ProductReturnNoteDetailEvent.create({
    required String productReturnNoteId,
    required String productReturnId,
    required String productId,
    required String batchNoId,
    required String deliveryOrderId,
    required String unitId,
    required int quantity,
    required double price,
    required double total,
  }) = _Create;
  const factory ProductReturnNoteDetailEvent.delete({
    required int id,
  }) = _Delete;
}

class ProductReturnNoteDetailBloc
    extends Bloc<ProductReturnNoteDetailEvent, ProductReturnNoteDetailState> {
  ProductReturnNoteDetailBloc() : super(const _Initial()) {
    on<ProductReturnNoteDetailEvent>((event, emit) async {
      await event.when(
        create: (
          productReturnNoteId,
          productReturnId,
          productId,
          batchNoId,
          deliveryOrderId,
          unitId,
          quantity,
          price,
          total,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnNoteId: productReturnNoteId,
              productReturnId: productReturnId,
              productId: productId,
              batchNoId: batchNoId,
              deliveryOrderId: deliveryOrderId,
              unitId: unitId,
              quantity: quantity,
              price: price,
              total: total,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (id) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnNoteDetailDelete(
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
