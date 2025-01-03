import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_bloc.freezed.dart';

@freezed
class PurchaseOrderState with _$PurchaseOrderState {
  const factory PurchaseOrderState.initial({
    PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
    List<PurchaseOrderDetail>? materials,
    PurchaseOrderFormDiscount? purchaseOrderFormDiscount,
  }) = _Initial;
  const factory PurchaseOrderState.loading() = _Loading;
  const factory PurchaseOrderState.success() = _Success;
  const factory PurchaseOrderState.error(String error) = _Error;
}

@freezed
class PurchaseOrderEvent with _$PurchaseOrderEvent {
  const factory PurchaseOrderEvent.initialize(
    PurchaseOrder purchaseOrder,
  ) = _Initialize;
  const factory PurchaseOrderEvent.viewHistory(
    PurchaseOrderHistory purchaseOrderHistory,
  ) = _ViewHistory;
  const factory PurchaseOrderEvent.createFormSupplier(
    PurchaseOrderFormSupplier purchaseOrderFormSupplier,
  ) = _CreateFormSupplier;
  const factory PurchaseOrderEvent.editFormSupplier(
    PurchaseOrder purchaseOrder,
    PurchaseOrderFormSupplier purchaseOrderFormSupplier,
  ) = _EditFormSupplier;
  const factory PurchaseOrderEvent.createFormMaterial(
    List<PurchaseOrderDetail> materials,
  ) = _CreateFormMaterial;
  const factory PurchaseOrderEvent.createFormDiscount(
    PurchaseOrderFormDiscount purchaseOrderFormDiscount,
  ) = _CreateFormDiscount;
  const factory PurchaseOrderEvent.editFormDiscount(
    PurchaseOrder purchaseOrder,
    PurchaseOrderFormDiscount purchaseOrderFormDiscount,
  ) = _EditFormDiscount;
  const factory PurchaseOrderEvent.submit() = _Submit;
  const factory PurchaseOrderEvent.editDetails({
    required PurchaseOrder purchaseOrder,
    required List<PurchaseOrderDetail> details,
  }) = _EditDetails;
  const factory PurchaseOrderEvent.delete(PurchaseOrder purchaseOrder) =
      _Delete;
  const factory PurchaseOrderEvent.confirm(PurchaseOrder purchaseOrder) =
      _Confirm;
  const factory PurchaseOrderEvent.undoConfirm(PurchaseOrder purchaseOrder) =
      _UndoConfirm;

  // Accounting Events
  const factory PurchaseOrderEvent.accountingConfirm(
    PurchaseOrder purchaseOrder,
  ) = _AccountingConfirm;
  const factory PurchaseOrderEvent.accountingUndoConfirm(
    PurchaseOrder purchaseOrder,
  ) = _AccountingUndoConfirm;
  const factory PurchaseOrderEvent.accountingReject(
    PurchaseOrder purchaseOrder,
    String reason,
  ) = _AccountingReject;

  const factory PurchaseOrderEvent.close(
    PurchaseOrder purchaseOrder,
  ) = _Close;
  const factory PurchaseOrderEvent.uploadDocument({
    required PlatformFile file,
    required PurchaseOrder purchaseOrder,
    required String description,
  }) = _UploadDocument;
  const factory PurchaseOrderEvent.documentDelete({
    required PurchaseOrderDocument document,
  }) = _DocumentDelete;
}

