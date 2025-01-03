import 'package:flexurio_chiron_tax/src/app/model/tax_invoice_number.dart';
import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tax_invoice_number_query_bloc.freezed.dart';

@freezed
class TaxInvoiceNumberQueryState with _$TaxInvoiceNumberQueryState {
  factory TaxInvoiceNumberQueryState.initial() = _Initial;
  factory TaxInvoiceNumberQueryState.loading() = _Loading;
  factory TaxInvoiceNumberQueryState.loaded({
    required List<TaxInvoiceNumber> taxInvoiceNumbers,
  }) = _Success;
  factory TaxInvoiceNumberQueryState.error({required String error}) = _Error;
}

@freezed
class TaxInvoiceNumberQueryEvent with _$TaxInvoiceNumberQueryEvent {
  const factory TaxInvoiceNumberQueryEvent.fetch({
    List<DateTime>? year,
  }) = _Fetch;
}

class TaxInvoiceNumberQueryBloc
    extends Bloc<TaxInvoiceNumberQueryEvent, TaxInvoiceNumberQueryState> {
  TaxInvoiceNumberQueryBloc() : super(_Initial()) {
    on<TaxInvoiceNumberQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (year) async {
            emit(_Loading());
            try {
              final taxInvoiceNumbers =
                  await AccountingRepository.instance.taxInvoiceNumberFetch(
                accessToken: UserRepositoryApp.instance.token!,
                year: year,
              );
              emit(
                _Success(
                  taxInvoiceNumbers: taxInvoiceNumbers,
                ),
              );
            } catch (error) {
              emit(_Error(error: errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
