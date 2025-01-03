import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_return_check.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_product_return_query_bloc.freezed.dart';

@freezed
class ReportProductReturnCheckQueryState
    with _$ReportProductReturnCheckQueryState {
  const factory ReportProductReturnCheckQueryState.initial() = _Initial;
  const factory ReportProductReturnCheckQueryState.loading() = _Loading;
  const factory ReportProductReturnCheckQueryState.loaded(
    List<ProductReturnCheck> productReturnChecks,
  ) = _Loaded;
  const factory ReportProductReturnCheckQueryState.error(String? error) =
      _Error;
}

@freezed
class ReportProductReturnCheckQueryEvent
    with _$ReportProductReturnCheckQueryEvent {
  const factory ReportProductReturnCheckQueryEvent.fetch(
      String productReturnId) = _Fetch;
}

class ReportProductReturnCheckQueryBloc extends Bloc<
    ReportProductReturnCheckQueryEvent, ReportProductReturnCheckQueryState> {
  ReportProductReturnCheckQueryBloc() : super(const _Initial()) {
    on<ReportProductReturnCheckQueryEvent>((event, emit) async {
      await event.when(
        fetch: (productReturnId) async {
          emit(const _Loading());
          try {
              final productDetails =
                  await ProductRepository.instance.productReturnDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                productReturnId: productReturnId,
                pageOptions: PageOptions.emptyNoLimit(),
              );
              var productChecks =
                  productDetails.data.map((e) => e.toProductReturnCheck()).toList();

            emit(_Loaded(productChecks));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
