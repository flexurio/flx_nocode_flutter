import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/features/view/screen/widgets/view.dart';

@UseCase(name: 'Large Button', type: DView)
Widget buildDViewButtonLargeUseCase(BuildContext context) {
  // Mock EntityCustom
  final entity = EntityCustom.empty().copyWith(
    id: 'flx_users',
    label: 'User',
  );

  // Mock DView
  final dView = DView(
    id: 'view_users',
    label: 'User Details',
    entity: 'flx_users',
    filter: {},
  );

  // Mock data representing a single row/record
  final data = {
    'id': 1,
    'name': 'Antigravity AI',
    'email': 'ai@google.com',
  };

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Standard Button:'),
          const SizedBox(height: 8),
          dView.buttonLarge(
            context,
            data,
            [], // parentData
            true, // bypassPermission
            expanded: false,
            entityOverride: entity,
          ),
          const SizedBox(height: 24),
          const Text('Expanded Button:'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: dView.buttonLarge(
              context,
              data,
              [],
              true,
              expanded: true,
              entityOverride: entity,
            ),
          ),
        ],
      ),
    ),
  );
}

@UseCase(name: 'Loading', type: DView)
Widget buildDViewButtonLoadingUseCase(BuildContext context) {
  final dView = DView.empty();

  return Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Loading State (Normal):'),
          const SizedBox(height: 8),
          dView.buttonLarge(
            context,
            {},
            [],
            true,
            expanded: false,
            forceLoading: true,
          ),
          const SizedBox(height: 24),
          const Text('Loading State (Expanded):'),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: dView.buttonLarge(
              context,
              {},
              [],
              true,
              expanded: true,
              forceLoading: true,
            ),
          ),
        ],
      ),
    ),
  );
}
