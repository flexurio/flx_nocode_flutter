import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/resource/petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petty_cash_query_bloc.freezed.dart';

@freezed
class PettyCashQueryEvent with _$PettyCashQueryEvent {
  const factory PettyCashQueryEvent.fetch({
    PageOptions<PettyCash>? pageOptions,
    PettyCashStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? approveStartDate,
    DateTime? approveEndDate,
    String? realizationNo,
    String? type,
  }) = _Fetch;
  const factory PettyCashQueryEvent.fetchById(String id) = _FetchById;
}

@freezed
class PettyCashQueryState with _$PettyCashQueryState {
  const factory PettyCashQueryState.error(String error) = _Error;
  const factory PettyCashQueryState.initial() = _Initial;
  const factory PettyCashQueryState.loaded(PageOptions<PettyCash> pageOptions) =
      _Success;
  const factory PettyCashQueryState.loading(
    PageOptions<PettyCash> pageOptions,
  ) = _Loading;
}

class PettyCashQueryBloc
    extends Bloc<PettyCashQueryEvent, PettyCashQueryState> {
  PettyCashQueryBloc() : super(const _Initial()) {
    on<PettyCashQueryEvent>((event, emit) async {
      await event.when(
        fetchById: (id) async {
          emit(_Loading(_pageOptions));
          try {
            final pettyCash =
                await PettyCashRepository.instance.pettyCashFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              id: id,
            );
            emit(_Success(PageOptions.empty(data: [pettyCash])));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch: (
          pageOptions,
          status,
          startDate,
          endDate,
          approveStartDate,
          approveEndDate,
          realizationNo,
          type,
        ) async {
          emit(_Loading(_pageOptions));
          try {
            if (status != null) _status = status;

            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions = await PettyCashRepository.instance.pettyCashFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              status: _status,
              startDate: startDate,
              endDate: endDate,
              approvedStartDate: approveStartDate,
              approvedEndDate: approveEndDate,
              realizationNo: realizationNo,
              type: type,
            );

            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PettyCashStatus? _status;
  PageOptions<PettyCash> _pageOptions = PageOptions.empty();
}
