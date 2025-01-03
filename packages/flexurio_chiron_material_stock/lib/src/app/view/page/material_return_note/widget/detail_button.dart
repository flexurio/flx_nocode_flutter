import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note_detail/material_return_note_detail_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReturnNoteDetailButton extends StatelessWidget {
  const MaterialReturnNoteDetailButton({
    required this.materialReturnNote,
    super.key,
  });

  final MaterialReturnNote materialReturnNote;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.viewDetail,
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialReturnNoteDetailPage.route(
            materialReturnNote: materialReturnNote,
          ),
        );
      },
    );
  }
}
