import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_bloc.freezed.dart';

@freezed
class ProductReturnState with _$ProductReturnState {
  const factory ProductReturnState.initial({
    required List<ProductReturnDetail> products,
    ProductReturnCustomerForm? customerForm,
  }) = _Initial;
  const factory ProductReturnState.loading() = _Loading;
  const factory ProductReturnState.success() = _Success;
  const factory ProductReturnState.error(String error) = _Error;
}

@freezed
class ProductReturnEvent with _$ProductReturnEvent {
  const factory ProductReturnEvent.createFormCustomer({
    required ProductReturnCustomerForm customerForm,
  }) = _Create;
  const factory ProductReturnEvent.editFormCustomer({
    required String productReturnId,
    required Currency currency,
    required Customer customer,
    required Department department,
    required TransactionType transactionType,
    required String description,
    required double subtotal,
    required double discountPercent,
    required double discountValue,
    required double ppnPercent,
    required double ppnValue,
    required double accountValue,
    required String referenceNo,
  }) = _Edit;
  const factory ProductReturnEvent.productAdd({
    required ProductReturnDetail products,
  }) = _ProductAdd;
  const factory ProductReturnEvent.remove({
    required ProductReturnDetail products,
  }) = _Remove;
  const factory ProductReturnEvent.confirmMarketing({
    required ProductReturn productReturn,
  }) = _ConfirmMarketing;
  const factory ProductReturnEvent.confirmPpic({
    required ProductReturn productReturn,
  }) = _ConfirmPpic;
  const factory ProductReturnEvent.undoConfirmMarketing({
    required ProductReturn productReturn,
  }) = _UndoConfirmMarketing;
  const factory ProductReturnEvent.undoConfirmPpic({
    required ProductReturn productReturn,
  }) = _UndoConfirmPpic;
  const factory ProductReturnEvent.delete({
    required ProductReturn productReturn,
  }) = _Delete;
  const factory ProductReturnEvent.submit({
    required double discountValue,
    required double ppnValue,
  }) = _Submit;
  const factory ProductReturnEvent.initialize(
    ProductReturn productReturn,
  ) = _Initialize;
}

class ProductReturnBloc extends Bloc<ProductReturnEvent, ProductReturnState> {
  ProductReturnBloc() : super(const _Initial(products: [])) {
    on<ProductReturnEvent>((event, emit) async {
      await event.when(
        initialize: (products) async {
          emit(const _Loading());
          try {
            _customerForm = ProductReturnCustomerForm(
              department: products.department,
              customer: products.customer,
              transactionType: products.transactionType,
              currency: products.currency,
              subtotal: products.subtotal,
              referenceNumber: products.referenceNo,
              ppnPercent: products.ppnPercent,
              discountPercent: products.discountPercent,
              total: products.total,
            );
            final details =
                await ProductRepository.instance.productReturnDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnId: products.id,
              pageOptions: PageOptions.emptyNoLimit(),
            );
            _products.addAll(details.data);
            emit(
              _Initial(
                customerForm: _customerForm,
                products: _products,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        createFormCustomer: (customerForm) async {
          _customerForm = customerForm;
          emit(
            _Initial(
              products: _products,
              customerForm: _customerForm,
            ),
          );
        },
        editFormCustomer: (
          productReturnId,
          currency,
          customer,
          department,
          transactionType,
          description,
          subtotal,
          discountPercent,
          discountValue,
          ppnPercent,
          ppnValue,
          accountValue,
          referenceNo,
        ) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnEdit(
              accessToken: UserRepositoryApp.instance.token!,
              productReturnId: productReturnId,
              currency: currency,
              customer: customer,
              department: department,
              transactionType: transactionType,
              description: description,
              subtotal: subtotal,
              discountPercent: discountPercent,
              discountValue: discountValue,
              ppnPercent: ppnPercent,
              ppnValue: ppnValue,
              accountValue: accountValue,
              referenceNo: referenceNo,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        productAdd: (products) {
          var productReturnDetail = products;

          final newState = List<ProductReturnDetail>.from(_products);

          final indexExists = newState.indexWhere(
            (element) =>
                '${element.batchNo}${element.deliveryOrderId}${element.product.id}' ==
                '${productReturnDetail.batchNo}${productReturnDetail.deliveryOrderId}${productReturnDetail.product.id}',
          );

          if (indexExists > -1) {
            newState.removeAt(indexExists);
          }

          newState.add(productReturnDetail);
          _products = newState;
          emit(
            _Initial(
              products: _products,
              customerForm: _customerForm,
            ),
          );
        },
        remove: (product) {
          final newState = List<ProductReturnDetail>.from(_products)
            ..removeWhere((element) => element == product);
          _products = newState;
          emit(
            _Initial(
              products: _products,
              customerForm: _customerForm,
            ),
          );
        },
        undoConfirmMarketing: (productReturn) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnUndoConfirmMarketing(
              productReturn: productReturn,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        undoConfirmPpic: (productReturn) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnUndoConfirmPpic(
              productReturn: productReturn,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirmMarketing: (productReturn) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnConfirmMarketing(
              productReturn: productReturn,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        confirmPpic: (productReturn) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnConfirmPpic(
              productReturn: productReturn,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (productReturn) async {
          emit(const _Loading());
          try {
            await ProductRepository.instance.productReturnDelete(
              accessToken: UserRepositoryApp.instance.token!,
              productReturn: productReturn,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        submit: (discountValue, ppnValue) async {
          emit(const _Loading());
          try {
            final totalAmountReal = _products.fold<double>(
              0,
              (total, product) => total + product.totalProductPrice,
            );
            final productReturn =
                await ProductRepository.instance.productReturnCreate(
              accessToken: UserRepositoryApp.instance.token!,
              currency: _customerForm!.currency!,
              customer: _customerForm!.customer!,
              department: _customerForm!.department!,
              transactionType: _customerForm!.transactionType!,
              referenceNo: _customerForm!.referenceNumber!,
              description: '-',
              subtotal: totalAmountReal,
              discountPercent: _customerForm!.discountPercent!,
              discountValue: discountValue,
              ppnPercent: _customerForm!.ppnPercent!.id,
              ppnValue: ppnValue,
              accountValue: 0,
            );

            for (final product in _products) {
              await ProductRepository.instance.productReturnDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                productReturn: productReturn,
                productReturnDetail: product,
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
  ProductReturnCustomerForm? _customerForm;
  late List<ProductReturnDetail> _products = [];
}
