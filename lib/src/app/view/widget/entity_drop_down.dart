import 'package:flexurio_no_code/src/app/model/entity.dart' as configuration;
import 'package:flexurio_no_code/src/app/bloc/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flexurio_no_code/src/app/model/entity_field.dart';
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
    required this.itemAsString,
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

  final String Function(String id, dynamic label) itemAsString;

  @override
  State<FDropDownSearchEntity> createState() => _FDropDownSearchEntityState();
}

class _FDropDownSearchEntityState extends State<FDropDownSearchEntity> {
  EntityCustomQueryBloc? bloc;
  configuration.EntityCustom? entity;
  late String keyId;
  late String value;
  late String entityId;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    final backendSource = widget.entityField.backendSource;
    entityId = backendSource.$1;
    keyId = backendSource.$2;
    value = backendSource.$3;
    () async {
      entity = (await configuration.EntityCustom.getEntity(entityId));
      if (entity != null) {
        bloc = EntityCustomQueryBloc(entity!)
          ..add(EntityCustomQueryEvent.fetch());
      } else {
        errorMessage = 'Entity ${entityId} not found!';
      }
      setState(() {});
    }();
  }

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    } else if (bloc == null) {
      return const Center(child: CircularProgressIndicator());
    }

    String? Function(Map<String, dynamic>?)? validator;
    if (widget.isRequired) {
      validator = requiredObjectValidator.call;
    }

    return BlocBuilder<EntityCustomQueryBloc, EntityCustomQueryState>(
      bloc: bloc,
      builder: (context, state) {
        return FDropDownSearch<Map<String, dynamic>>(
          enabled: widget.enabled,
          labelText: entity!.coreEntity.title,
          onChanged: widget.onChanged,
          initialValue: widget.initialValue == null
              ? null
              : state.maybeWhen(
                  orElse: () => null,
                  loaded: (data) => data.data.firstWhere(
                      (e) => e['id'].toString() == widget.initialValue?['id']),
                ),
          validator: validator,
          itemAsString: (data) => widget.itemAsString(data[keyId], data[value]),
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
