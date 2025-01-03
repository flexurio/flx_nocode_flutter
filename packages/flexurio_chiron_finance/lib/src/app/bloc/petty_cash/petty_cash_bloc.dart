import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_business_trip/flexurio_chiron_business_trip.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/payment.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax.dart';
import 'package:appointment/src/app/resource/purchasing_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail_create.dart';
import 'package:flexurio_chiron_finance/src/app/resource/petty_cash.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/src/app/model/supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/payment.dart';

part 'petty_cash_bloc.freezed.dart';

@freezed
class PettyCashState with _$PettyCashState {
  const factory PettyCashState.initial({
    PurchaseOrder? purchaseOrder,
    VehicleRent? vehicleRent,
    List<PurchaseOrderDetail>? details,
    PettyCashType? pettyCashType,
  }) = _Initial;
  const factory PettyCashState.loading() = _Loading;
  const factory PettyCashState.success() = _Success;
  const factory PettyCashState.error(String error) = _Error;
}

@freezed
class PettyCashEvent with _$PettyCashEvent {
  const factory PettyCashEvent.initialize(
    PettyCash pettyCash,
  ) = _Initialize;

  const factory PettyCashEvent.createStep1FormType(
    MaterialRequest? materialRequest,
    PurchaseOrder? purchaseOrder,
    VehicleRent? vehicleRent,
    PettyCashType pettyCashType,
  ) = _CreateStep1FormMaterialRequest;
  const factory PettyCashEvent.createStep2FormDetails(
    List<PurchaseOrderDetail> details,
    double vehicleRentAmount,
  ) = _CreateStep2FormDetails;

  const factory PettyCashEvent.submit() = _Submit;
  const factory PettyCashEvent.submitVehicleRent() = _SubmitVehicleRent;

  const factory PettyCashEvent.realization({
    required PettyCash pettyCash,
    required List<PettyCashDetail> details,
    required Ppn ppn,
    required Supplier supplier,
    required double pphAmount,
    required double discountAmount,
    required double shippingCost,
    required String recipient,
    required double rounding,
    required String? description,
  }) = _Realization;
  const factory PettyCashEvent.close({
    required PettyCash pettyCash,
    required Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
    required Map<PettyCashDetail, BudgetType> budgetTypes,
    required Map<PettyCashDetail, TextEditingController> descriptions,
    required Map<String, TextEditingController> headerDescriptions,
    required Map<String, ChartOfAccountNumber> headerChartOfAccounts,
    required Map<String, BudgetType?> headerBudgetType,
    required Map<String, double> headerAmount,
  }) = _Close;
  const factory PettyCashEvent.approveManager(
    PettyCash pettyCash,
    String recipient,
  ) = _ApproveManager;
  const factory PettyCashEvent.rejectManager(
    PettyCash pettyCash,
    String reason,
  ) = _RejectManager;
  const factory PettyCashEvent.approveAccounting(PettyCash pettyCash) =
      _ApproveAccounting;
  const factory PettyCashEvent.rejectAccounting(
    PettyCash pettyCash,
    String reason,
  ) = _RejectAccounting;
  const factory PettyCashEvent.approveFinance(PettyCash pettyCash) =
      _ApproveFinance;
  const factory PettyCashEvent.rejectFinance(
    PettyCash pettyCash,
    String reason,
  ) = _RejectFinance;
  const factory PettyCashEvent.documentReceive(
    PettyCash pettyCash,
  ) = _DocumentReceive;
}

