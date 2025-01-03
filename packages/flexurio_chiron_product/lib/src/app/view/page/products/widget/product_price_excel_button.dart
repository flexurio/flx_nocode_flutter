import 'package:flexurio_chiron_product/src/app/bloc/product_price_query/product_price_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product_price.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductPriceExportExcelButton extends StatelessWidget {
  const ProductPriceExportExcelButton({super.key, required this.isExternal});

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductPriceQueryBloc(),
      child: ProductPriceExportExcelButton(
        isExternal: isExternal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductPriceQueryBloc, ProductPriceQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<ProductPrice>(
              context: context,
              data: pageOptions,
              columns: [
                TColumn(
                  title: 'id'.tr(),
                  builder: (data, index) => data.product.id,
                ),
                TColumn(
                  title: 'no'.tr(),
                  builder: (data, index) => data.product.productNo,
                ),
                TColumn(
                  title: 'name'.tr(),
                  builder: (data, index) => data.product.name,
                ),
                TColumn(
                  title: 'product_group'.tr(),
                  builder: (data, index) => data.product.productGroup.id,
                ),
                TColumn(
                  title: 'start_date'.tr(),
                  builder: (data, index) => data.startDate.yMMMMd,
                ),
                TColumn(
                  title: 'price'.tr(),
                  builder: (data, index) => data.price.format(),
                ),
                TColumn(
                  title: 'primary_price'.tr(),
                  builder: (data, index) => data.primaryPrice.format(),
                ),
                TColumn(
                  title: 'bonus_price'.tr(),
                  builder: (data, index) => data.bonusPrice.format(),
                ),
                TColumn(
                  title: 'strip_price'.tr(),
                  builder: (data, index) => data.stripPrice.format(),
                ),
                TColumn(
                  title: 'tablet_price'.tr(),
                  builder: (data, index) => data.tabletPrice.format(),
                ),
                TColumn(
                  title: 'currency'.tr(),
                  builder: (data, index) => data.currency.id,
                ),
                TColumn(
                  title: 'unit_packing'.tr(),
                  builder: (data, index) => data.product.unitPacking.id,
                ),
                TColumn(
                  title: 'unit_smallest'.tr(),
                  builder: (data, index) => data.product.unitSmallest.id,
                ),
                TColumn(
                  title: 'unit_order'.tr(),
                  builder: (data, index) => data.product.unitOrder.id,
                ),
                TColumn(
                  title: 'unit_secondary'.tr(),
                  builder: (data, index) => data.product.unitSecondary.id,
                ),
                TColumn(
                  title: 'division'.tr(),
                  builder: (data, index) => data.product.division.id,
                ),
                TColumn(
                  title: 'expiry_period'.tr(),
                  builder: (data, index) =>
                      '${data.product.expiryPeriod} Month',
                ),
                TColumn(
                  title: 'toll_out'.tr(),
                  builder: (data, index) => data.product.tollOut.toString(),
                ),
                TColumn(
                  title: 'type'.tr(),
                  builder: (data, index) =>
                      data.product.productType.productType,
                ),
                TColumn(
                  title: 'quantity_tablet'.tr(),
                  builder: (data, index) =>
                      data.product.quantityTablet.format(),
                ),
                TColumn(
                  title: 'quantity_strip'.tr(),
                  builder: (data, index) => data.product.quantityStrip.format(),
                ),
                TColumn(
                  title: 'quantity_batch'.tr(),
                  builder: (data, index) => data.product.quantityBatch.format(),
                ),
                TColumn(
                  title: 'quantity_pack'.tr(),
                  builder: (data, index) => data.product.quantityPack.format(),
                ),
                TColumn(
                  title: 'active'.tr(),
                  builder: (data, index) => data.product.isActive.toString(),
                ),
                TColumn(
                  title: 'phased_out'.tr(),
                  builder: (data, index) => data.product.isPhasedOut.toString(),
                ),
                TColumn(
                  title: 'created_at'.tr(),
                  builder: (data, index) =>
                      DateFormat().format(data.product.createAt),
                ),
                TColumn(
                  title: 'updated_at'.tr(),
                  builder: (data, index) =>
                      DateFormat().format(data.product.updatedAt),
                ),
              ],
            );
            saveFile(bytes, 'Product_Price_Report.xlsx');
          },
        );
      },
      child: BlocBuilder<ProductPriceQueryBloc, ProductPriceQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            title: 'product_price'.tr(),
            status: state.maybeWhen(
              orElse: () => null,
            ),
            permission: PermissionProduct.productPrint(isExternal: isExternal),
            onPressed: () {
              context
                  .read<ProductPriceQueryBloc>()
                  .add(const ProductPriceQueryEvent.fetch(product: null));
            },
          );
        },
      ),
    );
  }
}
