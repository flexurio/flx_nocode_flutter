import 'package:flexurio_chiron_sales_order/src/app/model/sales_order.dart';
import 'package:flexurio_chiron_sales_order/src/app/resource/sales_order.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_print_invoice_bloc.freezed.dart';

@freezed
abstract class SalesOrderPrintInvoiceState with _$SalesOrderPrintInvoiceState {
  const factory SalesOrderPrintInvoiceState.initial({
    SalesOrderHeaderInitial? salesOrderHeaderInitial,
  }) = _Initial;
  const factory SalesOrderPrintInvoiceState.loading() = _Loading;
  const factory SalesOrderPrintInvoiceState.success(String taxInvoiceNumber) =
      _Success;
  const factory SalesOrderPrintInvoiceState.error(String error) = _Error;
}

@freezed
abstract class SalesOrderPrintInvoiceEvent with _$SalesOrderPrintInvoiceEvent {
  const factory SalesOrderPrintInvoiceEvent.printInvoice(
    SalesOrder salesOrder,
  ) = _PrintInvoice;
}

class SalesOrderPrintInvoiceBloc
    extends Bloc<SalesOrderPrintInvoiceEvent, SalesOrderPrintInvoiceState> {
  SalesOrderPrintInvoiceBloc() : super(const _Initial()) {
    on<SalesOrderPrintInvoiceEvent>((event, emit) async {
      await event.when(
        printInvoice: (salesOrder) async {
          emit(const _Loading());
          try {
            final taxInvoiceNumber =
                await SalesOrderRepository.instance.salesOrderPrintInvoice(
              accessToken: UserRepositoryApp.instance.token!,
              salesOrder: salesOrder,
            );
            await Future.delayed(const Duration(seconds: 2));
            emit(_Success(taxInvoiceNumber));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
