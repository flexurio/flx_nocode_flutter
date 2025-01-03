import 'package:flexurio_chiron_sales_order/src/app/bloc/product_request_query/product_request_query_bloc.dart';
import 'package:flexurio_chiron_sales_order/src/app/model/product_request.dart';
import 'create_button.dart';
import 'delete_button.dart';
import 'view_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRequestDataTable extends StatefulWidget {
  const ProductRequestDataTable._();

  @override
  State<ProductRequestDataTable> createState() =>
      _ProductRequestDataTableState();

  static Widget prepare() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductRequestQueryBloc()
            ..add(const ProductRequestQueryEvent.fetch()),
        ),
      ],
      child: const ProductRequestDataTable._(),
    );
  }
}

class _ProductRequestDataTableState extends State<ProductRequestDataTable> {
  var _status = '';
  var _pageOptions = PageOptions<ProductRequest>.empty();

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  void _fetch() {
    context.read<ProductRequestQueryBloc>().add(
          ProductRequestQueryEvent.fetch(
            status: _status,
            pageOptions: _pageOptions,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductRequestQueryBloc, ProductRequestQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<ProductRequest>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            key: ValueKey(state.hashCode),
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => _fetch(),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionLeft: [
              _buildDropDownStatus(),
            ],
            actionRight: (refreshButton) => [
              refreshButton,
              ProductRequestCreateButton(
                refresh: _fetch,
              ),
            ],
            onChanged: (pageOptions) {
              _pageOptions = pageOptions;
              _fetch();
            },
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'code'.tr(),
                  backendColumn: 'id',
                ),
                body: (productRequest) => DataCell(
                  Text(productRequest.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'purchase_order_distributor'.tr(),
                  backendColumn: 'purchase_order_distributor',
                ),
                body: (productRequest) => DataCell(
                  Text(productRequest.purchaseOrderDistributor).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  label: 'Status',
                  backendColumn: 'status',
                ),
                body: (productRequest) => DataCell(
                  ChipType(productRequest.status),
                ),
              ),
              DTColumn(
                widthFlex: 15,
                head: const DTHead(
                  label: 'Customer',
                  backendColumn: 'product_requests.customer_name',
                ),
                body: (productRequest) => DataCell(
                  Text(
                    '${productRequest.customer.id} - ${productRequest.customer.name}',
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'transaction_type'.tr(),
                  backendColumn: 'transaction_types.name',
                ),
                body: (productRequest) => DataCell(
                  Text(productRequest.transactionType.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'order_type'.tr(),
                  backendColumn: 'order_types.name',
                ),
                body: (productRequest) => DataCell(
                  Text(productRequest.orderType.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'department'.tr(),
                  backendColumn: 'product_requests.department_id',
                ),
                body: (productRequest) => DataCell(
                  Text(productRequest.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_by'.tr(),
                  backendColumn: 'created_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'created_at'.tr(),
                  backendColumn: 'created_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  label: 'Updated By',
                  backendColumn: 'updated_by_id',
                ),
                body: (customer) => DataCell(
                  GetNameUser(userId: customer.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'updated_at'.tr(),
                  backendColumn: 'updated_at',
                ),
                body: (customer) => DataCell(
                  Text(customer.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (productRequest) => DataCell(
                  Row(
                    children: [
                      ProductRequestViewButton(
                        productRequest: productRequest,
                        refresh: _fetch,
                      ),
                      if (productRequest.status == ProductRequestStatus.input)
                        ProductRequestDeleteButton.prepare(
                          productRequest: productRequest,
                          refresh: _fetch,
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

  Widget _buildDropDownStatus() => DropDownSmall<String>(
        key: ValueKey(_status),
        initialValue: _status,
        labelText: 'Status',
        icon: Icons.filter_list,
        itemAsString: (status) => status,
        items: [
          '',
          ProductRequestStatus.input.label,
          ProductRequestStatus.confirm.label,
          ProductRequestStatus.pending.label,
          ProductRequestStatus.reject.label,
        ],
        onChanged: (status) {
          if (status != null) {
            _status = status;
            _fetch();
          }
        },
      );
}
