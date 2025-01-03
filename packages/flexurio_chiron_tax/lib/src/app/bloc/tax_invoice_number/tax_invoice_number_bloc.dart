import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tax_invoice_number_bloc.freezed.dart';

@freezed
class TaxInvoiceNumberState with _$TaxInvoiceNumberState {
  factory TaxInvoiceNumberState.initial() = _Initial;
  factory TaxInvoiceNumberState.loading() = _Loading;
  factory TaxInvoiceNumberState.success() = _Success;
  factory TaxInvoiceNumberState.error({required String error}) = _Error;
}

@freezed
class TaxInvoiceNumberEvent with _$TaxInvoiceNumberEvent {
  const factory TaxInvoiceNumberEvent.create({
    required String year,
    required int minValue,
    required int maxValue,
    required String prefix,
    bool? isActive,
  }) = _Create;
  const factory TaxInvoiceNumberEvent.delete({
    required int id,
  }) = _Delete;
}

class TaxInvoiceNumberBloc
    extends Bloc<TaxInvoiceNumberEvent, TaxInvoiceNumberState> {
  TaxInvoiceNumberBloc() : super(_Initial()) {
    on<TaxInvoiceNumberEvent>(
      (event, emit) async {
        await event.when(
          create: (year, minValue, maxValue, prefix, isActive) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.taxInvoiceNumberCreate(
                year: year,
                minValue: minValue,
                maxValue: maxValue,
                isActive: isActive!,
                prefix: prefix,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
          delete: (id) async {
            emit(_Loading());
            try {
              await AccountingRepository.instance.taxInvoiceNumberDelete(
                id: id,
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
