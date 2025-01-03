import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_query_bloc.freezed.dart';

@freezed
class ProductReturnNoteQueryState with _$ProductReturnNoteQueryState {
  const factory ProductReturnNoteQueryState.initial() = _Initial;
  const factory ProductReturnNoteQueryState.loading(
    PageOptions<ProductReturnNote> pageOptions,
  ) = _Loading;
  const factory ProductReturnNoteQueryState.loaded(
    PageOptions<ProductReturnNote> pageOptions,
  ) = _Loaded;
  const factory ProductReturnNoteQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnNoteQueryEvent with _$ProductReturnNoteQueryEvent {
  const factory ProductReturnNoteQueryEvent.fetch({
    PageOptions<ProductReturnNote>? pageOptions,
  }) = _Fetch;
  const factory ProductReturnNoteQueryEvent.fetchById(String id) = _FetchById;
}

class ProductReturnNoteQueryBloc
    extends Bloc<ProductReturnNoteQueryEvent, ProductReturnNoteQueryState> {
  ProductReturnNoteQueryBloc() : super(const _Initial()) {
    on<ProductReturnNoteQueryEvent>((event, emit) async {
      await event.when(
        fetchById: (id) async {
          emit(_Loading(_pageOptions));
          try {
            final productNote =
                await ProductRepository.instance.productReturnNoteFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(_Loaded(PageOptions.empty(data: [productNote])));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await ProductRepository.instance.productReturnNoteFetch(
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
  PageOptions<ProductReturnNote> _pageOptions = PageOptions.empty();
}
