import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_note_detail.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_return_note_detail_query_bloc.freezed.dart';

@freezed
class ProductReturnNoteDetailQueryState
    with _$ProductReturnNoteDetailQueryState {
  const factory ProductReturnNoteDetailQueryState.initial() = _Initial;
  const factory ProductReturnNoteDetailQueryState.loading(
    PageOptions<ProductReturnNoteDetail> pageOptions,
  ) = _Loading;
  const factory ProductReturnNoteDetailQueryState.loaded(
    PageOptions<ProductReturnNoteDetail> pageOptions,
  ) = _Loaded;
  const factory ProductReturnNoteDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductReturnNoteDetailQueryEvent
    with _$ProductReturnNoteDetailQueryEvent {
  const factory ProductReturnNoteDetailQueryEvent.fetch({
    PageOptions<ProductReturnNoteDetail>? pageOptions,
    String? productReturnNoteId,
  }) = _Fetch;
}

class ProductReturnNoteDetailQueryBloc extends Bloc<
    ProductReturnNoteDetailQueryEvent, ProductReturnNoteDetailQueryState> {
  ProductReturnNoteDetailQueryBloc() : super(const _Initial()) {
    on<ProductReturnNoteDetailQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions, productReturnNoteId) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            final products =
                await ProductRepository.instance.productReturnNoteDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              productReturnNoteId: productReturnNoteId,
            );
            emit(_Loaded(products));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductReturnNoteDetail> _pageOptions = PageOptions.empty();
}