class PurchaseOrderBloc extends Bloc<PurchaseOrderEvent, PurchaseOrderState> {
  PurchaseOrderBloc() : super(const _Initial()) {
    on<PurchaseOrderEvent>((event, emit) async {
      await event.when(
        initialize: (purchaseOrder) async {
          emit(const _Loading());
          try {
            _purchaseOrderFormSupplier = PurchaseOrderFormSupplier(
              materialRequest: purchaseOrder.materialRequest,
              supplier: purchaseOrder.supplier,
              currency: purchaseOrder.currency,
              quotationNo: purchaseOrder.quotationNo,
              deliveryDate: purchaseOrder.deliveryDate,
              revisionNo: purchaseOrder.revisionNo,
            );
            _purchaseOrderFormDiscount = PurchaseOrderFormDiscount(
              paymentType: purchaseOrder.paymentType,
              ppn: purchaseOrder.ppn,
              discountPercent: purchaseOrder.discountPercent,
              downPaymentPercent: purchaseOrder.dpPercent,
              termOfPayment: purchaseOrder.termOfPayment,
              taxType: purchaseOrder.taxType,
              description: purchaseOrder.description,
            );
            _materials =
                await PurchasingRepository.instance.purchaseOrderDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderId: purchaseOrder.id,
            );

            emit(
              _Initial(
                purchaseOrderFormSupplier: _purchaseOrderFormSupplier,
                materials: _materials,
                purchaseOrderFormDiscount: _purchaseOrderFormDiscount,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        viewHistory: (purchaseOrderHistory) async {
          emit(const _Loading());
          try {
            _purchaseOrderFormSupplier = PurchaseOrderFormSupplier(
              materialRequest: purchaseOrderHistory.materialRequest,
              supplier: purchaseOrderHistory.supplier,
              currency: purchaseOrderHistory.currency,
              quotationNo: purchaseOrderHistory.quotationNo,
              deliveryDate: purchaseOrderHistory.deliveryDate,
              revisionNo: purchaseOrderHistory.revisionNo,
            );
            _purchaseOrderFormDiscount = PurchaseOrderFormDiscount(
              paymentType: purchaseOrderHistory.paymentType,
              ppn: purchaseOrderHistory.ppn,
              discountPercent: purchaseOrderHistory.discountPercent,
              downPaymentPercent: purchaseOrderHistory.dpPercent,
              termOfPayment: purchaseOrderHistory.termOfPayment,
              taxType: purchaseOrderHistory.taxType,
              description: purchaseOrderHistory.description,
            );
            _materials = await PurchasingRepository.instance
                .purchaseOrderDetailHistoryFetch(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderHistory: purchaseOrderHistory,
            );

            emit(
              _Initial(
                purchaseOrderFormSupplier: _purchaseOrderFormSupplier,
                materials: _materials,
                purchaseOrderFormDiscount: _purchaseOrderFormDiscount,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        uploadDocument: (file, purchaseOrder, description) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderUploadDocument(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
              file: file,
              description: description,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        documentDelete: (document) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderDocumentDelete(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrderDocument: document,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createFormSupplier: (form) async {
          _purchaseOrderFormSupplier = form;
          emit(
            _Initial(
              purchaseOrderFormSupplier: _purchaseOrderFormSupplier,
              materials: _materials,
              purchaseOrderFormDiscount: _purchaseOrderFormDiscount,
            ),
          );
        },
        editFormSupplier: (purchaseOrder, form) async {
          emit(const _Loading());
          _purchaseOrderFormSupplier = form;
          try {
            await PurchasingRepository.instance.purchaseOrderEdit(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
              discountForm: _purchaseOrderFormDiscount!,
              supplierForm: _purchaseOrderFormSupplier!,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createFormMaterial: (materials) async {
          _materials = materials;
          emit(
            _Initial(
              purchaseOrderFormSupplier: _purchaseOrderFormSupplier,
              materials: _materials,
              purchaseOrderFormDiscount: _purchaseOrderFormDiscount,
            ),
          );
        },
        createFormDiscount: (form) async {
          _purchaseOrderFormDiscount = form;
          emit(
            _Initial(
              purchaseOrderFormSupplier: _purchaseOrderFormSupplier,
              materials: _materials,
              purchaseOrderFormDiscount: _purchaseOrderFormDiscount,
            ),
          );
        },
        editFormDiscount: (purchaseOrder, form) async {
          emit(const _Loading());
          _purchaseOrderFormDiscount = form;
          try {
            await PurchasingRepository.instance.purchaseOrderEdit(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
              discountForm: _purchaseOrderFormDiscount!,
              supplierForm: _purchaseOrderFormSupplier!,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        submit: () async {
          emit(const _Loading());
          try {
            final purchaseOrder =
                await PurchasingRepository.instance.purchaseOrderCreate(
              accessToken: UserRepositoryApp.instance.token!,
              department: UserRepositoryApp.instance.department!,
              materialRequest: _purchaseOrderFormSupplier!.materialRequest,
              supplier: _purchaseOrderFormSupplier!.supplier,
              currency: _purchaseOrderFormSupplier!.currency,
              deliveryDate: _purchaseOrderFormSupplier!.deliveryDate,
              quotationNo: _purchaseOrderFormSupplier!.quotationNo,
              discountPercent: _purchaseOrderFormDiscount!.discountPercent,
              taxType: _purchaseOrderFormDiscount!.taxType,
              ppn: _purchaseOrderFormDiscount!.ppn,
              downPaymentPercent:
                  _purchaseOrderFormDiscount!.downPaymentPercent,
              termOfPayment: _purchaseOrderFormDiscount!.termOfPayment,
              description: _purchaseOrderFormDiscount!.description,
              paymentType: _purchaseOrderFormDiscount!.paymentType,
            );

            for (final material in _materials!) {
              if (material.materialRequestDetail == null) {
                await PurchasingRepository.instance
                    .purchaseOrderDetailCreateNonMaterialRequest(
                  accessToken: UserRepositoryApp.instance.token!,
                  purchaseOrder: purchaseOrder,
                  purchaseOrderDetail: material,
                );
              } else {
                await PurchasingRepository.instance.purchaseOrderDetailCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  batchNo: material.materialRequestDetail?.batchNo,
                  purchaseOrder: purchaseOrder,
                  purchaseOrderQuantity: material.quantity,
                  price: material.price,
                  purchaseRequestDetailId: material.id,
                  materialId: material.material?.id,
                  productId: material.product?.id,
                );
              }
            }

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderDelete(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        close: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderConfirmClose(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirm: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        undoConfirm: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderUndoConfirm(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        accountingConfirm: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance.purchaseOrderConfirmAccounting(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        accountingUndoConfirm: (purchaseOrder) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance
                .purchaseOrderUndoConfirmAccounting(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        accountingReject: (purchaseOrder, reason) async {
          emit(const _Loading());
          try {
            await PurchasingRepository.instance
                .purchaseOrderUpdateStatusAccountingReject(
              accessToken: UserRepositoryApp.instance.token!,
              purchaseOrder: purchaseOrder,
              reason: reason,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        editDetails: (purchaseOrder, details) async {
          emit(const _Loading());
          try {
            for (final material in details) {
              await PurchasingRepository.instance.purchaseOrderDetailEdit(
                accessToken: UserRepositoryApp.instance.token!,
                purchaseOrderDetail: material,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PurchaseOrderFormSupplier? _purchaseOrderFormSupplier;
  List<PurchaseOrderDetail>? _materials;
  PurchaseOrderFormDiscount? _purchaseOrderFormDiscount;
}
