import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_detail.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_detail_bloc.freezed.dart';

@freezed
class InvoiceReceiveDetailState with _$InvoiceReceiveDetailState {
  const factory InvoiceReceiveDetailState.initial() = _Initial;
  const factory InvoiceReceiveDetailState.loading() = _Loading;
  const factory InvoiceReceiveDetailState.success() = _Success;
  const factory InvoiceReceiveDetailState.error(String error) = _Error;
}

@freezed
class InvoiceReceiveDetailEvent with _$InvoiceReceiveDetailEvent {
  const factory InvoiceReceiveDetailEvent.create({
    required InvoiceReceive invoiceReceive,
    required MaterialUnit unit,
    required Material material,
    required Product product,
    required double qtyInvoice,
    required double price,
    required double total,
  }) = _Create;
  const factory InvoiceReceiveDetailEvent.delete({
    required InvoiceReceiveDetail invoiceReceiveDetail,
  }) = _Delete;
}

class InvoiceReceiveDetailBloc
    extends Bloc<InvoiceReceiveDetailEvent, InvoiceReceiveDetailState> {
  InvoiceReceiveDetailBloc() : super(const _Initial()) {
    on<InvoiceReceiveDetailEvent>((event, emit) async {
      await event.when(
        create: (
          invoiceReceive,
          unit,
          material,
          product,
          qtyInvoice,
          price,
          total,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
              unitId: unit.id,
              materialId: material.id.isEmpty ? null : material.id,
              productId: product.id.isEmpty ? null : product.id,
              qtyInvoice: qtyInvoice,
              price: price,
              total: total,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (invoiceReceiveDetail) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveDetailDelete(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceiveDetail: invoiceReceiveDetail,
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
