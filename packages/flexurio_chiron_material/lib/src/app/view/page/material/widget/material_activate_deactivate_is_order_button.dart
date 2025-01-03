import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material/material_bloc.dart'
    as bloc;
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialActivateDeactivateIsOrderButton extends StatefulWidget {
  const MaterialActivateDeactivateIsOrderButton._({
    required this.material,
    required this.isExternal,
  });

  final model.Material material;
  final bool isExternal;

  static Widget prepare({
    required model.Material material,
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => bloc.MaterialBloc(),
      child: MaterialActivateDeactivateIsOrderButton._(
        material: material,
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialActivateDeactivateIsOrderButton> createState() =>
      _MaterialActivateDeactivateIsOrderButtonState();
}

class _MaterialActivateDeactivateIsOrderButtonState
    extends State<MaterialActivateDeactivateIsOrderButton> {
  late bool _isOrder;

  @override
  void initState() {
    _isOrder = widget.material.isOrder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget isOrder;
    if (UserRepositoryApp.instance.permissions.contains(
        PermissionMaterial.materialActivateOrder(
            isExternal: widget.isExternal))) {
      isOrder = CupertinoSwitch(
        value: _isOrder,
        onChanged: (_) async {
          final materialBloc = context.read<bloc.MaterialBloc>();
          final action = _isOrder ? DataAction.deactivate : DataAction.activate;
          await _showConfirmationDialog(context, materialBloc, action);
        },
      );
    } else {
      isOrder = BoolIcon(widget.material.isOrder);
    }
    return isOrder;
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    bloc.MaterialBloc materialBloc,
    DataAction action,
  ) {
    return showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return BlocListener<bloc.MaterialBloc, bloc.MaterialState>(
          bloc: materialBloc,
          listener: (context, state) {
            state.maybeWhen(
              success: () {
                Toast(context).dataChanged(action, Entity.material);
                Navigator.pop(context, true);
              },
              error: (error) => Toast(context).fail(error),
              orElse: () {},
            );
          },
          child: BlocBuilder<bloc.MaterialBloc, bloc.MaterialState>(
            bloc: materialBloc,
            builder: (context, state) {
              final isInProgress = state.maybeWhen(
                loading: () => true,
                orElse: () => false,
              );
              return CardConfirmation(
                isProgress: isInProgress,
                action: action,
                data: Entity.material,
                label: widget.material.name,
                onConfirm: () {
                  if (action == DataAction.activate) {
                    setState(() {
                      _isOrder = true;
                    });
                    materialBloc.add(
                      bloc.MaterialEvent.activateIsOrder(
                        material: widget.material,
                      ),
                    );
                  } else if (action == DataAction.deactivate) {
                    setState(() {
                      _isOrder = false;
                    });
                    materialBloc.add(
                      bloc.MaterialEvent.deactivateIsOrder(
                        material: widget.material,
                      ),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
