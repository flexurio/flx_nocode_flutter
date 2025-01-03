import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_query_bloc.freezed.dart';

@freezed
class MaterialIssueQueryState with _$MaterialIssueQueryState {
  const factory MaterialIssueQueryState.initial() = _Initial;
  const factory MaterialIssueQueryState.loading(
    PageOptions<MaterialIssue> pageOptions,
  ) = _Loading;
  const factory MaterialIssueQueryState.loaded(
    PageOptions<MaterialIssue> pageOptions,
  ) = _Loaded;
  const factory MaterialIssueQueryState.error(String error) = _Error;
}

@freezed
class MaterialIssueQueryEvent with _$MaterialIssueQueryEvent {
  const factory MaterialIssueQueryEvent.fetch({
    PageOptions<MaterialIssue>? pageOptions,
    String? transactionCode,
    Product? product,
    bool? isProduct,
    MaterialGroup? materialGroup,
    DateTime? startDate,
    DateTime? endDate,
  }) = _Fetch;
}

class MaterialIssueQueryBloc
    extends Bloc<MaterialIssueQueryEvent, MaterialIssueQueryState> {
  final bool isExternal;
  MaterialIssueQueryBloc({required this.isExternal}) : super(const _Initial()) {
    on<MaterialIssueQueryEvent>((event, emit) async {
      await event.when(
        fetch: (
          pageOptions,
          transactionCode,
          product,
          isProduct,
          materialGroup,
          startDate,
          endDate,
        ) async {
          emit(_Loading(_pageOptions));
          if (pageOptions != null) {
            _pageOptions = pageOptions;
          }
          try {
            _pageOptions =
                await MaterialIssueRepository.instance.materialIssueFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              transactionCode: transactionCode,
              product: product,
              isProduct: isProduct,
              materialGroup: materialGroup,
              startDate: startDate,
              endDate: endDate,
              isExternal: isExternal,
              departmentID: UserRepositoryApp.instance.department?.id,
            );
            emit(_Loaded(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<MaterialIssue> _pageOptions = PageOptions.empty();
}
