import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BudgetTypeEditButton extends StatefulWidget {
  const BudgetTypeEditButton({
    required this.parents,
    required this.budgetType,
    super.key,
  });
  final List<BudgetType> parents;
  final BudgetType budgetType;

  @override
  State<BudgetTypeEditButton> createState() => _BudgetTypeEditButtonState();
}

class _BudgetTypeEditButtonState extends State<BudgetTypeEditButton> {
  late List<BudgetType> _parents;
  @override
  void initState() {
    if (widget.parents.length >= 2) {
      _parents = widget.parents..remove(widget.budgetType);
    } else {
      _parents = widget.parents;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BudgetTypeQueryBloc>();
    return IconButtonSmall(
      permission: PermissionAccounting.budgetTypeEdit,
      action: DataAction.edit,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => BudgetTypeCreatePage.prepare(
              parents: _parents,
              budgetType: widget.budgetType,
            ),
          ),
        ).then((value) {
          if ((value ?? false) && mounted) {
            bloc.add(const BudgetTypeQueryEvent.fetch());
          }
        });
      },
    );
  }
}
