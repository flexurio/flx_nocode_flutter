import 'package:appointment/src/app/resource/accounting_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ebitda_bloc.freezed.dart';

@freezed
class EbitdaState with _$EbitdaState {
  const factory EbitdaState.initial() = _Initial;
  const factory EbitdaState.loading() = _Loading;
  const factory EbitdaState.success() = _Success;
  const factory EbitdaState.error(String error) = _Error;
}

@freezed
class EbitdaBlocEvent with _$EbitdaBlocEvent {
  const factory EbitdaBlocEvent.upload({
    required String url,
    required int period,
    PlatformFile? attachment,
  }) = _Upload;
}

class EbitdaBloc extends Bloc<EbitdaBlocEvent, EbitdaState> {
  EbitdaBloc() : super(const _Initial()) {
    on<EbitdaBlocEvent>((event, emit) async {
      await event.when(
        upload: (url, period, attachment) async {
          emit(const _Loading());
          try {
            await AccountingRepository.instance.ebitdaUpload(
              accessToken: UserRepositoryApp.instance.token!,
              period: period,
              attachment: attachment!,
              url: url,
            );
            emit(
              const _Success(),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
