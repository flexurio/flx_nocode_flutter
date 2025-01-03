import 'package:flexurio_chiron_material_stock/src/app/bloc/material_receive_detail_query/material_receive_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return/material_return_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_detail_query/material_return_detail_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_material_filter_query/material_return_material_filter_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_material_query/material_return_material_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_na_query/material_return_na_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_receive_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_detail.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_material.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_na.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/warehouse.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/dropdown_material_return_material.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_create/widget/dropdown_material_return_na.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MaterialReturnDetailCreatePage extends StatefulWidget {
  const MaterialReturnDetailCreatePage._(
    this.materialReturnDetail,
    this.bloc,
    this.materialReturnFormProduct,
    this.materialReturnType,
  );
  final MaterialReturnDetail? materialReturnDetail;
  final MaterialReturnBloc bloc;
  final MaterialReturnFormProduct? materialReturnFormProduct;
  final MaterialReturnType materialReturnType;

  @override
  State<MaterialReturnDetailCreatePage> createState() =>
      _MaterialReturnDetailCreatePageState();

  static Widget prepare({
    required MaterialReturnBloc bloc,
    MaterialReturnDetail? materialReturnDetail,
    MaterialReturnFormProduct? materialReturnFormProduct,
    required MaterialReturnType materialReturnType,
  }) {
    final isExternal = materialReturnFormProduct?.isCreateExternal ?? false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(isExternal: isExternal)
            ..add(
              MaterialQueryEvent.fetch(
                materialGroup: materialReturnFormProduct?.materialGroup,
                isActive: true,
                pageOptions: PageOptions.emptyNoLimit(
                  sortBy: 'name',
                  ascending: true,
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialReceiveDetailQueryBloc(
            isExternal: false,
          ),
        ),
        BlocProvider(
          create: (context) =>
              MaterialReturnNaQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) =>
              MaterialReturnMaterialQueryBloc(isExternal: isExternal)
                ..add(
                  MaterialReturnMaterialQueryEvent.fetch(
                    materialGroupId:
                        materialReturnFormProduct?.materialGroup.id,
                    productId: materialReturnFormProduct?.product?.id,
                    batchId: materialReturnFormProduct?.productionOrder?.id,
                  ),
                ),
        ),
        BlocProvider(
          create: (context) => MaterialReturnMaterialFilterQueryBloc(),
        ),
        BlocProvider(create: (context) => MaterialReturnDetailQueryBloc()),
      ],
      child: MaterialReturnDetailCreatePage._(
        materialReturnDetail,
        bloc,
        materialReturnFormProduct,
        materialReturnType,
      ),
    );
  }
}

