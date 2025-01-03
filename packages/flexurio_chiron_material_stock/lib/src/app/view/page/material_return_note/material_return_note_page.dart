import 'package:flexurio_chiron_material_stock/src/app/bloc/material_return_note_query/material_return_note_query_bloc.dart';
import 'package:flexurio_chiron_material_stock/src/app/view/page/material_return_note/widget/data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialReturnNotePage extends StatelessWidget {
  const MaterialReturnNotePage({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) => MaterialReturnNoteQueryBloc()
        ..add(
          const MaterialReturnNoteQueryEvent.fetch(),
        ),
      child: const MaterialReturnNotePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(entity: Entity.materialReturnNote),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const MaterialReturnNoteDataTable(),
        ),
      ],
    );
  }
}
