import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_query_bloc.freezed.dart';

@freezed
class ProductIssueQueryState with _$ProductIssueQueryState {
  const factory ProductIssueQueryState.initial() = _Initial;
  const factory ProductIssueQueryState.loading(
    PageOptions<ProductIssue> pageOptions,
  ) = _Loading;
  const factory ProductIssueQueryState.loaded(
    PageOptions<ProductIssue> pageOptions,
  ) = _Loaded;
  const factory ProductIssueQueryState.error(String error) = _Error;
}

@freezed
class ProductIssueQueryEvent with _$ProductIssueQueryEvent {
  const factory ProductIssueQueryEvent.initialize() = _Initialize;
  const factory ProductIssueQueryEvent.fetch({
    PageOptions<ProductIssue>? pageOptions,
    String? productReturnId,
    String? remark,
  }) = _Fetch;
}

class ProductIssueQueryBloc
    extends Bloc<ProductIssueQueryEvent, ProductIssueQueryState> {
  ProductIssueQueryBloc() : super(const _Initial()) {
    on<ProductIssueQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const ProductIssueQueryEvent.fetch());
          } else {
            _pageOptions = await ProductRepository.instance.productIssueFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Loaded(_pageOptions));
          }
        },
        fetch: (pageOptions, productReturnId, remark) async {
          emit(_Loading(_pageOptions));
          if (pageOptions != null) {
            _pageOptions = pageOptions;
          }
          try {
            _pageOptions = await ProductRepository.instance.productIssueFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              productReturnID: productReturnId,
              remark: remark,
            );
            emit(
              _Loaded(_pageOptions),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<ProductIssue> _pageOptions = PageOptions.empty();
}
