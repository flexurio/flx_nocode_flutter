import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/entity.dart' as configuration;
import 'package:flx_nocode_flutter/src/app/model/entity_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/widget/form.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';

class EntityCreatePage extends StatefulWidget {
  const EntityCreatePage._({
    super.key,
    required this.data,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
    required this.autoBackWhenSuccess,
    this.filters = const {},
  });

  final Map<String, dynamic>? data;
  final configuration.EntityCustom entity;
  final VoidCallback onSuccess;
  final Map<String, dynamic> filters;
  final bool embedded;
  final bool autoBackWhenSuccess;

  static Widget prepare({
    Key? key,
    required configuration.EntityCustom entity,
    Map<String, dynamic>? data,
    required VoidCallback onSuccess,
    required bool embedded,
    Map<String, dynamic> filters = const {},
    bool autoBackWhenSuccess = true,
  }) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => EntityBloc(entity))],
      child: EntityCreatePage._(
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        key: key,
        filters: filters,
        autoBackWhenSuccess: autoBackWhenSuccess,
      ),
    );
  }

  static Route<bool?> route({
    required configuration.EntityCustom entity,
    Map<String, dynamic>? data,
    required VoidCallback onSuccess,
    required bool embedded,
    required Map<String, dynamic> filters,
    bool autoBackWhenSuccess = true,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: EntityCreatePage.prepare(
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        filters: filters,
        autoBackWhenSuccess: autoBackWhenSuccess,
      ),
    );
  }

  @override
  State<EntityCreatePage> createState() => _EntityCreatePageState();
}

class _EntityCreatePageState extends State<EntityCreatePage> {
  final _formKey = GlobalKey<FormState>();
  var _controllers = <String, TextEditingController>{};
  late DataAction _action;

  @override
  void initState() {
    super.initState();

    _controllers = widget.entity.fields.generateControllers();

    _action = createOrEdit(widget.data);
    if (_action.isEdit) {
      for (final field in widget.entity.fields) {
        _controllers[field.reference]!.text =
            widget.data![field.reference] is num
                ? (widget.data![field.reference] as num).toStringAsFixed(0)
                : widget.data![field.reference].toString();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final coreEntity = widget.entity.coreEntity;
    return BlocListener<EntityBloc, EntityState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (_) {
            widget.onSuccess();
            Toast(context).dataChanged(_action, coreEntity);
            if (widget.autoBackWhenSuccess) Navigator.pop(context, true);
          },
          error: (error) => Toast(context).fail(error),
          orElse: () {},
        );
      },
      child: widget.embedded
          ? _buildFormEmbedded(
              theme: theme,
              coreEntity: coreEntity,
            )
          : _buildForm(
              theme: theme,
              coreEntity: coreEntity,
            ),
    );
  }

  Widget _buildFormEmbedded({
    required ThemeData theme,
    required Entity coreEntity,
  }) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              EntityCreateForm(
                entity: widget.entity,
                dataAction: _action,
                controllers: _controllers,
              ),
              Gap(24),
              Row(
                children: [Expanded(child: _buildButtonSubmit())],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm({required ThemeData theme, required Entity coreEntity}) {
    return Scaffold(
      appBar: widget.embedded ? _buildAppBar(context) : null,
      backgroundColor: widget.embedded ? theme.cardColor : Colors.transparent,
      body: SingleFormPanel(
        hideHeader: widget.embedded ? true : false,
        formKey: _formKey,
        action: _action,
        entity: coreEntity,
        actions: [_buildButtonSubmit()],
        children: [
          EntityCreateForm(
            entity: widget.entity,
            dataAction: _action,
            controllers: _controllers,
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      title: Text('${_action.title} ${widget.entity.coreEntity.title}'),
      backgroundColor: theme.scaffoldBackgroundColor,
    );
  }

  Map<String, dynamic> get _data {
    final data = <String, dynamic>{};
    for (final field in widget.entity.fields) {
      if (field.reference != 'id' && (field.autoGenerated ?? false)) {
        continue;
      }

      var value = _controllers[field.reference]!.text;
      if (field.isDateTime) {
        print(
          '[EntityCreatePage] reference: ${field.reference}, value: $value',
        );
        value = DateFormat('yMMMMd').parse(value).toUtcIso();
      }
      data[field.reference] = value;
    }
    return data;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      late EntityEvent event;
      if (_action.isEdit) {
        event = EntityEvent.edit(data: _data, filters: widget.filters);
      } else {
        event = EntityEvent.create(data: _data, filters: widget.filters);
      }

      context.read<EntityBloc>().add(event);
    }
  }

  Widget _buildButtonSubmit() {
    return BlocBuilder<EntityBloc, EntityState>(
      builder: (context, state) {
        return Button.action(
          permission: null,
          isInProgress: state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          ),
          onPressed: _submit,
          action: _action,
        );
      },
    );
  }
}
