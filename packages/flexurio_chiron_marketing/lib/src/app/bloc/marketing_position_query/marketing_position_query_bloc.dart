import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/model/marketing_position.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/marketing_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'marketing_position_query_bloc.freezed.dart';

@freezed
class MarketingPositionQueryState with _$MarketingPositionQueryState {
  const factory MarketingPositionQueryState.initial() = _Initial;
  const factory MarketingPositionQueryState.loading() = _Loading;
  const factory MarketingPositionQueryState.loaded(
    List<MarketingPosition> marketingPosition,
  ) = _Success;
  const factory MarketingPositionQueryState.error(String error) = _Error;
}

@freezed
class MarketingPositionQueryEvent with _$MarketingPositionQueryEvent {
  const factory MarketingPositionQueryEvent.fetch() = _Fetch;
}

class MarketingPositionQueryBloc
    extends Bloc<MarketingPositionQueryEvent, MarketingPositionQueryState> {
  MarketingPositionQueryBloc() : super(const _Initial()) {
    on<MarketingPositionQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: () async {
            emit(const _Loading());
            try {
              final marketingPosition =
                  await MarketingRepository.instance.marketingPositionFetch(
                accessToken: UserRepositoryApp.instance.token!,
              );
              emit(
                _Success(
                  marketingPosition,
                ),
              );
            } catch (error) {
              emit(
                _Error(
                  errorMessage(error),
                ),
              );
            }
          },
        );
      },
    );
  }
}
