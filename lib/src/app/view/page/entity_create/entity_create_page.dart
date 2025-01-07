import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:appointment/src/app/model/config.dart';

class EntityCreatePage extends StatefulWidget {
  const EntityCreatePage._(
    this.data,
    this.entity,
  );

  final Map<String, dynamic>? data;
  final configuration.Entity entity;

  static Route<bool?> route({
    required configuration.Entity material,
    Map<String, dynamic>? data,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EntityBloc()),
        ],
        child: EntityCreatePage._(data, material),
      ),
    );
  }

  @override
  State<EntityCreatePage> createState() => _EntityCreatePageState();
}

class _EntityCreatePageState extends State<EntityCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  final _idController = TextEditingController();
  final _packSizeController = TextEditingController();
  bool? _isAssets;
  late DataAction _action;
  String? _companyId;

  @override
  void initState() {
    super.initState();

    for (final field in widget.entity.fields) {
      _controllers[field.reference] = TextEditingController();
    }

    _action = createOrEdit(widget.data);
    if (_action.isEdit) {
      for (final field in widget.entity.fields) {
        _controllers[field.reference]!.text = widget.data![field.reference];
      }
    }
  }

  void _submit() {
    // if (_formKey.currentState!.validate()) {
    //   late EntityEvent event;
    //   bool? valueGet() {
    //     if (_isAssets == null) {
    //       return false;
    //     } else {
    //       return _isAssets;
    //     }
    //   }

    //   final packSize = stringToInt(_packSizeController.text);

    //   if (_action.isEdit) {
    //     event = EntityEvent.edit(
    //       isAssets: valueGet(),
    //       name: _nameController.text,
    //       materialGroup: _materialGroup!,
    //       materialUnit: _materialUnit!,
    //       id: _idController.text,
    //       packSize: packSize,
    //       type: _type!,
    //     );
    //   } else {
    //     event = EntityEvent.create(
    //       name: _nameController.text,
    //       materialUnit: _materialUnit!,
    //       stockUnit: _stockUnit!,
    //       materialGroup: _materialGroup!,
    //       id: _idController.text,
    //       isAssets: valueGet(),
    //       packSize: packSize,
    //       type: _type!,
    //       companyId: _companyId!,
    //     );
    //   }

    //   context.read<EntityBloc>().add(event);
    // }
  }

  // void _updateUnitConvert() {
  //   if (_materialUnit != null && _stockUnit != null) {
  //     context.read<UnitConvertQueryBloc>().add(
  //           UnitConvertQueryEvent.fetch(
  //             unitFrom: _materialUnit!,
  //             unitTo: _stockUnit!,
  //             pageOptions: PageOptions.emptyNoLimit(),
  //           ),
  //         );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EntityBloc, EntityState>(
      listener: (context, state) {
        state.maybeWhen(
          success: () {
            Toast(context).dataChanged(_action, Entity.material);
            Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleFormPanel(
          formKey: _formKey,
          action: _action,
          entity: Entity.material,
          actions: [
            BlocBuilder<EntityBloc, EntityState>(
              builder: (context, state) {
                return Button(
                  permission: null,
                  isInProgress: state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  ),
                  onPressed: _submit,
                  action: _action,
                );
              },
            ),
          ],
          children: [
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    final children = <Widget>[];
    var first = true;
    for (final field in widget.entity.fields) {
      if (first) {
        first = false;
      }
      final fieldWidget = field.build(_action, _controllers[field.reference]);

      children.addAll([
        if (!first) Gap(12),
        fieldWidget,
      ]);
    }
    return Column(children: children);
  }
}
