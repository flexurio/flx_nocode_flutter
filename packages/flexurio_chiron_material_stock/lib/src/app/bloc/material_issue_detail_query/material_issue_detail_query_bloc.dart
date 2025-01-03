import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_detail_query_bloc.freezed.dart';

@freezed
class MaterialIssueDetailQueryState with _$MaterialIssueDetailQueryState {
  factory MaterialIssueDetailQueryState.initial() = _Initial;
  factory MaterialIssueDetailQueryState.loading(
    PageOptions<MaterialIssueDetail> pageOptions,
  ) = _Loading;
  factory MaterialIssueDetailQueryState.loaded(
    PageOptions<MaterialIssueDetail> pageOptions,
  ) = _Loaded;
  factory MaterialIssueDetailQueryState.error(String error) = _Error;
}

@freezed
class MaterialIssueDetailQueryEvent with _$MaterialIssueDetailQueryEvent {
  factory MaterialIssueDetailQueryEvent.fetch({
    PageOptions<MaterialIssueDetail>? pageOptions,
    MaterialIssue? materialIssue,
  }) = _Fetch;
}

class MaterialIssueDetailQueryBloc
    extends Bloc<MaterialIssueDetailQueryEvent, MaterialIssueDetailQueryState> {
  final bool isExternal;
  MaterialIssueDetailQueryBloc({
    required this.isExternal,
  }) : super(_Initial()) {
    on<MaterialIssueDetailQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (pageOptions, materialIssue) async {
            emit(_Loading(_pageOptions));
            try {
              if (pageOptions != null) {
                _pageOptions = pageOptions;
              }

              final materialIssueDetails = await MaterialIssueRepository
                  .instance
                  .materialIssueDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                pageOptions: _pageOptions,
                materialIssue: materialIssue,
                isExternal: isExternal,
              );
              emit(_Loaded(materialIssueDetails));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
  PageOptions<MaterialIssueDetail> _pageOptions = PageOptions.empty();
}
