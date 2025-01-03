import 'package:flexurio_chiron_vendor/src/app/bloc/material_approve_vendor_query/material_approve_vendor_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_group_query/material_group_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/bloc/material_query/material_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/view/page/material/widget/material_data_table.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MaterialPage extends StatelessWidget {
  const MaterialPage({
    super.key,
    required this.isExternal,
  });

  final bool isExternal;

  static Widget prepare({required bool isExternal}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc(isExternal: isExternal)
            ..add(const MaterialQueryEvent.fetch()),
        ),
        BlocProvider(
          create: (context) => MaterialGroupQueryBloc()
            ..add(MaterialGroupQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
        BlocProvider(
          create: (context) => MaterialApproveVendorQueryBloc()
            ..add(MaterialApproveVendorQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit(),
            )),
        ),
      ],
      child: MaterialPage(isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      children: [
        TitlePage(
          entity: Entity.material,
          suffixText: isExternal ? ' External' : null,
        ),
        const Gap(12),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: MaterialDataTable(isExternal: isExternal),
        ),
      ],
    );
  }
}
