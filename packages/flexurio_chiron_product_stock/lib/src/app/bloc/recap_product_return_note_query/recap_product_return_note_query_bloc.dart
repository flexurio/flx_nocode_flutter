import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_return_note.dart';
import 'package:flexurio_chiron_product_stock/src/app/resource/recap_product_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recap_product_return_note_query_bloc.freezed.dart';

@freezed
class RecapProductReturnNoteQueryState with _$RecapProductReturnNoteQueryState {
  const factory RecapProductReturnNoteQueryState.initial() = _Initial;
  const factory RecapProductReturnNoteQueryState.loading(
    PageOptions<RecapProductReturnNote> pageOptions,
  ) = _Loading;
  const factory RecapProductReturnNoteQueryState.loaded(
    PageOptions<RecapProductReturnNote> pageOptions,
  ) = _Success;
  const factory RecapProductReturnNoteQueryState.error(String error) = _Error;
}

@freezed
class RecapProductReturnNoteQueryEvent with _$RecapProductReturnNoteQueryEvent {
  const factory RecapProductReturnNoteQueryEvent.fetch({
    required DateTime periodStart,
    required DateTime periodEnd,
    required Customer customer,
    PageOptions<RecapProductReturnNote>? pageOptions,
    ProductReturn? productReturn,
  }) = _Fetch;
}

class RecapProductReturnNoteQueryBloc extends Bloc<
    RecapProductReturnNoteQueryEvent, RecapProductReturnNoteQueryState> {
  RecapProductReturnNoteQueryBloc() : super(const _Initial()) {
    on<RecapProductReturnNoteQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          periodStart,
          periodEnd,
          customer,
          pageOptions,
          productReturn,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await RecapProductReturnNoteRepository.instance
                .recapProductReturnNoteFetch(
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
  PageOptions<RecapProductReturnNote> _pageOptions = PageOptions.empty(
    sortBy: 'PR.id',
  );
}
