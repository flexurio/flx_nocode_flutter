import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialIssueDetailDataTable extends StatefulWidget {
  const MaterialIssueDetailDataTable({
    required this.materialIssue,
    required this.action,
    this.product,
    this.materialIssueDetail,
    required this.isExternal,
    super.key,
  });

  final bool isExternal;
  final MaterialIssueDetail? materialIssueDetail;
  final MaterialIssue materialIssue;
  final DataAction action;
  final Product? product;

  static Widget prepare({
    required MaterialIssue materialIssue,
    required DataAction action,
    Product? product,
    MaterialIssueDetail? materialIssueDetail,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialIssueQueryBloc(isExternal: isExternal),
        ),
        BlocProvider(
          create: (context) =>
              MaterialIssueDetailQueryBloc(isExternal: isExternal)
                ..add(MaterialIssueDetailQueryEvent.fetch(
                    materialIssue: materialIssue)),
        ),
      ],
      child: MaterialIssueDetailDataTable(
        action: action,
        materialIssue: materialIssue,
        materialIssueDetail: materialIssueDetail,
        product: product,
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialIssueDetailDataTable> createState() =>
      _MaterialIssueDetailDataTableState();
}

class _MaterialIssueDetailDataTableState
    extends State<MaterialIssueDetailDataTable> {
  MaterialIssue? _materialIssue;
  @override
  Widget build(BuildContext context) {
    final isCreate = widget.action == DataAction.create;
    final isCreateNonMi = widget.action == DataAction.createAdditional;

    return BlocBuilder<MaterialIssueDetailQueryBloc,
        MaterialIssueDetailQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialIssueDetail>(
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            key: ValueKey(state.hashCode),
            onChanged: (pageOptions) {
              context
                  .read<MaterialIssueDetailQueryBloc>()
                  .add(MaterialIssueDetailQueryEvent.fetch(
                    pageOptions: pageOptions,
                    materialIssue: _materialIssue,
                  ));
            },
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => context.read<MaterialIssueDetailQueryBloc>().add(
                  MaterialIssueDetailQueryEvent.fetch(
                    materialIssue: widget.materialIssue,
                  ),
                ),
            actionRight: (refreshButton) => [
              refreshButton,
              if (isCreateNonMi)
                MaterialIssueDetailCreateButton(
                  materialIssue: widget.materialIssue,
                  action: DataAction.create,
                  isExternal: widget.isExternal,
                ),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: '${'material_issue'.tr()} ${'id'.tr()}',
                  backendColumn: 'material_issue_id',
                ),
                body: (materialIssueDetail) => DataCell(
                  Text(materialIssueDetail.materialIssue.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'material'.tr(),
                  backendColumn: 'Material.name',
                ),
                body: (materialIssueDetail) => DataCell(
                  Text(materialIssueDetail.material.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'unit'.tr(),
                  backendColumn: 'MaterialUnit.id',
                ),
                body: (materialIssueDetail) => DataCell(
                  Text(materialIssueDetail.materialUnit.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'NA',
                  backendColumn: 'na',
                ),
                body: (materialIssueDetail) => DataCell(
                  Text(materialIssueDetail.na),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'quantity'.tr(),
                  backendColumn: 'quantity',
                ),
                body: (materialIssueDetail) => DataCell(
                  Text(materialIssueDetail.quantity.toString()),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'warehouse'.tr(),
                  backendColumn: 'warehouse',
                ),
                body: (materialIssueDetail) => DataCell(
                  ChipType(materialIssueDetail.warehouse),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'actions'.tr(),
                  backendColumn: null,
                ),
                body: (materialIssueDetail) {
                  final isCurrentMonth = DateTime.now().month ==
                      materialIssueDetail.createdAt.month;
                  return DataCell(
                    Row(
                      children: [
                        if (isCreate && isCurrentMonth)
                          MaterialIssueDetailEditButton(
                            action: DataAction.edit,
                            product: widget.product!,
                            materialIssueDetail: materialIssueDetail,
                            isExternal: widget.isExternal,
                          ),
                        _buildButtonCreateAnalysisNumber(materialIssueDetail),
                        if (isCreateNonMi)
                          MaterialIssueDetailDeleteButton.prepare(
                            materialIssueDetail: materialIssueDetail,
                            isExternal: widget.isExternal,
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButtonCreateAnalysisNumber(
    MaterialIssueDetail materialIssueDetail,
  ) {
    {
      final isProductNotEmpty =
          materialIssueDetail.materialIssue.product.id != '';
      final isNotMatchQuantityRequired =
          materialIssueDetail.quantityRequired != materialIssueDetail.quantity;
      final isExternal =
          ['PR3', 'PR9', 'PR11'].contains(widget.materialIssue.miType.id);
      if ((isProductNotEmpty && isNotMatchQuantityRequired) || isExternal) {
        return MaterialIssueDetailCreateNewNaButton(
          action: DataAction.edit,
          product: widget.product,
          materialIssueDetail: materialIssueDetail,
          isExternal: widget.isExternal,
        );
      }
      return SizedBox.shrink();
    }
  }
}
