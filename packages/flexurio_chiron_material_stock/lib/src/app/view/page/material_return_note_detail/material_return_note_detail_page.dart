import 'package:flexurio_chiron_material_stock/src/app/model/material_return_note.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note_detail/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

class MaterialReturnNoteDetailPage extends StatelessWidget {
  const MaterialReturnNoteDetailPage({
    required this.materialReturnNote,
    super.key,
  });

  final MaterialReturnNote materialReturnNote;

  static Route<void> route({
    required MaterialReturnNote materialReturnNote,
  }) {
    return MaterialPageRoute(
      builder: (context) => MaterialReturnNoteDetailPage(
        materialReturnNote: materialReturnNote,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Row(
            children: [
              BackButton(),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitlePage(entity: Entity.materialReturnNoteDetail),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialReturnNoteDetailDataTable.prepare(
                        materialReturnNote: materialReturnNote,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
