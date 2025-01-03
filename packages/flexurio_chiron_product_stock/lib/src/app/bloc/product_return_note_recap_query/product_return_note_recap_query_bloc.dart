import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note_recap.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/product_return.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_recap_query_bloc.freezed.dart';

@freezed
class ProductReturnNoteRecapQueryState with _$ProductReturnNoteRecapQueryState {
  const factory ProductReturnNoteRecapQueryState.initial() = _Initial;
  const factory ProductReturnNoteRecapQueryState.loading(
    PageOptions<ProductReturnNoteRecap> pageOptions,
  ) = _Loading;
  const factory ProductReturnNoteRecapQueryState.loaded(
    PageOptions<ProductReturnNoteRecap> pageOptions,
  ) = _Success;
  const factory ProductReturnNoteRecapQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnNoteRecapQueryEvent with _$ProductReturnNoteRecapQueryEvent {
  const factory ProductReturnNoteRecapQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    PageOptions<ProductReturnNoteRecap>? pageOptions,
    ProductReturn? productReturn,
  }) = _Fetch;
}

class ProductReturnNoteRecapQueryBloc extends Bloc<
    ProductReturnNoteRecapQueryEvent, ProductReturnNoteRecapQueryState> {
  ProductReturnNoteRecapQueryBloc() : super(const _Initial()) {
    on<ProductReturnNoteRecapQueryEvent>((event, emit) async {
      await event.when(
        fetch: (periodStart, periodEnd, customer, pageOptions,
            productReturn) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await ProductReturnRepository.instance
                .productReturnNoteRecapFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              periodStart: periodStart,
              periodEnd: periodEnd,
              customer: customer,
              productReturn: productReturn,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnNoteRecap> _pageOptions = PageOptions.empty(
    sortBy: 'PR.id',
  );
}
