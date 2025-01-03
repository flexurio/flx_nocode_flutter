import 'package:flexurio_chiron_product_stock/src/app/model/product_issue_global.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_global_report_query_bloc.freezed.dart';

@freezed
class ProductIssueGlobalReportQueryState
    with _$ProductIssueGlobalReportQueryState {
  const factory ProductIssueGlobalReportQueryState.initial() = _Initial;
  const factory ProductIssueGlobalReportQueryState.loading() = _Loading;
  const factory ProductIssueGlobalReportQueryState.loaded(
    List<ProductIssueGlobal> productIssueGlobals,
  ) = _Loaded;
  const factory ProductIssueGlobalReportQueryState.error(String error) = _Error;
}

@freezed
class ProductIssueGlobalReportQueryEvent
    with _$ProductIssueGlobalReportQueryEvent {
  const factory ProductIssueGlobalReportQueryEvent.fetch() = _Fetch;
}

class ProductIssueGlobalReportQueryBloc extends Bloc<
    ProductIssueGlobalReportQueryEvent, ProductIssueGlobalReportQueryState> {
  ProductIssueGlobalReportQueryBloc() : super(const _Initial()) {
    on<ProductIssueGlobalReportQueryEvent>((event, emit) async {
      await event.when(
        fetch: () async {
          emit(_Loading());
          try {
            final productIssueGlobal =
                await ProductRepository.instance.productIssueGlobalReportFetch(
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(
              _Loaded(productIssueGlobal),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
