import 'package:flexurio_chiron_material/src/app/bloc/unit_convert_query/unit_convert_query_bloc.dart';
import 'package:flexurio_chiron_material/src/app/model/unit_convert.dart';
import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/widget/create_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/widget/delete_button.dart';
import 'package:flexurio_chiron_material/src/app/view/page/unit_convert/widget/edit_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnitConvertDataTable extends StatelessWidget {
  const UnitConvertDataTable({required this.unit, super.key});

  final MaterialUnit unit;

  static Widget prepare({
    required MaterialUnit unit,
  }) {
    return BlocProvider(
      create: (context) => UnitConvertQueryBloc()
        ..add(
          UnitConvertQueryEvent.fetch(
            unitFrom: unit,
            unitTo: MaterialUnit.empty(),
          ),
        ),
      child: UnitConvertDataTable(
        unit: unit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitConvertQueryBloc, UnitConvertQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<UnitConvert>(
            onChanged: (pageOptions) {
              context
                  .read<UnitConvertQueryBloc>()
                  .add(UnitConvertQueryEvent.fetch(
                    unitFrom: unit,
                    unitTo: MaterialUnit.empty(),
                    pageOptions: pageOptions,
                  ));
            },
            status: state.maybeWhen(
              orElse: () => Status.progress,
              loaded: (_) => Status.loaded,
              error: (e) => Status.error,
            ),
            pageOptions: state.maybeWhen(
              orElse: PageOptions.empty,
              load: (pageOptions) => pageOptions,
              loading: (pageOptions) => pageOptions,
            ),
            key: ValueKey(state.hashCode),
            actionRight: (refresh) => [
              UnitConvertCreateButton(unit: unit),
            ],
            onRefresh: () => context.read<UnitConvertQueryBloc>().add(
                  UnitConvertQueryEvent.fetch(
                    unitFrom: unit,
                    unitTo: MaterialUnit.empty(),
                  ),
                ),
            columns: [
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'converted_unit.id',
                  label: 'id_convert'.tr(),
                ),
                body: (unitConvert) => DataCell(
                  Text(unitConvert.convertUnit.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'formula',
                  label: 'Formula',
                ),
                body: (unitConvert) => DataCell(
                  Text(unitConvert.formula),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (unitConvert) => DataCell(
                  Text(unitConvert.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'updated_at',
                  label: 'updated_at'.tr(),
                ),
                body: (unitConvert) => DataCell(
                  Text(unitConvert.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: null,
                  label: 'actions'.tr(),
                ),
                body: (unitConvert) => DataCell(
                  Row(
                    children: [
                      UnitConvertEditButton(
                        unit: unit,
                        unitConvert: unitConvert,
                      ),
                      UnitConvertDeleteButton.prepare(
                        unitConvert: unitConvert,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
