import 'package:flexurio_chiron_material/src/app/model/sertificate_documents.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sertificate_documents_query_bloc.freezed.dart';

@freezed
class SertificateDocumentsQueryState with _$SertificateDocumentsQueryState {
  const factory SertificateDocumentsQueryState.initial() = _Initial;
  const factory SertificateDocumentsQueryState.loading(
    PageOptions<SertificateDocuments> pageOptions,
  ) = _Loading;
  const factory SertificateDocumentsQueryState.loaded(
    PageOptions<SertificateDocuments> pageOptions,
  ) = _Success;
  const factory SertificateDocumentsQueryState.error(String error) = _Error;
}

@freezed
class SertificateDocumentsQueryEvent with _$SertificateDocumentsQueryEvent {
  const factory SertificateDocumentsQueryEvent.initialize() = _Initialize;
  const factory SertificateDocumentsQueryEvent.get({
    PageOptions<SertificateDocuments>? pageOptions,
  }) = _Get;
}

class SertificateDocumentsQueryBloc extends Bloc<SertificateDocumentsQueryEvent,
    SertificateDocumentsQueryState> {
  SertificateDocumentsQueryBloc() : super(const _Initial()) {
    on<SertificateDocumentsQueryEvent>((event, emit) async {
      await event.when(
        initialize: () async {
          if (state is _Initial) {
            add(const SertificateDocumentsQueryEvent.get());
          } else {
            _pageOptions =
                await MaterialRepository.instance.sertificateDocumentsFetch(
              pageOptions: _pageOptions,
              accessToken: UserRepositoryApp.instance.token!,
            );
            emit(_Success(_pageOptions));
          }
        },
        get: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }

            _pageOptions =
                await MaterialRepository.instance.sertificateDocumentsFetch(
              accessToken: UserRepositoryApp.instance.token!,
              pageOptions: _pageOptions,
            );

            emit(_Success(_pageOptions));
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}

PageOptions<SertificateDocuments> _pageOptions = PageOptions.empty();
