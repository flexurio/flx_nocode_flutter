import 'package:flexurio_chiron_business_trip/src/app/bloc/fuel_query/fuel_query_bloc.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/fuel.dart';
import 'package:appointment/src/app/view/widget/data_table_set_2.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FuelHistoryTable extends StatefulWidget {
  const FuelHistoryTable({required this.fuel, super.key});

  static Widget prepare({required Fuel fuel}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FuelQueryBloc()..add(FuelQueryEvent.historyFetch(fuel: fuel)),
        ),
      ],
      child: FuelHistoryTable(
        fuel: fuel,
      ),
    );
  }

  final Fuel fuel;

  @override
  State<FuelHistoryTable> createState() => _FuelHistoryTableState();
}

class _FuelHistoryTableState extends State<FuelHistoryTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FuelQueryBloc, FuelQueryState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 100),
          child: SingleFormPanel(
            action: DataAction.view,
            entity: Entity.fuelHistory,
            size: SingleFormPanelSize.large,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DataTableSet2<Fuel>(
                  status: state.maybeWhen(
                    loading: () => Status.progress,
                    loaded: (_) => Status.loaded,
                    orElse: () => Status.error,
                  ),
                  onRefresh: () => context.read<FuelQueryBloc>().add(
                        const FuelQueryEvent.fetch(),
                      ),
                  key: ValueKey(state.hashCode),
                  data: state.maybeWhen(
                    loaded: (fuel) {
                      return fuel;
                    },
                    orElse: () => [],
                  ),
                  title: Entity.fuelHistory.title,
                  search: (fuel) => [
                    fuel.name,
                    fuel.brand,
                    fuel.typeFuel,
                    fuel.price.toString(),
                  ],
                  actionRight: (refreshButton) => [
                    refreshButton,
                  ],
                  columns: [
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('ID'),
                        sortNum: (fuel) => fuel.id,
                      ),
                      body: (fuel) => DataCell(
                        Text(fuel.id.toString()),
                      ),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('Name'),
                        sortString: (fuel) => fuel.name,
                      ),
                      body: (fuel) => DataCell(Text(fuel.name)),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('Price'),
                        sortNum: (fuel) => fuel.price,
                      ),
                      body: (fuel) => DataCell(Text(fuel.price.toString())),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('Start Date'),
                        sortString: (fuel) => fuel.startDate.yMMMMd,
                      ),
                      body: (fuel) => DataCell(
                        Text(DateFormat('y-MM-dd').format(fuel.startDate)),
                      ),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('End Date'),
                        sortString: (fuel) => fuel.endDate.yMMMMd,
                      ),
                      body: (fuel) => DataCell(
                        Text(DateFormat('y-MM-dd').format(fuel.endDate)),
                      ),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('Type Fuel'),
                        sortString: (fuel) => fuel.typeFuel,
                      ),
                      body: (fuel) => DataCell(Text(fuel.typeFuel)),
                    ),
                    DTColumnXX(
                      head: DTHeadXX(
                        label: const Text('Brand'),
                        sortString: (fuel) => fuel.brand,
                      ),
                      body: (fuel) => DataCell(Text(fuel.brand)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
