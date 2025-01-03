import 'package:flexurio_chiron_vendor/src/app/bloc/supplier_query/supplier_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_vendor/src/app/view/page/supplier/util/excel_supplier.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SupplierExportExcelButton extends StatelessWidget {
  const SupplierExportExcelButton({
    super.key,
  });

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SupplierQueryBloc(),
        ),
      ],
      child: const SupplierExportExcelButton(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SupplierQueryBloc>();
    return BlocListener<SupplierQueryBloc, SupplierQueryState>(
      bloc: bloc,
      listener: (context, state) async {
        state.maybeWhen(
          orElse: () {},
          error: (error) => Toast(context).fail(error),
          loaded: (supplier) async {
            final bytes = excelSupplier(supplier.data);
            final format = DateFormat(DateFormat.YEAR_NUM_MONTH_DAY);
            final date = DateTime.now();
            final dateNow = format.format(date);
            saveFile(
              bytes,
              'Supplier_$dateNow.xlsx'.replaceAll('/', '-'),
            );
          },
        );
      },
      child: BlocBuilder<SupplierQueryBloc, SupplierQueryState>(
        bloc: bloc,
        builder: (context, state) {
          return LightButtonSmall(
            permission: Permission.supplierExportExcel,
            action: DataAction.exportExcel,
            onPressed: () async {
              context.read<SupplierQueryBloc>().add( 
                SupplierQueryEvent.fetch(
                  pageOptions: PageOptions.emptyNoLimit(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
