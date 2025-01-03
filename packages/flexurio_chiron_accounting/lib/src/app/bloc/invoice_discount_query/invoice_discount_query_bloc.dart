import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_accounting/src/app/model/invoice_discount.dart';
import 'package:flexurio_chiron_accounting/src/app/resource/invoice_discount.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_discount_query_bloc.freezed.dart';

@freezed
class InvoiceDiscountQueryState with _$InvoiceDiscountQueryState {
  const factory InvoiceDiscountQueryState.initial() = _Initial;
  const factory InvoiceDiscountQueryState.loading(
    PageOptions<InvoiceDiscount> pageOptions,
  ) = _Loading;
  const factory InvoiceDiscountQueryState.loaded(
    PageOptions<InvoiceDiscount> pageOptions,
  ) = _Loaded;
  const factory InvoiceDiscountQueryState.error(String error) = _Error;
}

@freezed
class InvoiceDiscountQueryEvent with _$InvoiceDiscountQueryEvent {
  const factory InvoiceDiscountQueryEvent.fetch({
    PageOptions<InvoiceDiscount>? pageOptions,
  }) = _Fetch;
}

class InvoiceDiscountQueryBloc
    extends Bloc<InvoiceDiscountQueryEvent, InvoiceDiscountQueryState> {
  InvoiceDiscountQueryBloc() : super(const _Initial()) {
    on<InvoiceDiscountQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await InvoiceDiscountRepository.instance.fetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<InvoiceDiscount> _pageOptions = PageOptions.empty(sortBy: 'date');
}