class PettyCashBloc extends Bloc<PettyCashEvent, PettyCashState> {
  PettyCashBloc() : super(const _Initial()) {
    on<PettyCashEvent>((event, emit) async {
      await event.when(
        initialize: (pettyCash) async {
          emit(const _Loading());
          try {
            final pettyCashDetail = await PettyCashRepository.instance
                .pettyCashDetailFetchByPettyCashId(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCashId: pettyCash.id,
            );
            _purchaseOrderDetails = pettyCashDetail
                .map(
                  (e) => PurchaseOrderDetail.empty().copyWith(
                    material: e.material,
                    quantity: e.quantity,
                    price: e.realizationPrice,
                    unit: e.unit,
                    descriptionPettyCash: e.pettyCash.description,
                  ),
                )
                .toList();
            _type = pettyCash.type;
            _purchaseOrder = pettyCash.purchaseOrder;
            emit(
              _Initial(
                purchaseOrder: _purchaseOrder,
                details: _purchaseOrderDetails,
                pettyCashType: _type,
                vehicleRent: _vehicleRent,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createStep1FormType: (
          materialRequest,
          purchaseOrder,
          vehicleRent,
          type,
        ) async {
          emit(const _Loading());
          if (type == PettyCashType.pettyCash) {
            _purchaseOrder = PurchaseOrder.empty().copyWith(
              materialRequest: materialRequest!,
            );
          } else if (type == PettyCashType.generalExpense) {
            _purchaseOrder = purchaseOrder;
            if (materialRequest != null) {
              final purchaseOrders =
                  await PurchasingRepository.instance.purchaseOrderFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: PageOptions.emptyNoLimit(),
                materialRequest: materialRequest,
              );
              _purchaseOrder = purchaseOrders.data.isNotEmpty
                  ? purchaseOrders.data.first
                  : null;
            }
          } else if (type == PettyCashType.vehicleRent) {
            _vehicleRent = vehicleRent;
          }
          _type = type;
          emit(
            _Initial(
              purchaseOrder: _purchaseOrder,
              pettyCashType: _type,
              vehicleRent: _vehicleRent,
            ),
          );
        },
        createStep2FormDetails: (details, vehicleRentAmount) async {
          _purchaseOrderDetails = details;
          if (_type!.isVehicleRent) {
            _vehicleRent = _vehicleRent!.copyWith(totalCost: vehicleRentAmount);
          }

          emit(
            _Initial(
              purchaseOrder: _purchaseOrder,
              details: List<PurchaseOrderDetail>.from(
                _purchaseOrderDetails ?? [],
              ),
              pettyCashType: _type,
              vehicleRent: _vehicleRent,
            ),
          );
        },
        submitVehicleRent: () async {
          emit(const _Loading());
          try {
            if (_vehicleRent == null) {
              emit(_Error(ErrorMessage.fieldNotFound('business_trip'.tr())));
              return;
            }

            final pettyCash =
                await PettyCashRepository.instance.pettyCashCreate(
              accessToken: UserRepositoryApp.instance.token!,
              amount: _vehicleRent!.totalCost,
              vehicleRentId: _vehicleRent!.id,
              description: _vehicleRent!.description,
              type: PettyCashType.pettyCash,
            );

            final vehicleRentMaterials = <String, String>{
              'VHC044': 'RP',
              'VHC043': 'RP',
              'VHC042': 'RP',
              'VHC103': 'RP',
              'VHC025': 'RP',
              'VHC104': 'RP',
            };

            await PettyCashRepository.instance.pettyCashDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCashId: pettyCash.id,
              data: vehicleRentMaterials.entries
                  .map(
                    (e) => PettyCashDetailCreate(
                      materialId: e.key,
                      materialUnitId: e.value,
                      price: 0,
                      quantity: 0,
                    ),
                  )
                  .toList(),
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        submit: () async {
          emit(const _Loading());
          try {
            var pettyCashAmount = _purchaseOrderDetails!
                .fold<double>(0, (sum, order) => sum + order.subtotal);

            if (_purchaseOrder == null) {
              emit(_Error(ErrorMessage.fieldNotFound('purchase_order'.tr())));
              return;
            }

            var purchaseOrder = _purchaseOrder!;
            if (_type!.isPettyCash) {
              purchaseOrder =
                  await PurchasingRepository.instance.purchaseOrderCreate(
                accessToken: UserRepositoryApp.instance.token!,
                materialRequest: _purchaseOrder!.materialRequest,
                currency: Currency.idr(),
                quotationNo: '',
                discountPercent: 0,
                taxType: TaxType.taxNone,
                ppn: Ppn.none,
                downPaymentPercent: 0,
                termOfPayment: 0,
                description: '',
                paymentType: PurchaseOrderPaymentType.pettyCash,
                deliveryDate: _purchaseOrder!.materialRequest.deliveryDate,
                department: _purchaseOrder!.materialRequest.departmentBudgeting,
              );
            }

            if (purchaseOrder.dpValue > 0) {
              pettyCashAmount = purchaseOrder.dpValue;
            }

            final pettyCash =
                await PettyCashRepository.instance.pettyCashCreate(
              accessToken: UserRepositoryApp.instance.token!,
              amount: pettyCashAmount,
              purchaseOrderId: purchaseOrder.id,
              type: _type!,
            );

            for (final detail in _purchaseOrderDetails!) {
              if (_type == PettyCashType.pettyCash) {
                await PurchasingRepository.instance.purchaseOrderDetailCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  purchaseOrder: purchaseOrder,
                  batchNo: detail.materialRequestDetail!.batchNo,
                  purchaseRequestDetailId: detail.materialRequestDetail!.id,
                  purchaseOrderQuantity: detail.quantity,
                  price: detail.price,
                  materialId: detail.material?.id,
                  productId: detail.product?.id,
                );
              }
            }

            await PettyCashRepository.instance.pettyCashDetailCreate(
              accessToken: UserRepositoryApp.instance.token!,
              data: _purchaseOrderDetails!
                  .map(
                    (e) => PettyCashDetailCreate(
                      materialId: e.material!.id,
                      materialUnitId: e.unit.id,
                      price: e.price,
                      quantity: e.quantity,
                    ),
                  )
                  .toList(),
              pettyCashId: pettyCash.id,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        realization: (
          pettyCash,
          details,
          ppn,
          supplier,
          pphAmount,
          discountAmount,
          shippingCost,
          recipient,
          rounding,
          description,
        ) async {
          emit(const _Loading());
          try {
            for (final detail in details) {
              await PettyCashRepository.instance.pettyCashDetailRealization(
                accessToken: UserRepositoryApp.instance.token!,
                pettyCashDetail: detail,
              );
            }

            await PettyCashRepository.instance.pettyCashRealization(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCashId: pettyCash.id,
              ppn: ppn.id,
              supplierId: supplier.id,
              subtotal: details.fold<double>(
                0,
                (sum, order) => sum + order.realizationPrice,
              ),
              rounding: rounding,
              pphAmount: pphAmount,
              discountAmount: discountAmount,
              shippingCost: shippingCost,
              recipient: recipient,
              description: description,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        close: (
          pettyCash,
          chartOfAccounts,
          budgetTypes,
          descriptions,
          headerDescription,
          headerChartOfAccounts,
          headerBudgetType,
          headerAmount,
        ) async {
          emit(const _Loading());
          try {
            if (pettyCash.realizationNo == null) {
              emit(_Error(ErrorMessage.fieldNotFound('realization_no')));
              return;
            }

            final amount = chartOfAccounts.keys
                .fold<double>(0, (sum, order) => sum + order.realizationPrice);

            final purchaseOrder = pettyCash.purchaseOrder;

            final payment = await PaymentRepository.instance.paymentCreate(
              accessToken: UserRepositoryApp.instance.token!,
              type: PaymentType.cash,
              dateTime: DateTime.now(),
              id: pettyCash.realizationNo!,
              amount: amount,
              description: purchaseOrder.description,
              kuCost: 0,
              stampCost: 0,
              roundingCost: 0,
              artCost: 0,
              otherCost: 0,
              accountName: '',
              accountNumber: '',
              rateGap: 0,
              rate: 1,
              chartOfAccountRepaymentId: '',
              departmentId: '',
              partnerId: '',
            );

            final materialNames = <String>[];
            for (final detail in chartOfAccounts.keys.toList()) {
              final materialName = detail.material.name;
              materialNames.add(materialName);
              await PaymentRepository.instance
                  .paymentDetailCreateWithChartOfAccount(
                accessToken: UserRepositoryApp.instance.token!,
                description: pettyCash.isGeneralExpense
                    ? descriptions[detail]!.text
                    : 'PEMBIAYAAN ATAS: $materialName',
                payment: payment,
                chartOfAccount: chartOfAccounts[detail]!,
                budgetType: budgetTypes.containsKey(detail)
                    ? budgetTypes[detail]!
                    : null,
                amount: detail.subtotal,
                department: purchaseOrder.department,
                orderId: purchaseOrder.id,
              );
            }

            for (final detail in headerChartOfAccounts.keys.toList()) {
              if (headerAmount[detail] == 0) {
                continue;
              }

              await PaymentRepository.instance
                  .paymentDetailCreateWithChartOfAccount(
                accessToken: UserRepositoryApp.instance.token!,
                description: pettyCash.isGeneralExpense
                    ? headerDescription[detail]!.text
                    : 'PEMBIAYAAN ATAS: $detail ${materialNames.join(', ')}',
                payment: payment,
                chartOfAccount: headerChartOfAccounts[detail]!,
                budgetType: headerBudgetType[detail],
                amount: headerAmount[detail]!,
                department: purchaseOrder.department,
                orderId: purchaseOrder.id,
              );
            }

            await PettyCashRepository.instance.pettyCashClose(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCash: pettyCash,
            );

            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveManager: (pettyCash, recipient) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashApproveManager(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCash: pettyCash,
              recipient: recipient,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectManager: (pettyCash, reason) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashRejectManager(
              accessToken: UserRepositoryApp.instance.token!,
              reason: reason,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveAccounting: (pettyCash) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashApproveAccounting(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectAccounting: (pettyCash, reason) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashRejectAccounting(
              accessToken: UserRepositoryApp.instance.token!,
              reason: reason,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        approveFinance: (pettyCash) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashApproveFinance(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        rejectFinance: (pettyCash, reason) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashRejectFinance(
              accessToken: UserRepositoryApp.instance.token!,
              reason: reason,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        documentReceive: (pettyCash) async {
          emit(const _Loading());
          try {
            await PettyCashRepository.instance.pettyCashDocumentReceive(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCash: pettyCash,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PurchaseOrder? _purchaseOrder;
  VehicleRent? _vehicleRent;
  PettyCashType? _type;
  List<PurchaseOrderDetail>? _purchaseOrderDetails;
}
