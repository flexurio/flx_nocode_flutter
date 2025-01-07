import 'package:appointment/src/app/bloc/entity/entity_bloc.dart';
import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class EntityCreatePage extends StatefulWidget {
  const EntityCreatePage._(
    this.data,
    this.entity,
    this.onSuccess,
  );

  final Map<String, dynamic>? data;
  final configuration.Entity entity;
  final VoidCallback onSuccess;

  static Route<bool?> route({
    required configuration.Entity entity,
    Map<String, dynamic>? data,
    required VoidCallback onSuccess,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => EntityBloc(entity)),
        ],
        child: EntityCreatePage._(data, entity, onSuccess),
      ),
    );
  }

  @override
  State<EntityCreatePage> createState() => _EntityCreatePageState();
}

class _EntityCreatePageState extends State<EntityCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  late DataAction _action;

  @override
  void initState() {
    super.initState();

    for (final field in widget.entity.fields) {
      _controllers[field.reference] = TextEditingController();
    }

    _action = createOrEdit(widget.data);
    if (_action.isEdit) {
      for (final field in widget.entity.fields) {
        _controllers[field.reference]!.text =
            widget.data![field.reference].toString();
      }
    }
  }

  Map<String, dynamic> get _data {
    final data = <String, dynamic>{};
    for (final field in widget.entity.fields) {
      data[field.reference] = _controllers[field.reference]!.text;
    }
    return data;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late EntityEvent event;
      if (_action.isEdit) {
        event = EntityEvent.edit(data: _data);
      } else {
        event = EntityEvent.create(data: _data);
      }

      context.read<EntityBloc>().add(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    final coreEntity = widget.entity.coreEntity;
    return BlocListener<EntityBloc, EntityState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            widget.onSuccess();
            Toast(context).dataChanged(_action, coreEntity);
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
          entity: coreEntity,
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
      final fieldWidget =
          field.buildForm(_action, _controllers[field.reference]);

      children.addAll([
        if (!first) Gap(12),
        fieldWidget,
      ]);

      if (first) {
        first = false;
      }
    }
    return Column(children: children);
  }
}
