import 'package:flexurio_chiron_finance/src/app/bloc/currency_query/currency_query_bloc.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart' as model;
import 'package:flexurio_chiron_finance/src/app/view/page/currency/widget/create_button.dart';
import 'package:flexurio_chiron_finance/src/app/view/page/currency/widget/delete_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyDataTable extends StatelessWidget {
  const CurrencyDataTable({super.key});

  static Widget prepare() {
    return BlocProvider(
      create: (context) =>
          CurrencyQueryBloc()..add(const CurrencyQueryEvent.fetch()),
      child: const CurrencyDataTable(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrencyQueryBloc, CurrencyQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<model.Currency>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context
                .read<CurrencyQueryBloc>()
                .add(const CurrencyQueryEvent.fetch()),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              refreshButton,
              const CreateButton(),
            ],
            onChanged: (pageOptions) {
              context.read<CurrencyQueryBloc>().add(
                    CurrencyQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'id'.tr(),
                  backendColumn: 'id',
                ),
                body: (currency) => DataCell(
                  Text(currency.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: null,
                ),
                body: (currency) => DataCell(
                  Text(
                    currency.createdAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: null,
                ),
                body: (currency) => DataCell(
                  Text(
                    currency.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (currency) => DataCell(
                  Row(
                    children: [
                      DeleteButton.prepare(id: currency.id),
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
