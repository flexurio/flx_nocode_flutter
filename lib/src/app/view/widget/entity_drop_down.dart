import 'package:appointment/src/app/model/configuration.dart' as configuration;
import 'package:appointment/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:appointment/src/app/model/entity_field.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FDropDownSearchEntity extends StatefulWidget
    implements DropDownObject<Map<String, dynamic>> {
  const FDropDownSearchEntity({
    required this.onChanged,
    super.key,
    this.initialValue,
    this.isRequired = true,
    this.label,
    this.enabled = true,
    this.items,
    required this.entityField,
  });

  @override
  final Map<String, dynamic>? initialValue;

  @override
  final void Function(Map<String, dynamic>?) onChanged;

  @override
  final bool isRequired;

  @override
  final String? label;

  @override
  final bool enabled;

  final List<Map<String, dynamic>>? items;

  final EntityField entityField;

  @override
  State<FDropDownSearchEntity> createState() => _FDropDownSearchEntityState();
}

class _FDropDownSearchEntityState extends State<FDropDownSearchEntity> {
  EntityCustomQueryBloc? bloc;
  late configuration.Entity entity;
  late String keyId;
  late String value;
  late String entityId;

  @override
  void initState() {
    super.initState();
    final backendSource = widget.entityField.backendSource;
    entityId = backendSource.$1;
    keyId = backendSource.$2;
    value = backendSource.$3;
    () async {
      entity = (await configuration.Entity.getEntity(entityId))!;
      setState(() {
        bloc = EntityCustomQueryBloc(entity)
          ..add(EntityCustomQueryEvent.fetch());
      });
    }();
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) return const Center(child: CircularProgressIndicator());

    String? Function(Map<String, dynamic>?)? validator;
    if (widget.isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      bloc: bloc,
      builder: (context, state) {
        return FDropDownSearch<Map<String, dynamic>>(
          enabled: widget.enabled,
          labelText: entity.coreEntity.title,
          onChanged: widget.onChanged,
          initialValue: state.maybeWhen(
            orElse: () => null,
            loaded: (data) => data.data.firstWhere(
                (e) => e['id'].toString() == widget.initialValue?['id']),
          ),
          validator: validator,
          itemAsString: (data) => '${data[keyId]} - ${data[value]}',
          items: widget.items ??
              state.maybeWhen(
                orElse: () => [],
                loaded: (data) => data.data,
              ),
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
        );
      },
    );
  }
}
