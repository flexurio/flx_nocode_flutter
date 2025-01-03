import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_marketing/src/app/model/marketing_area.dart';
import 'package:flexurio_chiron_marketing/src/app/resource/marketing_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'marketing_area_query_bloc.freezed.dart';

@freezed
class MarketingAreaQueryState with _$MarketingAreaQueryState {
  const factory MarketingAreaQueryState.initial() = _Initial;
  const factory MarketingAreaQueryState.loading() = _Loading;
  const factory MarketingAreaQueryState.loaded(
    List<MarketingArea> marketingArea,
  ) = _Success;
  const factory MarketingAreaQueryState.error(String error) = _Error;
}

@freezed
class MarketingAreaQueryEvent with _$MarketingAreaQueryEvent {
  const factory MarketingAreaQueryEvent.fetch({
    String? jab,
  }) = _Fetch;
}

class MarketingAreaQueryBloc
    extends Bloc<MarketingAreaQueryEvent, MarketingAreaQueryState> {
  MarketingAreaQueryBloc() : super(const _Initial()) {
    on<MarketingAreaQueryEvent>(
      (event, emit) async {
        await event.when(
          fetch: (jab) async {
            emit(const _Loading());
            try {
              final marketingArea =
                  await MarketingRepository.instance.marketingAreaFetch(
                accessToken: UserRepositoryApp.instance.token!,
                jab: jab!,
              );
              emit(
                _Success(
                  marketingArea,
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
