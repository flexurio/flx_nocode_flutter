import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_detail_bloc.freezed.dart';

@freezed
class MaterialReceiveDetailState with _$MaterialReceiveDetailState {
  const factory MaterialReceiveDetailState.initial() = _Initial;
  const factory MaterialReceiveDetailState.loading() = _Loading;
  const factory MaterialReceiveDetailState.success() = _Success;
  const factory MaterialReceiveDetailState.error(String error) = _Error;
}

@freezed
class MaterialReceiveDetailEvent with _$MaterialReceiveDetailEvent {
  const factory MaterialReceiveDetailEvent.delete({
    required MaterialReceiveDetail materialReceiveDetail,
  }) = _Delete;
  const factory MaterialReceiveDetailEvent.release({
    required MaterialReceiveDetail materialReceiveDetail,
    List<int>? vatNo,
    DateTime? retestDateQc,
  }) = _Release;
  const factory MaterialReceiveDetailEvent.retest({
    required MaterialReceiveDetail materialReceiveDetail,
    List<int>? vatNo,
    DateTime? retestDateQc,
  }) = _Retest;
  const factory MaterialReceiveDetailEvent.reject({
    required MaterialReceiveDetail materialReceiveDetail,
    List<int>? vatNo,
    String? reason,
    String? statusReject,
  }) = _Reject;
  const factory MaterialReceiveDetailEvent.edit({
    required MaterialReceiveDetail materialReceiveDetail,
    required String batchNo,
    required DateTime? expiredDate,
    required DateTime? bestBefore,
    required DateTime? manufacturingDate,
    required DateTime? shelfLife,
    required DateTime? retestDate,
  }) = _Edit;
}

class MaterialReceiveDetailBloc
    extends Bloc<MaterialReceiveDetailEvent, MaterialReceiveDetailState> {
  final bool isExternal;
  final bool isByNa;
  MaterialReceiveDetailBloc({
    required this.isExternal,
    this.isByNa = false,
  }) : super(const _Initial()) {
    on<MaterialReceiveDetailEvent>((event, emit) async {
      await event.when(
        delete: (materialReceiveDetail) async {
          emit(const _Loading());
          try {
            if (isByNa) {
              await MaterialReceiveRepository.instance
                  .materialReceiveByNaDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceive: materialReceiveDetail.materialReceive,
              );
            } else {
              await MaterialReceiveRepository.instance
                  .materialReceiveDetailDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveDetail: materialReceiveDetail,
                isExternal: isExternal,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        reject: (materialReceiveDetail, vatNo, reason, statusReject) async {
          emit(const _Loading());
          try {
            if (vatNo != null) {
              await MaterialReceiveRepository.instance
                  .materialReceiveDetailReject(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveDetail: materialReceiveDetail,
                vatNo: vatNo,
                reason: reason!,
                statusReject: statusReject!,
                isExternal: isExternal,
              );
            } else {
              await MaterialReceiveRepository.instance
                  .materialReceiveDetailRejectX(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveDetail: materialReceiveDetail,
                isExternal: isExternal,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        release: (materialReceiveDetail, vatNo, retestDateQc) async {
          emit(const _Loading());
          try {
            if (vatNo != null) {
              await MaterialReceiveRepository.instance
                  .materialReceiveDetailRelease(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveDetail: materialReceiveDetail,
                vatNo: vatNo,
                retestDateQc: retestDateQc,
                isExternal: isExternal,
              );
            } else {
              await MaterialReceiveRepository.instance
                  .materialReceiveDetailReleaseX(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceiveDetail: materialReceiveDetail,
                isExternal: isExternal,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        retest: (materialReceiveDetail, vatNo, retestDateQc) async {
          emit(const _Loading());
          try {
            await MaterialReceiveRepository.instance
                .materialReceiveDetailRetest(
              accessToken: UserRepositoryApp.instance.token!,
              materialReceiveDetail: materialReceiveDetail,
              vatNo: vatNo!,
              retestDateQc: retestDateQc!,
              isExternal: isExternal,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        edit: (
          materialReceiveDetail,
          batchNo,
          expiredDate,
          bestBefore,
          manufacturingDate,
          shelfLife,
          retestDate,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialReceiveDetailEdit(
              accessToken: UserRepositoryApp.instance.token!,
              materialReceiveDetail: materialReceiveDetail,
              batchNo: batchNo,
              expiredDate: expiredDate,
              bestBefore: bestBefore,
              manufacturingDate: manufacturingDate,
              shelfLife: shelfLife,
              retestDate: retestDate,
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
