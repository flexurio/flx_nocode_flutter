import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

import 'package:flx_nocode_flutter/features/layout_form/screen/widgets/entity_create_view.dart';
import 'package:flx_nocode_flutter/src/app/bloc/entity/entity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/error.dart';
import 'package:page_transition/page_transition.dart';

class CreatePage extends StatelessWidget {
  const CreatePage._({
    super.key,
    required this.data,
    required this.entity,
    required this.onSuccess,
    required this.embedded,
    required this.autoBackWhenSuccess,
    this.filters = const {},
    required this.noHeader,
    required this.layoutFormId,
    required this.parentData,
    this.popup = false,
    this.width,
  });

  final Map<String, dynamic>? data;
  final List<Map<String, dynamic>> parentData;
  final EntityCustom entity;
  final VoidCallback onSuccess;
  final Map<String, dynamic> filters;
  final bool embedded;
  final bool autoBackWhenSuccess;
  final bool noHeader;
  final String layoutFormId;
  final bool popup;
  final double? width;

  static Widget prepare({
    Key? key,
    bool autoBackWhenSuccess = true,
    bool noHeader = false,
    Map<String, dynamic> filters = const {},
    Map<String, dynamic>? data,
    required bool embedded,
    required EntityCustom entity,
    required String layoutFormId,
    required List<Map<String, dynamic>> parentData,
    required VoidCallback onSuccess,
    Configuration? configuration,
    bool popup = false,
    double? width,
  }) {
    if (configuration != null) {
      Configuration.instance = configuration;
      flavorConfig = configuration.flavorConfig;
    }
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => EntityBloc(entity))],
      child: CreatePage._(
        parentData: parentData,
        layoutFormId: layoutFormId,
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        key: key,
        filters: filters,
        noHeader: noHeader,
        autoBackWhenSuccess: autoBackWhenSuccess,
        popup: popup,
        width: width,
      ),
    );
  }

  static Route<bool?> route({
    required String layoutFormId,
    required EntityCustom entity,
    Map<String, dynamic>? data,
    required VoidCallback onSuccess,
    required bool embedded,
    required Map<String, dynamic> filters,
    required List<Map<String, dynamic>> parentData,
    bool autoBackWhenSuccess = true,
    bool popup = false,
    double? width,
  }) {
    print('CreatePage.route: layoutFormId: $layoutFormId');
    return PageTransition(
      opaque: true,
      type: PageTransitionType.rightToLeft,
      child: CreatePage.prepare(
        parentData: parentData,
        layoutFormId: layoutFormId,
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        filters: filters,
        autoBackWhenSuccess: autoBackWhenSuccess,
        popup: popup,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    try {
      final layoutForm = entity.layoutForm.firstWhere(
        (e) => e.id == layoutFormId,
      );

      return CreateForm(
        parentData: parentData,
        layoutForm: layoutForm,
        data: data,
        entity: entity,
        onSuccess: onSuccess,
        embedded: embedded,
        filters: filters,
        noHeader: noHeader,
        autoBackWhenSuccess: autoBackWhenSuccess,
        popup: popup,
        width: width,
      );
    } catch (e) {
      return Scaffold(
        body: NoCodeError(
          'Layout Form Not Found',
          description: 'Could not find layout form with id: $layoutFormId',
          suggestion: 'Check your entity configuration.',
          debugInfo: 'ID: $layoutFormId',
        ),
      );
    }
  }
}
