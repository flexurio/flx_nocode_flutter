import 'package:flexurio_chiron_accounting/src/app/bloc/asset_location_query/asset_location_query_bloc.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:appointment/src/app/view/widget/drop_down_items/asset_location.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CardConfirmationMoving extends StatefulWidget {
  const CardConfirmationMoving({
    required this.isProgress,
    required this.action,
    required this.data,
    required this.label,
    required this.onConfirm,
    super.key,
  });

  static Widget prepare({
    required bool isProgress,
    required DataAction action,
    required Entity data,
    required String label,
    required void Function(AssetLocation assetLocation) onConfirm,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AssetLocationQueryBloc()
            ..add(
              AssetLocationQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ),
            ),
        ),
      ],
      child: CardConfirmationMoving(
        isProgress: isProgress,
        action: action,
        data: data,
        label: label,
        onConfirm: onConfirm,
      ),
    );
  }

  final bool isProgress;
  final DataAction action;
  final Entity data;
  final String label;
  final void Function(AssetLocation assetLocation) onConfirm;

  @override
  State<CardConfirmationMoving> createState() => _CardConfirmationMovingState();
}

class _CardConfirmationMovingState extends State<CardConfirmationMoving> {
  final _formKey = GlobalKey<FormState>();
  AssetLocation? _assetLocation;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConfirm(_assetLocation!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return Form(
      key: _formKey,
      child: CardForm(
        popup: true,
        title: 'are_you_sure'.tr(),
        icon: FontAwesomeIcons.exclamationTriangle,
        actions: [
          Button(
            permission: null,
            isSecondary: true,
            isInProgress: widget.isProgress,
            onPressed: () {
              Navigator.pop(context);
            },
            action: DataAction.cancel,
          ),
          const SizedBox(width: 10),
          Button(
            permission: null,
            color: primaryColor,
            isInProgress: widget.isProgress,
            onPressed: _submit,
            action: widget.action,
          ),
        ],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(confirmationMessage(widget.data, widget.action, widget.label)),
            const Gap(24),
            FDropDownSearchAssetLocation(
              onChanged: (assetLocation) {
                _assetLocation = assetLocation;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
