import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/layout_form/models/layout_form.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flx_nocode_flutter/src/app/view/page/entity_create/entity_create_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';
import 'package:page_transition/page_transition.dart';

class EntityCreatePage extends StatelessWidget {
  const EntityCreatePage._({
    super.key,
    required this.data,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
    required this.autoBackWhenSuccess,
    this.filters = const {},
    required this.noHeader,
    required this.layoutForm,
    required this.parentData,
  });

  final Map<String, dynamic>? data;
  final List<Map<String, dynamic>> parentData;
  final EntityCustom entity;
  final VoidCallback onSuccess;
  final Map<String, dynamic> filters;
  final bool embedded;
  final bool autoBackWhenSuccess;
  final bool noHeader;
  final LayoutForm layoutForm;

  static Widget prepare({
    Key? key,
    bool autoBackWhenSuccess = true,
    bool noHeader = false,
    Map<String, dynamic> filters = const {},
    Map<String, dynamic>? data,
    required bool embedded,
    required EntityCustom entity,
    required LayoutForm? layoutForm,
    required List<Map<String, dynamic>> parentData,
    required VoidCallback onSuccess,
  }) {
    if (layoutForm == null) {
      return NoCodeError(
        'Missing Layout Form',
        description:
            'A layout form is required to render the entity creation page.',
        suggestion: 'Please provide a valid LayoutForm object.',
        debugInfo: 'layoutForm was null in EntityCreatePage.prepare',
      );
    }

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => EntityBloc(entity))],
      child: EntityCreatePage._(
        parentData: parentData,
        layoutForm: layoutForm,
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        key: key,
        filters: filters,
        noHeader: noHeader,
        autoBackWhenSuccess: autoBackWhenSuccess,
      ),
    );
  }

  static Route<bool?> route({
    required LayoutForm layoutForm,
    required EntityCustom entity,
    Map<String, dynamic>? data,
    required VoidCallback onSuccess,
    required bool embedded,
    required Map<String, dynamic> filters,
    required List<Map<String, dynamic>> parentData,
    bool autoBackWhenSuccess = true,
  }) {
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: EntityCreatePage.prepare(
        parentData: parentData,
        layoutForm: layoutForm,
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
  Widget build(BuildContext context) {
    return EntityCreateView(
      parentData: parentData,
      layoutForm: layoutForm,
      data: data,
      entity: entity,
      onSuccess: onSuccess,
      embedded: embedded,
      filters: filters,
      noHeader: noHeader,
      autoBackWhenSuccess: autoBackWhenSuccess,
    );
  }
}
