import 'package:flexurio_chiron_finance/src/app/bloc/rate_query/rate_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart' as model;
import 'package:flexurio_chiron_finance/src/app/view/page/rate/widget/create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/rate/widget/delete_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateDataTable extends StatelessWidget {
  const RateDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (_) => RateQueryBloc()..add(const RateQueryEvent.fetch()),
      child: const RateDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateQueryBloc, RateQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.Rate>(
            onRefresh: () =>
                context.read<RateQueryBloc>().add(const RateQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateButton(),
            ],
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            onChanged: (pageOptions) {
              context.read<RateQueryBloc>().add(
                    RateQueryEvent.fetch(pageOptions: pageOptions),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'currency'.tr(),
                  backendColumn: 'Currency.id',
                ),
                body: (rate) => DataCell(
                  Text(rate.currency.id),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'rate_date'.tr(),
                  backendColumn: 'rates.validity_date',
                ),
                body: (rate) => DataCell(
                  Text(rate.validityDate.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'rate'.tr(),
                  backendColumn: 'rates.rate',
                  numeric: true,
                ),
                body: (rate) => DataCell(
                  Text(rate.rate.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (rate) => DataCell(
                  Text(rate.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (rate) => DataCell(
                  GetNameUser(userId: rate.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (rate) => DataCell(
                  Row(
                    children: [DeleteButton.prepare(rate: rate)],
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
