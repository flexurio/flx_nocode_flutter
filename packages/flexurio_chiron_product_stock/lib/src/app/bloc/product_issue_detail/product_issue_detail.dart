import 'package:flexurio_chiron_product_stock/src/app/model/product_issue.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/product_issue_detail.dart';
import 'package:appointment/src/app/resource/product_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_issue_detail.freezed.dart';

@freezed
class ProductIssueDetailQueryState with _$ProductIssueDetailQueryState {
  const factory ProductIssueDetailQueryState.initial() = _Initial;
  const factory ProductIssueDetailQueryState.loading() = _Loading;
  const factory ProductIssueDetailQueryState.loaded(
    List<ProductIssueDetail> productIssueDetail,
  ) = _Success;
  const factory ProductIssueDetailQueryState.error(String error) = _Error;
}

@freezed
class ProductIssueDetailQueryEvent with _$ProductIssueDetailQueryEvent {
  const factory ProductIssueDetailQueryEvent.fetch(ProductIssue id) = _Fetch;
}

class ProductIssueDetailQueryBloc
    extends Bloc<ProductIssueDetailQueryEvent, ProductIssueDetailQueryState> {
  ProductIssueDetailQueryBloc() : super(const _Initial()) {
    on<ProductIssueDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (id) async {
            emit(const _Loading());
            try {
              final scheduleDetail =
                  await ProductRepository.instance.productIssueDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                productIssue: id,
              );
              emit(
                _Success(scheduleDetail),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
