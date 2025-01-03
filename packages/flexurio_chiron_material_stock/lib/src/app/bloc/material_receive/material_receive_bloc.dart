import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_receive_bloc.freezed.dart';

@freezed
class MaterialReceiveState with _$MaterialReceiveState {
  const factory MaterialReceiveState.initial({
    required List<MaterialReceiveDetail> materialReceiveDetail,
    MaterialReceiveCreateTypeForm? typeForm,
    MaterialReceiveCreateForm? createFormMaterialReceive,
  }) = _Initial;
  const factory MaterialReceiveState.loading() = _Loading;
  const factory MaterialReceiveState.success() = _Success;
  const factory MaterialReceiveState.error(String error) = _Error;
}

@freezed
class MaterialReceiveEvent with _$MaterialReceiveEvent {
  const factory MaterialReceiveEvent.initialize(
    MaterialReceive materialReceive,
  ) = _Initialize;
  const factory MaterialReceiveEvent.createType(
    MaterialReceiveCreateTypeForm materialReceiveCreateTypeForm,
  ) = _CreateType;
  const factory MaterialReceiveEvent.createForm(
    MaterialReceiveCreateForm createFormMaterialReceive,
  ) = _CreateFormPurchaseOrder;
  const factory MaterialReceiveEvent.createMaterial(
    List<MaterialReceiveDetail> materials,
  ) = _CreateMaterial;
  const factory MaterialReceiveEvent.materialAdd(
    MaterialReceiveDetail materialReceiveDetail,
  ) = MaterialAdd;
  const factory MaterialReceiveEvent.materialRemove(
    MaterialReceiveDetail materialReceiveDetail,
  ) = _MaterialRemove;
  const factory MaterialReceiveEvent.editForm({
    required MaterialReceive materialReceive,
    required String description,
    required WarehouseMaterialReceive warehouse,
    required String deliveryOrderNo,
    required DateTime? deliveryOrderDate,
  }) = _Edit;
  const factory MaterialReceiveEvent.submit() = _Submit;
  const factory MaterialReceiveEvent.delete({
    required MaterialReceive materialReceive,
  }) = _Delete;
}

class MaterialReceiveBloc
    extends Bloc<MaterialReceiveEvent, MaterialReceiveState> {
  final bool isExternal;
  MaterialReceiveBloc({
    required this.isExternal,
  }) : super(const _Initial(materialReceiveDetail: [])) {
    on<MaterialReceiveEvent>((event, emit) async {
      await event.when(
        createType: (form) async {
          _typeForm = form;
          emit(
            _Initial(
              typeForm: _typeForm,
              materialReceiveDetail: _materials,
              createFormMaterialReceive: _materialReceiveCreateForm,
            ),
          );
        },
        createMaterial: (materials) async {
          _materials = materials;
          emit(
            _Initial(
              typeForm: _typeForm,
              materialReceiveDetail: _materials,
              createFormMaterialReceive: _materialReceiveCreateForm,
            ),
          );
        },
        editForm: (
          materialReceive,
          description,
          warehouse,
          deliveryOrderId,
          deliveryOrderDate,
        ) async {
          emit(const _Loading());
          try {
            await MaterialRepository.instance.materialReceiveEdit(
              materialReceive: materialReceive,
              description: description,
              warehouse: warehouse,
              deliveryOrderId: deliveryOrderId,
              accessToken: UserRepositoryApp.instance.token!,
              deliveryOrderDate: deliveryOrderDate,
            );
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        materialRemove: (materialReceiveDetail) {
          emit(const _Loading());
          _materials.remove(materialReceiveDetail);
          emit(
            _Initial(
              typeForm: _typeForm,
              materialReceiveDetail: List.from(_materials),
              createFormMaterialReceive: _materialReceiveCreateForm,
            ),
          );
        },
        materialAdd: (materialReceiveDetail) async {
          emit(const _Loading());
          _materials.add(materialReceiveDetail);
          emit(
            _Initial(
              typeForm: _typeForm,
              materialReceiveDetail: _materials,
              createFormMaterialReceive: _materialReceiveCreateForm,
            ),
          );
        },
        submit: () async {
          emit(const _Loading());
          late MaterialReceive materialReceive;
          final type = _typeForm!.type;
          try {
            if (type == MaterialReceiveType.purchaseOrder) {
              materialReceive = await MaterialRepository.instance
                  .materialReceiveCreatePurchaseOrder(
                accessToken: UserRepositoryApp.instance.token!,
                createForm: _materialReceiveCreateForm!,
              );
            } else if (type == MaterialReceiveType.nonPurchaseOrder) {
              materialReceive = await MaterialRepository.instance
                  .materialReceiveCreateNonPurchaseOrder(
                accessToken: UserRepositoryApp.instance.token!,
                createForm: _materialReceiveCreateForm!,
              );
            }
            for (final material in _materials) {
              await MaterialRepository.instance.materialReceiveDetailCreate(
                accessToken: UserRepositoryApp.instance.token!,
                materialReceive: materialReceive,
                materialReceiveDetail: material,
                type: type,
              );
            }
            emit(const _Success());
          } catch (error) {
            emit(_Error(errorMessage(error)));
            emit(
              _Initial(
                typeForm: _typeForm,
                materialReceiveDetail: _materials,
                createFormMaterialReceive: _materialReceiveCreateForm,
              ),
            );
          }
        },
        createForm: (form) {
          _materialReceiveCreateForm = form;
          emit(
            _Initial(
              typeForm: _typeForm,
              materialReceiveDetail: _materials,
              createFormMaterialReceive: _materialReceiveCreateForm,
            ),
          );
        },
        initialize: (materialReceive) async {
          emit(const _Loading());
          try {
            _typeForm = MaterialReceiveCreateTypeForm(
              type: materialReceive.type,
              mutation: false,
            );
            _materialReceiveCreateForm = MaterialReceiveCreateForm(
              department: materialReceive.department,
              vendor: materialReceive.vendor,
              materialGroup: materialReceive.materialGroup,
              transactionType: materialReceive.transactionType,
              purchaseOrder: materialReceive.purchaseOrder,
              warehouse: materialReceive.warehouse.id,
              deliveryOrderId: materialReceive.deliveryOrderId,
              deliveryOrderDate: materialReceive.deliveryOrderDate,
              description: materialReceive.description,
            );
            final materials = await MaterialReceiveRepository.instance
                .materialReceiveDetailFetchById(
              accessToken: UserRepositoryApp.instance.token!,
              materialReceive: materialReceive,
              isExternal: isExternal,
            );
            _materials.addAll(materials);
            emit(
              _Initial(
                typeForm: _typeForm,
                materialReceiveDetail: _materials,
                createFormMaterialReceive: _materialReceiveCreateForm,
              ),
            );
          } catch (error) {
            emit(_Error(errorMessage(error)));
          }
        },
        delete: (materialReceive) async {
          emit(const _Loading());
          try {
            await MaterialReceiveRepository.instance.materialReceiveDelete(
              materialReceive: materialReceive,
              accessToken: UserRepositoryApp.instance.token!,
              isExternal: isExternal,
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
  List<MaterialReceiveDetail> _materials = [];
  MaterialReceiveCreateForm? _materialReceiveCreateForm;
  MaterialReceiveCreateTypeForm? _typeForm;
}
