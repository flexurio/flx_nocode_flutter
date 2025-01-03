import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/resource/invoice_recap_by_type.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_recap_by_type_bloc.freezed.dart';

@freezed
class InvoiceRecapByTypeState with _$InvoiceRecapByTypeState {
  const factory InvoiceRecapByTypeState.initial() = _Initial;
  const factory InvoiceRecapByTypeState.loading() = _Loading;
  const factory InvoiceRecapByTypeState.success() = _Success;
  const factory InvoiceRecapByTypeState.error(String error) = _Error;
}

@freezed
class InvoiceRecapByTypeEvent with _$InvoiceRecapByTypeEvent {
  const factory InvoiceRecapByTypeEvent.reprocess() = _Reprocess;
}

class InvoiceRecapByTypeBloc
    extends Bloc<InvoiceRecapByTypeEvent, InvoiceRecapByTypeState> {
  InvoiceRecapByTypeBloc() : super(const _Initial()) {
    on<InvoiceRecapByTypeEvent>((event, emit) async {
      await event.when(
        reprocess: () async {
          emit(const _Loading());
          try {
            await InvoiceRecapByTypeRepository.instance.reprocess(
              accessToken: UserRepositoryApp.instance.token!,
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