class _MaterialReturnDetailCreatePageState
    extends State<MaterialReturnDetailCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _quantityRemainingController = TextEditingController();

  late DataAction _action;
  MaterialReturnMaterial? _materialReturnMaterial;
  MaterialReturnNa? _materialReturnNa;
  double _quantityRemaining = 0;
  MaterialReceiveDetail? _na;
  model.Material? _material;

  @override
  void dispose() {
    _quantityController.dispose();
    _quantityRemainingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final entity = Entity.materialReturnDetail;
    return BlocBuilder<MaterialReturnMaterialFilterQueryBloc,
        MaterialReturnMaterialFilterQueryState>(
      builder: (context, state) {
        state.maybeWhen(
          orElse: () => _quantityRemainingController.text,
          loaded: (loaded) => {
            _quantityRemainingController.text =
                '${loaded[0].quantityRemaining} ${loaded[0].materialUnitId}',
            _quantityRemaining = loaded[0].quantityRemaining,
          },
        );
        return SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: entity,
          actions: [
            if (_action.isCreate) _buildSubmitButton(),
            if (_action.isEdit) _buildEditButton(),
          ],
          children: _buildCreateFields(context),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    _action = createOrEdit(widget.materialReturnDetail);

    if (_action.isEdit) {
      _materialReturnMaterial = MaterialReturnMaterial(
        na: widget.materialReturnDetail!.na,
        quantity: widget.materialReturnDetail!.quantity.toDouble(),
        materialId: widget.materialReturnDetail!.material.id,
        materialName: widget.materialReturnDetail!.material.name,
        materialUnitId: widget.materialReturnDetail!.materialUnit.id,
        quantityRemaining: 0,
        quantityReturn: 0,
      );
      _materialReturnNa = MaterialReturnNa(
        na: widget.materialReturnDetail!.na,
        quantityRemaining: 0,
      );

      _quantityController.text =
          widget.materialReturnDetail!.quantity.toString();

      context.read<MaterialReturnMaterialFilterQueryBloc>().add(
            MaterialReturnMaterialFilterQueryEvent.fetch(
              detail: widget.materialReturnDetail!,
            ),
          );
    }
  }

  List<Widget> _buildCreateFields(BuildContext context) {
    return [
      if (widget.materialReturnType.title == MaterialReturnType.returnX.title)
        FDropDownSearchMaterialReturnMaterial(
          initialValue: _materialReturnMaterial,
          enabled: _action.isCreate,
          onChanged: (material) {
            if (material != null) {
              _materialReturnMaterial = material;
              context.read<MaterialReturnNaQueryBloc>().add(
                    MaterialReturnNaQueryEvent.fetch(
                      materialId: _materialReturnMaterial!.materialId,
                    ),
                  );

              setState(() {});
            }
          },
        )
      else
        FDropDownSearchMaterial(
          onChanged: (material) {
            if (material != null) {
              _material = material;
              if (widget.materialReturnType.title ==
                  MaterialReturnType.returnX.title)
                context.read<MaterialReturnNaQueryBloc>().add(
                      MaterialReturnNaQueryEvent.fetch(
                        materialId: material.id,
                      ),
                    );
              else
                context.read<MaterialReceiveDetailQueryBloc>().add(
                      MaterialReceiveDetailQueryEvent.fetchNa(
                        pageOptions: PageOptions.emptyNoLimit(),
                        materials: material,
                        materialStatusQc: 'RELEASE',
                      ),
                    );
            }
          },
        ),
      const SizedBox(height: 24),
      if (widget.materialReturnType.title == MaterialReturnType.returnX.title)
        FDropDownSearchMaterialReturnNa(
          initialValue: _materialReturnNa,
          enabled: _action.isCreate,
          onChanged: (value) {
            if (value != null) {
              _materialReturnNa = value;
              _quantityRemainingController.text =
                  '${value.quantityRemaining} ${_materialReturnMaterial?.materialUnitId ?? ''}';
              _quantityRemaining = value.quantityRemaining;
            }
          },
        )
      else
        BlocBuilder<MaterialReceiveDetailQueryBloc,
            MaterialReceiveDetailQueryState>(
          builder: (context, state) {
            return FDropDownSearch<MaterialReceiveDetail>(
              labelText: 'NA',
              items: state.maybeWhen(
                loaded: (na) => na.data,
                orElse: () => [],
              ),
              onChanged: (value) {
                if (value != null) {
                  _na = value;
                }
              },
              itemAsString: (na) => na.na,
              validator: requiredObjectValidator.call,
            );
          },
        ),
      const SizedBox(height: 24),
      RowFields(
        children: [
          if (widget.materialReturnType.title ==
              MaterialReturnType.returnX.title)
            FTextFormField(
              labelText: 'quantity_out_remaining'.tr(),
              controller: _quantityRemainingController,
              enabled: false,
              maxLength: 50,
            ),
          FTextFormField(
            labelText: 'quantity'.tr(),
            controller: _quantityController,
            validator: MultiValidator([
              requiredValidator,
              RangeValueValidator(minValue: 0.0001),
            ]),
            maxLength: 50,
            inputFormatters: [DecimalInputFormatter()],
          ),
        ],
      ),
    ];
  }

  Widget _buildEditButton() {
    return BlocListener<MaterialReturnBloc, MaterialReturnState>(
      bloc: widget.bloc,
      listener: (context, state) {
        state.maybeWhen(
          initial: (_, __) {
            Toast(context).dataChanged(_action, Entity.materialReturn);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
        bloc: widget.bloc,
        builder: (context, state) {
          return _buildSubmitButton();
        },
      ),
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<MaterialReturnBloc, MaterialReturnState>(
      bloc: widget.bloc,
      builder: (context, state) {
        return Button(
          permission: null,
          isInProgress: state.maybeWhen(
            orElse: () => false,
            loading: () => true,
          ),
          action: _action.isCreate ? DataAction.create : DataAction.edit,
          onPressed: () => _submit(context),
        );
      },
    );
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (widget.materialReturnType.title == MaterialReturnType.returnX.title) {
        if (stringDecimalToDouble(_quantityController.text) <=
            _quantityRemaining) {
          if (stringDecimalToDouble(_quantityController.text) > 0) {
            final materialReturnDetail = MaterialReturnDetail(
              id: 0,
              materialReturn: MaterialReturn.empty(),
              quantity: stringDecimalToDouble(_quantityController.text),
              na: _materialReturnNa!.na,
              warehouse: Warehouse.alkes,
              materialUnit: MaterialUnit(
                id: _materialReturnMaterial!.materialUnitId,
                createdById: 0,
                type: MaterialUnitType.empty,
                createdAt: DateTime(0),
                updatedAt: DateTime(0),
                updateById: 0,
              ),
              material: model.Material(
                company: '',
                id: _materialReturnMaterial!.materialId,
                name: _materialReturnMaterial!.materialName,
                halalCertificateId: '',
                isLockQuantityMaterialIssue: true,
                isAsset: false,
                isActive: false,
                isOrder: false,
                isStock: false,
                createdAt: DateTime(0),
                updatedAt: DateTime(0),
                materialUnit: MaterialUnit(
                  id: _materialReturnMaterial!.materialUnitId,
                  createdById: 0,
                  type: MaterialUnitType.empty,
                  createdAt: DateTime(0),
                  updatedAt: DateTime(0),
                  updateById: 0,
                ),
                stockUnit: MaterialUnit.empty(),
                materialGroup: MaterialGroup.empty(),
                materialType: MaterialType.empty(),
                packSize: 0,
              ),
              createdAt: DateTime(0),
            );
            if (_action.isCreate) {
              Navigator.pop(context, materialReturnDetail);
            } else {
              widget.bloc.add(
                MaterialReturnEvent.materialEdit(
                  materialReturnDetail.copyWith(
                    id: widget.materialReturnDetail!.id,
                    materialReturn: widget.materialReturnDetail!.materialReturn,
                  ),
                ),
              );
            }
          } else {
            Navigator.pop(context);
          }
        } else {
          Toast(context).fail('quantity_input_limit'.tr());
        }
      } else {
        if (stringDecimalToDouble(_quantityController.text) > 0) {
          final materialReturnDetail = MaterialReturnDetail(
            id: 0,
            materialReturn: MaterialReturn.empty(),
            quantity: stringDecimalToDouble(_quantityController.text),
            na: _na!.na.toString(),
            warehouse: Warehouse.alkes,
            materialUnit: MaterialUnit(
              id: _material!.materialUnit.id,
              createdById: 0,
              type: MaterialUnitType.empty,
              createdAt: DateTime(0),
              updatedAt: DateTime(0),
              updateById: 0,
            ),
            material: model.Material(
              isLockQuantityMaterialIssue: true,
              company: '',
              id: _material!.id,
              name: _material!.name,
              halalCertificateId: '',
              isAsset: false,
              isActive: false,
              isOrder: false,
              isStock: false,
              createdAt: DateTime(0),
              updatedAt: DateTime(0),
              materialUnit: MaterialUnit(
                id: _material!.materialUnit.id,
                createdById: 0,
                type: MaterialUnitType.empty,
                createdAt: DateTime(0),
                updatedAt: DateTime(0),
                updateById: 0,
              ),
              stockUnit: MaterialUnit.empty(),
              materialGroup: MaterialGroup.empty(),
              materialType: MaterialType.empty(),
              packSize: 0,
            ),
            createdAt: DateTime(0),
          );
          if (_action.isCreate) {
            Navigator.pop(context, materialReturnDetail);
          } else {
            widget.bloc.add(
              MaterialReturnEvent.materialEdit(
                materialReturnDetail.copyWith(
                  id: widget.materialReturnDetail!.id,
                  materialReturn: widget.materialReturnDetail!.materialReturn,
                ),
              ),
            );
          }
        } else {
          Navigator.pop(context);
        }
      }
    }
  }
}
