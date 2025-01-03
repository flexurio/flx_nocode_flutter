import 'package:appointment/src/app/util/picker_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/bloc/recap_expired_product_query/recap_expired_product_query_bloc.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/permission.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_expired_product.dart';
import 'package:flexurio_chiron_product_stock/src/app/model/recap_product_expenditure.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecapExpiredProductExportExcelButton extends StatefulWidget {
  const RecapExpiredProductExportExcelButton({
    required this.dateExpired,
    required this.product,
    required this.division,
    super.key,
  });

  static Widget prepare(
    DateTime dateExpired,
    Product? product,
    Division division,
  ) {
    return BlocProvider(
      create: (context) => RecapExpiredProductQueryBloc(),
      child: RecapExpiredProductExportExcelButton(
        dateExpired: dateExpired,
        product: product,
        division: division,
      ),
    );
  }

  final DateTime dateExpired;
  final Division division;
  final Product? product;

  @override
  State<RecapExpiredProductExportExcelButton> createState() =>
      _RecapExpiredProductExportExcelButtonState();
}

class _RecapExpiredProductExportExcelButtonState
    extends State<RecapExpiredProductExportExcelButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RecapExpiredProductQueryBloc>();

    return BlocListener<RecapExpiredProductQueryBloc,
        RecapExpiredProductQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<RecapExpiredProduct>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'product_id'.tr(),
                  builder: (data, index) => data.product.id,
                ),
                TColumn(
                  title: 'product_name'.tr(),
                  builder: (data, index) => data.product.name,
                ),
                TColumn(
                  title: 'batch_no'.tr(),
                  builder: (data, index) => data.batchNoId,
                ),
                TColumn(
                  title: 'ending_balance'.tr(),
                  builder: (data, index) => data.endingBalance.format(),
                ),
                TColumn(
                  title: 'expired_date'.tr(),
                  builder: (data, index) => data.expiredDate.yMMMM,
                ),
                TColumn(
                  title: 'month'.tr(),
                  builder: (data, index) {
                    final now = DateTime.now();
                    final diff = data.expiredDate.difference(now).inDays;
                    final month = (diff / 30).ceil();
                    return month.toString();
                  },
                ),
              ],
            );
            saveFile(bytes, 'Recap_Expired_Product.xlsx');
          },
        );
      },
      child: BlocBuilder<RecapExpiredProductQueryBloc,
          RecapExpiredProductQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission:
                PermissionProductStock.recapExpiredProductExportExcel,
            onPressed: () {
              bloc.add(
                RecapExpiredProductQueryEvent.fetch(
                  dateExpired: widget.dateExpired,
                  division: widget.division,
                  product: widget.product,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
