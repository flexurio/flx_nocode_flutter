import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/validate_invoice.dart';
import 'package:flexurio_chiron_finance/src/app/resource/validate_invoice.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_invoice_query_bloc.freezed.dart';

@freezed
class ValidateInvoiceQueryEvent with _$ValidateInvoiceQueryEvent {
  const factory ValidateInvoiceQueryEvent.fetch({
    required String url,
  }) = _Fetch;
}

@freezed
class ValidateInvoiceQueryState with _$ValidateInvoiceQueryState {
  const factory ValidateInvoiceQueryState.error(String error) = _Error;
  const factory ValidateInvoiceQueryState.initial() = _Initial;
  const factory ValidateInvoiceQueryState.loading() = _Loading;
  const factory ValidateInvoiceQueryState.loaded(
    ResValidateInvoicePm validateInvoice,
  ) = _Success;
}

class ValidateInvoiceQueryBloc
    extends Bloc<ValidateInvoiceQueryEvent, ValidateInvoiceQueryState> {
  ValidateInvoiceQueryBloc() : super(const _Initial()) {
    on<ValidateInvoiceQueryEvent>((event, emit) async {
      await event.when(
        fetch: (url) async {
          emit(_Loading());
          try {
            final validateInvoice =
                await ValidateInvoiceRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              url: url,
            );
            emit(_Success(validateInvoice));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
