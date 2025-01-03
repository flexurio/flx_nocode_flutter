import 'package:flexurio_chiron_company/src/app/bloc/office_query/office_query_bloc.dart';
import 'package:flexurio_chiron_company/src/app/model/office.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_create_button.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_delete_button.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_update_button.dart';
import 'package:flexurio_chiron_company/src/app/view/page/office/widget/office_users_button.dart';
import 'package:appointment/src/app/view/widget/data_table_set.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfficeDataTable extends StatelessWidget {
  const OfficeDataTable._();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              OfficeQueryBloc()..add(const OfficeQueryEvent.fetch()),
        ),
      ],
      child: const OfficeDataTable._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OfficeQueryBloc, OfficeQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableSetJanganDipakaiLagi<Office>(
            isError: state.maybeWhen(error: (_) => true, orElse: () => false),
            onRefresh: () => context
                .read<OfficeQueryBloc>()
                .add(const OfficeQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            isProgress: state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ),
            data: state.maybeWhen(
              loaded: (tickets) {
                return tickets;
              },
              orElse: () => [],
            ),
            title: 'Office',
            search: (office) => [
              office.name,
              office.address,
              office.latitude.toString(),
              office.longitude.toString(),
              office.radius.toString(),
            ],
            actionRight: const [
              OfficeCreateButton(),
            ],
            columns: [
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Name'),
                  sortString: (office) => office.name,
                ),
                body: (office) => DataCell(
                  Text(office.name),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Description'),
                  sortString: (office) => office.description,
                ),
                body: (office) => DataCell(
                  Text(office.description),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Radius'),
                  sortNum: (office) => office.radius,
                ),
                body: (office) => DataCell(
                  Text('${office.radius} m'),
                ),
              ),
              // DTColumn(
              //   head: DTHead(
              //     label: const Text('Address'),
              //     sortString: (office) => office.address,
              //   ),
              //   body: (office) => DataCell(
              //     Text(office.address),
              //   ),
              // ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Coordinate'),
                  sortString: (office) =>
                      '${office.latitude} ${office.longitude}',
                ),
                body: (office) => DataCell(
                  Text('${office.latitude},${office.longitude}'),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: Text('created_at'.tr()),
                  sortNum: (office) => office.createdAt.millisecond,
                ),
                body: (office) => DataCell(
                  Text(
                    office.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnX(
                head: DTHeadX(
                  label: const Text('Updated At'),
                  sortNum: (office) => office.updatedAt.millisecond,
                ),
                body: (office) => DataCell(
                  Text(
                    office.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumnX(
                head: const DTHeadX(
                  label: Text('Actions'),
                ),
                body: (office) => DataCell(
                  Row(
                    children: [
                      OfficeUsersButton.prepare(office: office),
                      OfficeUpdateButton(office: office),
                      OfficeDeleteButton.prepare(id: office.id),
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
