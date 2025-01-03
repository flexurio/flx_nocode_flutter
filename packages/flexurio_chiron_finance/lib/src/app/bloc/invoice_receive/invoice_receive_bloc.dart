import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive.dart';
import 'package:flexurio_chiron_finance/src/app/model/invoice_receive_document.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_receive_bloc.freezed.dart';

class InvoiceReceiveDetailRequest {
  String unitId;
  String materialId;
  String productId;
  final double quantity;
  final double price;
  final double total;

  InvoiceReceiveDetailRequest({
    required this.unitId,
    required this.materialId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.total,
  });
}

@freezed
class InvoiceReceiveState with _$InvoiceReceiveState {
  const factory InvoiceReceiveState.initial() = _Initial;
  const factory InvoiceReceiveState.loading() = _Loading;
  const factory InvoiceReceiveState.success() = _Success;
  const factory InvoiceReceiveState.error(String error) = _Error;
}

@freezed
class InvoiceReceiveEvent with _$InvoiceReceiveEvent {
  const factory InvoiceReceiveEvent.create({
    required String invoiceNo,
    required PurchaseOrder purchaseOrder,
    required Supplier supplier,
    required double rate,
    required DateTime invoiceDate,
    required String deliveryOrderId,
    required DateTime deliveryOrderDate,
    required String taxInvoiceNo,
    required DateTime taxInvoiceDate,
    required double subtotal,
    required Ppn ppn,
    required TaxType taxType,
    required double total,
    required int termOfPayment,
    required DateTime dueDate,
  }) = _Create;
  const factory InvoiceReceiveEvent.createWithDetail({
    required String invoiceNo,
    required PurchaseOrder purchaseOrder,
    required Supplier supplier,
    required double rate,
    required DateTime invoiceDate,
    required String deliveryOrderId,
    required DateTime deliveryOrderDate,
    required String taxInvoiceNo,
    required DateTime taxInvoiceDate,
    required double subtotal,
    required Ppn ppn,
    required TaxType taxType,
    required double total,
    required int termOfPayment,
    required DateTime dueDate,
    required List<InvoiceReceiveDetailRequest> invoiceReceiveDetails,
  }) = _CreateWithDetail;
  const factory InvoiceReceiveEvent.edit({
    required InvoiceReceive invoiceReceive,
    required double subtotal,
    required Ppn ppn,
    required TaxType taxType,
    required double total,
    required int termOfPayment,
    required DateTime dueDate,
  }) = _Edit;
  const factory InvoiceReceiveEvent.delete({
    required InvoiceReceive invoiceReceive,
  }) = _Delete;
  const factory InvoiceReceiveEvent.confirmFinance({
    required InvoiceReceive invoiceReceive,
  }) = _ConfirmFinance;
  const factory InvoiceReceiveEvent.approveHeadAccounting({
    required InvoiceReceive invoiceReceive,
  }) = _ApproveHeadAccounting;
  const factory InvoiceReceiveEvent.uploadDocument({
    required PlatformFile file,
    required InvoiceReceive invoiceReceive,
    required String name,
    required String description,
  }) = _UploadDocument;
  const factory InvoiceReceiveEvent.documentDelete({
    required InvoiceReceiveDocument document,
  }) = _DocumentDelete;
}

class InvoiceReceiveBloc
    extends Bloc<InvoiceReceiveEvent, InvoiceReceiveState> {
  InvoiceReceiveBloc() : super(const _Initial()) {
    on<InvoiceReceiveEvent>((event, emit) async {
      await event.when(
        create: (
          invoiceNo,
          purchaseOrder,
          supplier,
          rate,
          invoiceDate,
          deliveryOrderId,
          deliveryOrderDate,
          taxInvoiceNo,
          taxInvoiceDate,
          subtotal,
          ppn,
          taxType,
          total,
          termOfPayment,
          dueDate,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveCreate(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceNo: invoiceNo,
              purchaseOrder: purchaseOrder,
              supplier: supplier,
              rate: rate,
              invoiceDate: invoiceDate,
              deliveryOrderId: deliveryOrderId,
              deliveryOrderDate: deliveryOrderDate,
              taxInvoiceNo: taxInvoiceNo,
              taxInvoiceDate: taxInvoiceDate,
              subtotal: subtotal,
              ppn: ppn,
              taxType: taxType,
              total: total,
              termOfPayment: termOfPayment,
              dueDate: dueDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createWithDetail: (
          invoiceNo,
          purchaseOrder,
          supplier,
          rate,
          invoiceDate,
          deliveryOrderId,
          deliveryOrderDate,
          taxInvoiceNo,
          taxInvoiceDate,
          subtotal,
          ppn,
          taxType,
          total,
          termOfPayment,
          dueDate,
          details,
        ) async {
          emit(const _Loading());
          try {
            final invoiceReceive =
                await PurchasingRepository.instance.invoiceReceiveCreate(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceNo: invoiceNo,
              purchaseOrder: purchaseOrder,
              supplier: supplier,
              rate: rate,
              invoiceDate: invoiceDate,
              deliveryOrderId: deliveryOrderId,
              deliveryOrderDate: deliveryOrderDate,
              taxInvoiceNo: taxInvoiceNo,
              taxInvoiceDate: taxInvoiceDate,
              subtotal: subtotal,
              ppn: ppn,
              taxType: taxType,
              total: total,
              termOfPayment: termOfPayment,
              dueDate: dueDate,
            );

            for (var detail in details) {
              await PurchasingRepository.instance.invoiceReceiveDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                invoiceReceive: invoiceReceive,
                unitId: detail.unitId,
                materialId: detail.materialId,
                productId: detail.productId,
                qtyInvoice: detail.quantity.toDouble(),
                price: detail.price,
                total: detail.total,
              );
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          invoiceReceive,
          subtotal,
          ppn,
          taxType,
          total,
          termOfPayment,
          dueDate,
        ) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveEdit(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
              subtotal: subtotal,
              ppn: ppn,
              taxType: taxType,
              total: total,
              termOfPayment: termOfPayment,
              dueDate: dueDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirmFinance: (invoiceReceive) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveConfirmFinance(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveHeadAccounting: (invoiceReceive) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance
                .invoiceReceiveApproveHeadAccounting(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (invoiceReceive) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveDelete(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        uploadDocument: (file, invoiceReceive, name, description) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveUploadDocument(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceive: invoiceReceive,
              file: file,
              description: description,
              name: name,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        documentDelete: (document) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.invoiceReceiveDocumentDelete(
              accessToken: UserRepositoryApp.instance.token!,
              invoiceReceiveDocument: document,
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
