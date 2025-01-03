import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/budget_type_create_page.dart';
import 'package:flexurio_chiron_accounting/src/app/view/page/budget_type/widget/budget_type_data_table.dart';
import 'package:flexurio_erp_core/constant/size.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class NewTypeButton extends StatefulWidget {
  const NewTypeButton({
    required this.indentation,
    required this.parents,
    required this.isLastIndex,
    required this.isNameColumn,
    required this.hoverValue,
    super.key,
    this.onCreate,
    this.onHover,
  });
  final int indentation;
  final List<BudgetType> parents;
  final bool isLastIndex;
  final bool isNameColumn;
  final void Function()? onCreate;
  final void Function(bool)? onHover;
  final ValueKey<String>? hoverValue;

  @override
  State<NewTypeButton> createState() => NewTypeButtonState();
}

class NewTypeButtonState extends State<NewTypeButton> {
  @override
  Widget build(BuildContext context) {
    final isHovered = widget.key == widget.hoverValue;
    return InkWell(
      onHover: (value) {
        widget.onHover?.call(value);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<bool?>(
            builder: (context) => BudgetTypeCreatePage.prepare(
              parents: widget.parents,
            ),
          ),
        ).then((value) {
          if ((value ?? false) && mounted) {
            widget.onCreate?.call();
          }
        });
      },
      child: widget.isNameColumn
          ? Stack(
              children: [
                buildCell(
                  color: isHovered ? Colors.grey.shade200 : null,
                  indentation: paddingHorizontalPage * widget.indentation,
                  value: const Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add New Type',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                buildPathLine(
                  context,
                  widget.indentation == 3 && !widget.isLastIndex,
                  paddingHorizontalPage + 12,
                  null,
                  2,
                  50,
                ),
              ],
            )
          : buildCell(
              color: isHovered ? Colors.grey.shade200 : null,
              value: const SizedBox.shrink(),
            ),
    );
  }
}
