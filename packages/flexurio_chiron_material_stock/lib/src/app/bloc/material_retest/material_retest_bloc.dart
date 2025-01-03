import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_retest_bloc.freezed.dart';

@freezed
abstract class MaterialRetestState with _$MaterialRetestState {
  const factory MaterialRetestState.initial() = _Initial;
  const factory MaterialRetestState.loading() = _Loading;
  const factory MaterialRetestState.success() = _Success;
  const factory MaterialRetestState.error(String error) = _Error;
}

@freezed
abstract class MaterialRetestEvent with _$MaterialRetestEvent {
  const factory MaterialRetestEvent.create({
    required MaterialGroup materialGroup,
    required Material material,
    required String na,
    required int quantityRetest,
    required DateTime expiredDate,
    required MaterialIssue materialIssue,
  }) = _Create;
  const factory MaterialRetestEvent.update({
    required MaterialRetest materialRetest,
    required String status,
    required DateTime retestsDate,
  }) = _Update;
}

class MaterialRetestBloc
    extends Bloc<MaterialRetestEvent, MaterialRetestState> {
  MaterialRetestBloc() : super(const _Initial()) {
    on<MaterialRetestEvent>((event, emit) async {
      await event.when(
        create: (
          materialGroup,
          material,
          na,
          quantityRetest,
          expiredDate,
          materialIssue,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialRetestCreate(
              accessToken: UserRepositoryApp.instance.token!,
              materialGroup: materialGroup,
              material: material,
              na: na,
              quantityRetest: quantityRetest,
              expiredDate: expiredDate,
              materialIssue: materialIssue,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        update: (
          materialRetest,
          status,
          retestDate,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialRetestUpdate(
              accessToken: UserRepositoryApp.instance.token!,
              materialRetest: materialRetest,
              status: status,
              retestDate: retestDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
      );
    });
  }
}
