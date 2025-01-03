import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/material_group.dart';
import 'package:appointment/src/app/view/widget/string_to_double.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class MaterialAddForm extends StatefulWidget {
  const MaterialAddForm._(
    this.quantity,
  );

  final double quantity;

  static Widget prepare(double initialQuantity) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(
              MaterialGroupQueryEvent.fetch(
                materialGroupCategory: MaterialGroupCategory.service,
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => MaterialQueryBloc(),
        ),
      ],
      child: MaterialAddForm._(initialQuantity),
    );
  }

  @override
  State<MaterialAddForm> createState() => _MaterialRequestDetailCreateState();
}

class _MaterialRequestDetailCreateState extends State<MaterialAddForm> {
  final _formKey = GlobalKey<FormState>();
  final _quantityController = TextEditingController();
  final _materialController = TextEditingController();
  model.Material? _material;
  MaterialGroup? _materialGroup;

  @override
  void initState() {
    super.initState();
    _quantityController.text = widget.quantity.toString();
  }

  void _submit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final data = PurchaseRequestDetail.empty().copyWith(
        material: _material,
        quantity: stringDecimalToDouble(_quantityController.text),
        unit: _material!.materialUnit,
      );
      Navigator.pop(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    const action = DataAction.add;
    return SingleFormPanel(
      actions: [
        Button(
          permission: null,
          onPressed: () {
            _submit(context);
          },
          action: action,
        ),
      ],
      formKey: _formKey,
      action: action,
      entity: Entity.material,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FDropDownSearchMaterialGroup(
              onChanged: (materialGroup) {
                if (materialGroup != null) {
                  _materialGroup = materialGroup;
                  _materialController.text = '';
                  _material = null;
                  context.read<MaterialQueryBloc>().add(
                        MaterialQueryEvent.fetch(materialGroup: materialGroup),
                      );
                  setState(() {});
                }
              },
            ),
            const Gap(12),
            FDropDownSearchMaterial(
              key: ValueKey(_materialGroup),
              onChanged: (material) {
                if (material != null) {
                  _material = material;
                }
              },
            ),
            const Gap(12),
            FTextFormField(
              labelText: 'Quantity',
              controller: _quantityController,
              validator: requiredValidator.call,
              maxLength: 50,
              inputFormatters: [ThousandsFormatter()],
            ),
          ],
        ),
      ],
    );
  }
}
