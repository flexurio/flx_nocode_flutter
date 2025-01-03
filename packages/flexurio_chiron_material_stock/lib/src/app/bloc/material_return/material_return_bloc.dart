import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:appointment/src/app/resource/material_repository.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return_bloc.freezed.dart';

class MaterialReturnBloc
    extends Bloc<MaterialReturnEvent, MaterialReturnState> {
  MaterialReturnBloc() : super(_Initial(materials: [])) {
    on<MaterialReturnEvent>(
      (event, emit) async {
        await event.when(
          initialize: (materialReturn, isExternal) async {
            emit(_Loading());
            try {
              _materialReturnFormProduct = MaterialReturnFormProduct(
                materialGroup: materialReturn.materialGroup,
                department: materialReturn.department,
                remarks: materialReturn.remark,
                transactionType: materialReturn.transactionType,
                product: materialReturn.product,
                productionOrder: materialReturn.productionOrder,
                type: materialReturn.type,
              );
              final materials =
                  await MaterialRepository.instance.materialReturnDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturn: materialReturn,
                isExternal: isExternal,
              );
              _materials.addAll(materials);

              emit(
                _Initial(
                  materialReturnFormProduct: _materialReturnFormProduct,
                  materials: _materials,
                ),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          fetch: (materialReturn, isExternal) async {
            emit(_Loading());
            try {
              _materialReturnFormProduct = MaterialReturnFormProduct(
                materialGroup: materialReturn.materialGroup,
                department: materialReturn.department,
                remarks: materialReturn.remark,
                transactionType: materialReturn.transactionType,
                product: materialReturn.product,
                productionOrder: materialReturn.productionOrder,
                type: materialReturn.type,
              );
              final materials =
                  await MaterialRepository.instance.materialReturnDetailFetch(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturn: materialReturn,
                isExternal: isExternal,
              );
              _materials.clear();
              _materials.addAll(materials);

              emit(
                _Initial(
                  materialReturnFormProduct: _materialReturnFormProduct,
                  materials: _materials,
                ),
              );
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          createFormType: (form) async {
            emit(
              _Initial(
                materialReturnFormProduct: _materialReturnFormProduct,
                materials: _materials,
              ),
            );
          },
          createFormProduct: (form) async {
            _materialReturnFormProduct = form;
            emit(
              _Initial(
                materialReturnFormProduct: _materialReturnFormProduct,
                materials: _materials,
              ),
            );
          },
          createFormMaterial: (materials) async {
            _materials = materials;
            emit(
              _Initial(
                materialReturnFormProduct: _materialReturnFormProduct,
                materials: _materials,
              ),
            );
          },
          materialAdd: (materialReturnDetail) async {
            emit(_Loading());
            _materials.add(materialReturnDetail);
            emit(
              _Initial(
                materials: _materials,
                materialReturnFormProduct: _materialReturnFormProduct,
              ),
            );
          },
          materialRemove: (materialReturnDetail) async {
            emit(_Loading());
            _materials.remove(materialReturnDetail);
            emit(
              _Initial(
                materials: List.from(_materials),
                materialReturnFormProduct: _materialReturnFormProduct,
              ),
            );
          },
          materialEdit: (materialReturnDetail) async {
            try {
              emit(_Loading());
              final material =
                  await MaterialRepository.instance.materialReturnDetailEdit(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturnDetail: materialReturnDetail,
              );
              emit(_Initial(materials: [material]));
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          materialDelete: (materialReturnDetail) async {
            try {
              emit(_Loading());
              await MaterialRepository.instance.materialReturnDetailDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturnDetail: materialReturnDetail,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          submit: () async {
            emit(_Loading());
            try {
              final materialReturn =
                  await MaterialRepository.instance.materialReturnProductCreate(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturnFormProduct: _materialReturnFormProduct!,
                isExternal: _materialReturnFormProduct!.isCreateExternal,
              );

              for (final material in _materials) {
                await MaterialRepository.instance.materialReturnDetailCreate(
                  accessToken: UserRepositoryApp.instance.token!,
                  materialReturnDetail: material,
                  materialReturn: materialReturn,
                  isExternal: _materialReturnFormProduct!.isCreateExternal,
                );
              }

              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (materialReturn) async {
            emit(_Loading());
            try {
              await MaterialRepository.instance.materialReturnDelete(
                accessToken: UserRepositoryApp.instance.token!,
                materialReturn: materialReturn,
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
  MaterialReturnFormProduct? _materialReturnFormProduct;

  List<MaterialReturnDetail> _materials = [];
}

@freezed
class MaterialReturnEvent with _$MaterialReturnEvent {
  const factory MaterialReturnEvent.createFormMaterial(
    List<MaterialReturnDetail> materials,
  ) = _CreateFromMaterial;
  const factory MaterialReturnEvent.createFormProduct(
    MaterialReturnFormProduct materialReturnFormProduct,
  ) = _CreateFormProduct;
  const factory MaterialReturnEvent.createFormType(
    MaterialReturnFormType materialReturnFormType,
  ) = CreateFormType;
  const factory MaterialReturnEvent.delete(
    MaterialReturn materialReturn,
  ) = _Delete;
  const factory MaterialReturnEvent.initialize(
    MaterialReturn materialReturn,
    bool isExternal,
  ) = Initialize;
  const factory MaterialReturnEvent.fetch(
    MaterialReturn materialReturn,
    bool isExternal,
  ) = Fetch;
  const factory MaterialReturnEvent.materialAdd(
    MaterialReturnDetail materialReturnDetail,
  ) = _MaterialAdd;
  const factory MaterialReturnEvent.materialDelete(
    MaterialReturnDetail materialReturnDetail,
  ) = _MaterialDelete;
  const factory MaterialReturnEvent.materialEdit(
    MaterialReturnDetail materialReturnDetail,
  ) = _MaterialEdit;
  const factory MaterialReturnEvent.materialRemove(
    MaterialReturnDetail materialReturnDetail,
  ) = _MaterialRemove;
  const factory MaterialReturnEvent.submit() = _Submit;
}

@freezed
class MaterialReturnState with _$MaterialReturnState {
  factory MaterialReturnState.error(String error) = _Error;
  factory MaterialReturnState.initial({
    required List<MaterialReturnDetail> materials,
    MaterialReturnFormProduct? materialReturnFormProduct,
  }) = _Initial;
  factory MaterialReturnState.loading() = _Loading;
  factory MaterialReturnState.success() = _Success;
}
