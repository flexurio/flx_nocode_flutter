import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:appointment/src/app/util/picker_file.dart';
import 'package:flexurio_chiron_product/src/app/model/permission.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductExportExcelButton extends StatelessWidget {
  const ProductExportExcelButton({super.key, required this.isExternal});

  final bool isExternal;

  static Widget prepare({
    required bool isExternal,
  }) {
    return BlocProvider(
      create: (context) => ProductQueryBloc(isExternal: isExternal),
      child: ProductExportExcelButton(isExternal: isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductQueryBloc>();

    return BlocListener<ProductQueryBloc, ProductQueryState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          loaded: (pageOptions) {
            final bytes = simpleExcel<Product>(
              context: context,
              data: pageOptions.data,
              columns: [
                TColumn(
                  title: 'id'.tr(),
                  builder: (data, index) => data.id,
                ),
                TColumn(
                  title: 'no'.tr(),
                  builder: (data, index) => data.productNo,
                ),
                TColumn(
                  title: 'name'.tr(),
                  builder: (data, index) => data.name,
                ),
                TColumn(
                  title: 'nie'.tr(),
                  builder: (data, index) => data.nie ?? '-',
                ),
                TColumn(
                  title: 'product_group'.tr(),
                  builder: (data, index) => data.productGroup.id,
                ),
                TColumn(
                  title: 'unit_packing'.tr(),
                  builder: (data, index) => data.unitPacking.id,
                ),
                TColumn(
                  title: 'unit_smallest'.tr(),
                  builder: (data, index) => data.unitSmallest.id,
                ),
                TColumn(
                  title: 'unit_order'.tr(),
                  builder: (data, index) => data.unitOrder.id,
                ),
                TColumn(
                  title: 'unit_secondary'.tr(),
                  builder: (data, index) => data.unitSecondary.id,
                ),
                TColumn(
                  title: 'division'.tr(),
                  builder: (data, index) => data.division.id,
                ),
                TColumn(
                  title: 'expiry_period'.tr(),
                  builder: (data, index) => data.expiryPeriod.toString(),
                ),
                TColumn(
                  title: 'toll_out'.tr(),
                  builder: (data, index) => data.tollOut.toString(),
                ),
                TColumn(
                  title: 'type'.tr(),
                  builder: (data, index) => data.productType.productType,
                ),
                TColumn(
                  title: 'quantity_tablet'.tr(),
                  builder: (data, index) => data.quantityTablet.toString(),
                ),
                TColumn(
                  title: 'quantity_strip'.tr(),
                  builder: (data, index) => data.quantityStrip.toString(),
                ),
                TColumn(
                  title: 'quantity_batch'.tr(),
                  builder: (data, index) => data.quantityBatch.toString(),
                ),
                TColumn(
                  title: 'quantity_pack'.tr(),
                  builder: (data, index) => data.quantityPack.toString(),
                ),
                TColumn(
                  title: 'created_at'.tr(),
                  builder: (data, index) => data.createAt.toString(),
                ),
                TColumn(
                  title: 'updated_at'.tr(),
                  builder: (data, index) => data.updatedAt.toString(),
                ),
              ],
            );
            saveFile(bytes, 'Recap_Expired_Product.xlsx');
          },
        );
      },
      child: BlocBuilder<ProductQueryBloc, ProductQueryState>(
        builder: (context, state) {
          return LightButtonSmall(
            action: DataAction.exportExcel,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              orElse: () => null,
            ),
            permission: PermissionProduct.productPrint(isExternal: isExternal),
            onPressed: () {
              bloc.add(
                ProductQueryEvent.fetch(
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
