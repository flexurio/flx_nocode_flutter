import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue_detail_bloc.freezed.dart';

@freezed
class MaterialIssueDetailState with _$MaterialIssueDetailState {
  factory MaterialIssueDetailState.initial() = _Initial;
  factory MaterialIssueDetailState.loading() = _Loading;
  factory MaterialIssueDetailState.success() = _Success;
  factory MaterialIssueDetailState.error(String error) = _Error;
}

@freezed
class MaterialIssueDetailEvent with _$MaterialIssueDetailEvent {
  factory MaterialIssueDetailEvent.create({
    required String na,
    required double quantity,
    required double quantityRequired,
    required Material material,
    required MaterialIssue materialIssue,
    required String materialUnit,
  }) = _Create;
  factory MaterialIssueDetailEvent.edit({
    required String na,
    required double quantity,
    required Material material,
    required MaterialIssue materialIssue,
    required MaterialIssueDetail materialIssueDetail,
    required String materialUnit,
  }) = _Edit;
  factory MaterialIssueDetailEvent.delete({
    required MaterialIssueDetail materialIssueDetail,
  }) = _Delete;
}

class MaterialIssueDetailBloc
    extends Bloc<MaterialIssueDetailEvent, MaterialIssueDetailState> {
  final bool isExternal;
  MaterialIssueDetailBloc({
    required this.isExternal,
  }) : super(_Initial()) {
    on<MaterialIssueDetailEvent>(
      (event, emit) async {
        await event.when(
          create: (
            na,
            quantity,
            quantityRequired,
            material,
            materialIssue,
            materialUnit,
          ) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                na: na,
                quantity: quantity,
                quantityRequired: quantityRequired,
                material: material,
                materialIssue: materialIssue,
                materialUnit: materialUnit,
                isExternal: isExternal,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          edit: (
            na,
            quantity,
            material,
            materialIssue,
            materialIssueDetail,
            materialUnit,
          ) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueDetailEdit(
                accessToken: UserRepositoryApp.instance.token!,
                na: na,
                quantity: quantity,
                material: material,
                materialIssue: materialIssue,
                materialIssueDetail: materialIssueDetail,
                materialUnit: materialUnit,
                isExternal: isExternal,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (materialIssueDetail) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueDetailDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialIssueDetail: materialIssueDetail,
                isExternal: isExternal,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
