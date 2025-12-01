import 'package:flutter/material.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/entity/models/group_layout.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/enitty_create_form/controller.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_form_widgets.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:gap/gap.dart';

/// This widget is responsible for rendering a group of fields arranged in rows.
/// The layout is dynamic based on RowLayout and reactive to formState changes.
class RowBuilder extends StatelessWidget {
  const RowBuilder({
    super.key,
    required this.row,
    required this.entity,
    required this.dataAction,
    required this.controllers,
    required this.formState,
    required this.parentData,
  });

  // Layout configuration for this row
  final RowLayout row;

  // Entity definition containing fields metadata
  final EntityCustom entity;

  // Action type: create/update/view
  final DataAction dataAction;

  // Controllers for field inputs
  final Map<String, TextEditingController> controllers;

  // Reactive form state controller
  final FormStateController formState;

  // Additional context for child fields
  final List<Map<String, dynamic>> parentData;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: formState, // Rebuild when form state changes
      builder: (context, _) {
        final state = formState.state;

        // If row is not visible based on current state, render nothing
        if (!row.isVisible(state)) {
          return const SizedBox.shrink();
        }

        // Number of columns; fallback to 1 if invalid
        final columns = (row.columns <= 0) ? 1 : row.columns;

        // List to store all field widgets
        final fieldWidgets = <Widget>[];

        // Build each field widget based on the field keys configured in RowLayout
        for (final key in row.fields) {
          final field = entity.getField(key); // Fetch field definition
          final controller = controllers[key]; // Fetch field controller

          if (field != null && controller != null) {
            // Build the form widget for this field
            fieldWidgets.add(
              field.buildForm(dataAction, controller, parentData),
            );
          } else if (field == null) {
            // Add error widget if field metadata is missing
            fieldWidgets.add(Text('Error: field "$key" not found'));
          } else {
            // Add error widget if controller is missing
            fieldWidgets.add(Text('Error: controller for "$key" not found'));
          }
        }

        // Split field widgets into chunked rows based on number of columns
        final rows = <List<Widget>>[];
        for (var i = 0; i < fieldWidgets.length; i += columns) {
          final end = (i + columns < fieldWidgets.length)
              ? i + columns
              : fieldWidgets.length;

          // Get the subset of widgets for this row
          final chunk = fieldWidgets.sublist(i, end);

          // If last row has fewer items, fill empty slots with SizedBox
          while (chunk.length < columns) {
            chunk.add(const SizedBox.shrink());
          }

          // Wrap each widget inside a Column for consistent vertical alignment
          final wrappedCols = chunk
              .map(
                (w) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [w],
                ),
              )
              .toList();

          rows.add(wrappedCols);
        }

        // Render the final layout: multiple RowFields stacked vertically
        return Column(
          children: [
            for (var i = 0; i < rows.length; i++) ...[
              RowFields(children: rows[i]), // Render each row
              if (i < rows.length - 1) const Gap(12), // Spacing between rows
            ],
          ],
        );
      },
    );
  }
}
