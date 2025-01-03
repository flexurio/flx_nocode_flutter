import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_halal_certificate.dart';
import 'package:flexurio_chiron_material/src/app/resource/material_halal_certificate.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_halal_certificate_query_bloc.freezed.dart';

@freezed
class MaterialHalalCertificateQueryEvent
    with _$MaterialHalalCertificateQueryEvent {
  const factory MaterialHalalCertificateQueryEvent.fetch({
    PageOptions<MaterialHalalCertificate>? pageOptions,
  }) = _Fetch;
}

@freezed
class MaterialHalalCertificateQueryState
    with _$MaterialHalalCertificateQueryState {
  const factory MaterialHalalCertificateQueryState.error(String error) = _Error;
  const factory MaterialHalalCertificateQueryState.initial() = _Initial;
  const factory MaterialHalalCertificateQueryState.loading(
    PageOptions<MaterialHalalCertificate> pageOptions,
  ) = _Loading;
  const factory MaterialHalalCertificateQueryState.loaded(
    PageOptions<MaterialHalalCertificate> pageOptions,
  ) = _Success;
}

class MaterialHalalCertificateQueryBloc extends Bloc<
    MaterialHalalCertificateQueryEvent, MaterialHalalCertificateQueryState> {
  MaterialHalalCertificateQueryBloc() : super(const _Initial()) {
    on<MaterialHalalCertificateQueryEvent>((event, emit) async {
      await event.when(
        fetch: (pageOptions) async {
          emit(_Loading(_pageOptions));
          try {
            if (pageOptions != null) {
              _pageOptions = pageOptions;
            }
            _pageOptions =
                await MaterialHalalCertificateRepository.instance.fetch(
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

  var _pageOptions =
      PageOptions<MaterialHalalCertificate>.empty(sortBy: 'material_group_id');
}
