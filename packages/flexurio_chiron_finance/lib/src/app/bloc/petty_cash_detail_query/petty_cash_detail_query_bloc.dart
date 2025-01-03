import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_finance/src/app/model/petty_cash_detail.dart';
import 'package:flexurio_chiron_finance/src/app/resource/petty_cash.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'petty_cash_detail_query_bloc.freezed.dart';

@freezed
class PettyCashDetailQueryEvent with _$PettyCashDetailQueryEvent {
  const factory PettyCashDetailQueryEvent.fetchByPettyCashId({
    required String pettyCashId,
  }) = _FetchByPettyCashId;

  const factory PettyCashDetailQueryEvent.fetch({
    PageOptions<PettyCashDetail>? pageOptions,
    required DateTime documentReceiveAtStart,
    required DateTime documentReceiveAtEnd,
  }) = _Fetch;
}

@freezed
class PettyCashDetailQueryState with _$PettyCashDetailQueryState {
  const factory PettyCashDetailQueryState.error(String error) = _Error;
  const factory PettyCashDetailQueryState.initial() = _Initial;
  const factory PettyCashDetailQueryState.loaded(
    PageOptions<PettyCashDetail> pageOptions,
  ) = _Success;
  const factory PettyCashDetailQueryState.loading() = _Loading;
}

class PettyCashDetailQueryBloc
    extends Bloc<PettyCashDetailQueryEvent, PettyCashDetailQueryState> {
  PettyCashDetailQueryBloc() : super(const _Initial()) {
    on<PettyCashDetailQueryEvent>((event, emit) async {
      await event.when(
        fetchByPettyCashId: (pettyCashId) async {
          emit(const _Loading());
          try {
            final pettyCashDetail = await PettyCashRepository.instance
                .pettyCashDetailFetchByPettyCashId(
              accessToken: UserRepositoryApp.instance.token!,
              pettyCashId: pettyCashId,
            );
            emit(_Success(PageOptions<PettyCashDetail>.empty()
                .copyWith(data: pettyCashDetail)));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        fetch:
            (pageOptions, documentReceiveAtStart, documentReceiveAtEnd) async {
          emit(const _Loading());
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await PettyCashRepository.instance.pettyCashDetailFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
              documentReceiveAtStart: documentReceiveAtStart,
              documentReceiveAtEnd: documentReceiveAtEnd,
            );
            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
  PageOptions<PettyCashDetail> _pageOptions = PageOptions.empty();
}
