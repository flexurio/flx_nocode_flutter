import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_note_query/material_return_note_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note/widget/view_page.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialReturnNoteViewButton extends StatelessWidget {
  const MaterialReturnNoteViewButton({
    required this.materialReturnNote,
    super.key,
  });

  final MaterialReturnNote materialReturnNote;

  @override
  Widget build(BuildContext context) {
    return IconButtonSmall(
      permission: null,
      action: DataAction.view,
      onPressed: () {
        Navigator.push(
          context,
          MaterialReturnNoteViewPage.route(
            materialReturnNote: materialReturnNote,
          ),
        ).then((value) {
          if (value ?? false) {
            context
                .read<MaterialReturnNoteQueryBloc>()
                .add(const MaterialReturnNoteQueryEvent.fetch());
          }
        });
      },
    );
  }
}
