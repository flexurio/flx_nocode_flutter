import 'package:flexurio_chiron_product/src/app/bloc/product_query/bloc/product_query_bloc.dart';
import 'package:flexurio_chiron_product/src/app/model/product.dart';
import 'package:flexurio_chiron_product/src/app/view/page/product_nie/product_nie_page.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_activate_deactivate_switch_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_create_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_delete_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_excel_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_phased_out_deactive_switch_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_price_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_price_excel_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_report_button.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_report_document.dart';
import 'package:flexurio_chiron_product/src/app/view/page/products/widget/product_update_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDataTable extends StatelessWidget {
  const ProductDataTable._(this.product, this.isExternal);

  final Product? product;
  final bool isExternal;
  static Widget prepare({Product? product, required bool isExternal}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQueryBloc(isExternal: isExternal)
            ..add(const ProductQueryEvent.fetch()),
        ),
      ],
      child: ProductDataTable._(product, isExternal),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return BlocBuilder<ProductQueryBloc, ProductQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<Product>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            onRefresh: () => context
                .read<ProductQueryBloc>()
                .add(const ProductQueryEvent.fetch()),
            key: ValueKey(state.hashCode),
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
            actionRight: (refreshButton) => [
              ProductPriceExportExcelButton.prepare(isExternal: isExternal),
              ProductReportDocumentButton.prepare(),
              ProductReportPDFButton.prepare(),
              ProductExportExcelButton.prepare(isExternal: isExternal),
              refreshButton,
              ProductCreateButton(product: product, isExternal: isExternal),
            ],
            onChanged: (pageOptions) {
              context.read<ProductQueryBloc>().add(
                    ProductQueryEvent.fetch(
                      pageOptions: pageOptions,
                    ),
                  );
            },
            columns: [
              DTColumn(
                widthFlex: 5,
                head: const DTHead(backendColumn: 'id', label: 'ID'),
                body: (product) => DataCell(
                  Text(product.id),
                ),
              ),
              DTColumn(
                widthFlex: 4,
                head: DTHead(
                  backendColumn: 'company',
                  label: 'company'.tr(),
                ),
                body: (product) => DataCell(
                  Text(product.company),
                ),
              ),
              DTColumn(
                widthFlex: 3,
                head: const DTHead(
                  backendColumn: 'product_no',
                  label: 'No',
                ),
                body: (product) => DataCell(Text(product.productNo)),
              ),
              DTColumn(
                widthFlex: 13,
                head: const DTHead(
                  backendColumn: 'name',
                  label: 'Name',
                ),
                body: (product) => DataCell(Text(product.name)),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'nie',
                  label: 'NIE',
                ),
                body: (product) {
                  return DataCell(
                    Tooltip(
                      message: 'Show NIE',
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            product.nie ?? '-',
                            style: TextStyle(
                              color: product.isNieValid
                                  ? primaryColor
                                  : Colors.redAccent,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            ProductNiePage.route(product: product),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'ProductGroup.id',
                  label: 'Product Group',
                ),
                body: (product) => DataCell(Text(product.productGroup.id)),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'UnitPacking.id',
                  label: 'Unit Packing',
                ),
                body: (product) => DataCell(Text(product.unitPacking.id)),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'UnitSmallest.id',
                  label: 'Unit Smallest',
                ),
                body: (product) => DataCell(Text(product.unitSmallest.id)),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'UnitOrder.id',
                  label: 'Unit Order',
                ),
                body: (product) => DataCell(Text(product.unitOrder.id)),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'UnitSecondary.id',
                  label: 'Unit Secondary',
                ),
                body: (product) => DataCell(Text(product.unitSecondary.id)),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'division',
                  label: 'Division',
                ),
                body: (product) => DataCell(Text(product.division.label)),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'expiry_period',
                  label: 'Expiry Period',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text('${product.expiryPeriod} Month'),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'is_toll_out',
                  label: 'Toll Out',
                ),
                body: (product) {
                  return DataCell(
                    SizedBox(child: BoolIcon(product.tollOut)),
                  );
                },
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'is_phased_out',
                  label: 'Phased Out',
                ),
                body: (product) => DataCell(
                  ProductPhasedOutDeactivateSwitchButton.prepare(
                    product: product,
                    isExternal: isExternal,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'type',
                  label: 'Type',
                ),
                body: (product) => DataCell(
                  ChipType(product.productType),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'quantity_tablet',
                  label: 'Quantity Tablet',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.quantityTablet.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'quantity_strip',
                  label: 'Quantity Strip',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.quantityStrip.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'quantity_batch',
                  label: 'Quantity Batch',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.quantityBatch.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'quantity_pack',
                  label: 'Quantity Pack',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.quantityPack.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.createAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'updated_at',
                  label: 'Updated At',
                  numeric: true,
                ),
                body: (product) => DataCell(
                  Text(product.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 5,
                head: const DTHead(
                  backendColumn: 'is_active',
                  label: 'Active',
                ),
                body: (product) => DataCell(
                  ProductActivateDeactivateSwitchButton.prepare(
                    product: product,
                    isExternal: isExternal,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 10,
                head: const DTHead(backendColumn: '', label: 'Actions'),
                body: (product) => DataCell(
                  Row(
                    children: [
                      ProductUpdateButton(product: product, isExternal: isExternal,),
                      ProductPriceButton(product: product),
                      ProductDeleteButton.prepare(
                        product: product,
                        isExternal: isExternal,
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
