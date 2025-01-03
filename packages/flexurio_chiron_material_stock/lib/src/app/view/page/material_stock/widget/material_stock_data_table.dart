import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_chiron_material/flexurio_chiron_material.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart' as model;
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialStockDataTable extends StatefulWidget {
  const MaterialStockDataTable({
    required this.materialStockQueryBloc,
    required this.materialQueryBloc,
    required this.materialGroupQueryBloc,
    super.key,
    required this.isExternal,
  });
  final bool isExternal;
  final MaterialStockQueryBloc materialStockQueryBloc;
  final MaterialQueryBloc materialQueryBloc;
  final MaterialGroupQueryBloc materialGroupQueryBloc;

  static Widget prepare({
    required MaterialStockQueryBloc materialStockQueryBloc,
    required MaterialQueryBloc materialQueryBloc,
    required MaterialGroupQueryBloc materialGroupQueryBloc,
    required bool isExternal,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MaterialQueryBloc()
            ..add(
              MaterialQueryEvent.fetch(pageOptions: PageOptions.emptyNoLimit()),
            ),
        ),
        BlocProvider(create: (context) => PurchaseOrderDetailQueryBloc()),
        BlocProvider(
            create: (context) => MaterialGroupQueryBloc()
              ..add(MaterialGroupQueryEvent.fetch(
                pageOptions: PageOptions.emptyNoLimit(),
              ))),
      ],
      child: MaterialStockDataTable(
        materialStockQueryBloc: materialStockQueryBloc,
        materialGroupQueryBloc: materialGroupQueryBloc,
        materialQueryBloc: materialQueryBloc,
        isExternal: isExternal,
      ),
    );
  }

  @override
  State<MaterialStockDataTable> createState() => _MaterialStockDataTableState();
}

class _MaterialStockDataTableState extends State<MaterialStockDataTable> {
  model.Material? _material;
  MaterialGroup? _materialGroup;
  DateTime? _period;
  String? _na;

  void _fetch() {
    context.read<MaterialStockQueryBloc>().add(MaterialStockQueryEvent.fetch(
        material: _material,
        materialGroup: _materialGroup,
        na: _na,
        period: _period));
  }

  @override
  Widget build(BuildContext context) {
    final materialDropDown = BlocBuilder<MaterialQueryBloc, MaterialQueryState>(
      builder: (context, state) {
        final status = state.maybeWhen(
          orElse: () => Status.error,
          loaded: (_) => Status.loaded,
          loading: (_) => Status.progress,
        );
        return Row(
          children: [
            FDropDownSearchSmall<model.Material>(
              width: 458,
              iconField: Icons.list,
              status: status,
              labelText: 'material'.tr(),
              initialValue: _material,
              itemAsString: (material) => material.name,
              items: state.maybeWhen(
                orElse: () => [],
                loaded: (materials) => materials.data,
              ),
              onChanged: (material) {
                if (material != null) {
                  _material = material;
                  context.read<MaterialStockQueryBloc>().add(
                        MaterialStockQueryEvent.fetch(
                          material: _material,
                          materialGroup: _materialGroup,
                          na: _na,
                          period: _period,
                        ),
                      );
                }
              },
            ),
          ],
        );
      },
    );
    final materialGroupDropDown =
        BlocBuilder<MaterialGroupQueryBloc, MaterialGroupQueryState>(
      builder: (context, state) {
        final status = state.maybeWhen(
          orElse: () => Status.error,
          loaded: (_) => Status.loaded,
          loading: (_) => Status.progress,
        );
        return FDropDownSearchSmall<MaterialGroup>(
          width: 270,
          iconField: Icons.list,
          status: status,
          labelText: 'material_group'.tr(),
          initialValue: _materialGroup,
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (materialGroup) => materialGroup.data,
          ),
          onChanged: (materialGroup) {
            if (materialGroup != null) {
              _materialGroup = materialGroup;
              widget.materialStockQueryBloc.add(
                MaterialStockQueryEvent.fetch(
                  material: _material,
                  materialGroup: _materialGroup,
                  na: _na,
                  period: _period,
                ),
              );
            }
          },
          itemAsString: (materialGroup) => materialGroup.id,
        );
      },
    );
    return BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
      bloc: widget.materialStockQueryBloc,
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialStock>(
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            key: ValueKey(state.hashCode),
            onChanged: (pageOptions) {
              context
                  .read<MaterialStockQueryBloc>()
                  .add(MaterialStockQueryEvent.fetch(
                    pageOptions: pageOptions,
                    materialGroup: _materialGroup,
                    material: _material,
                    period: _period,
                    na: _na,
                  ));
            },
            actionRight: (refreshButton) => [
              LightButtonSmallGroup(
                action: DataAction.export,
                children: {
                  PermissionMaterialStock.materialStockExportExcel(
                      isExternal: widget.isExternal): ExportExcelButton(
                    isExternal: widget.isExternal,
                  ),
                  PermissionMaterialStock.materialStockReportExportPdf(
                          isExternal: widget.isExternal):
                      MaterialStockReportExportPdfButton(
                    isExternal: widget.isExternal,
                  ),
                  PermissionMaterialStock.materialStockReportExportPdf(
                          isExternal: widget.isExternal):
                      MaterialStockMutationReportExportPdfButton(
                    isExternal: widget.isExternal,
                  ),
                },
              ),
              refreshButton,
            ],
            actionLeft: [
              materialDropDown,
              _buildSelectPeriod(),
              materialGroupDropDown,
              DropDownNa.prepare(
                  isExternal: widget.isExternal,
                  na: MaterialStock.empty().copyWith(na: _na ?? ''),
                  onChange: (materialStock) {
                    if (materialStock != null) {
                      _na = materialStock.na;
                      widget.materialStockQueryBloc.add(
                        MaterialStockQueryEvent.fetch(
                          material: _material,
                          materialGroup: _materialGroup,
                          na: _na,
                          period: _period,
                        ),
                      );
                    }
                  }),
            ],
            onRefresh: () {
              _period = null;
              _material = null;
              _materialGroup = null;
              _na = null;
              widget.materialStockQueryBloc
                  .add(const MaterialStockQueryEvent.fetch());
            },
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            columns: [
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'period'.tr(),
                  backendColumn: 'period',
                ),
                body: (materialStock) {
                  final date = DateTime(
                    int.parse(materialStock.period.substring(0, 4)),
                    int.parse(materialStock.period.substring(4)),
                  );
                  return DataCell(
                    Text(DateFormat('MMMM y').format(date)),
                  );
                },
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'material_group'.tr(),
                  backendColumn: 'material_group_id',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'material_name'.tr(),
                  backendColumn: 'Material.name',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.material.name),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'Material ID',
                  backendColumn: 'material_id',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.material.id),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  label: 'analysis_number'.tr(),
                  backendColumn: 'na',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.na),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'beginning_balance'.tr(),
                  backendColumn: 'beginning_balance',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.beginningBalance.format(5)),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'quantity_on_order'.tr(),
                  backendColumn: 'quantity_in',
                ),
                body: (materialStock) => DataCell(
                  BlocBuilder<PurchaseOrderDetailQueryBloc,
                      PurchaseOrderDetailQueryState>(
                    builder: (context, state) {
                      final qty = state.maybeWhen(
                        orElse: () => 0,
                        loaded: (detail) => detail.first.quantity,
                      );
                      return Text(qty.toString());
                    },
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'quantity_in'.tr(),
                  backendColumn: 'quantity_in',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.quantityIn.format(5)),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'quantity_out'.tr(),
                  backendColumn: 'quantity_out',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.quantityOut.format(5)),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(
                  numeric: true,
                  label: 'ending_balance'.tr(),
                  backendColumn: 'ending_balance',
                ),
                body: (materialStock) => DataCell(
                  Text(materialStock.endingBalance.format(5)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSelectPeriod() => DropDownSmallYearMonth(
        initialValue: _period,
        maxDate: DateTime.now(),
        labelText: 'period'.tr(),
        onChanged: (date) {
          _period = date;
          _fetch();
        },
      );
}

class DropDownNa extends StatelessWidget {
  const DropDownNa(
      {required this.isExternal,
      required this.na,
      required this.onChange,
      super.key});

  static Widget prepare({
    required void Function(MaterialStock?) onChange,
    required bool isExternal,
    required MaterialStock? na,
  }) {
    return BlocProvider(
      create: (context) => MaterialStockQueryBloc(isExternal: isExternal)
        ..add(
          MaterialStockQueryEvent.fetch(
              pageOptions: PageOptions.emptyNoLimit()),
        ),
      child: DropDownNa(
        isExternal: isExternal,
        onChange: onChange,
        na: na,
      ),
    );
  }

  final bool isExternal;
  final void Function(MaterialStock?) onChange;
  final MaterialStock? na;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialStockQueryBloc, MaterialStockQueryState>(
      builder: (context, state) {
        return FDropDownSearchSmall<MaterialStock>(
          width: 200,
          iconField: Icons.list,
          status: state.maybeWhen(
            error: (_) => Status.error,
            loading: (_) => Status.progress,
            orElse: () => Status.loaded,
          ),
          labelText: 'NA',
          items: state.maybeWhen(
            orElse: () => [],
            loaded: (pageOptions) => pageOptions.data,
          ),
          onChanged: onChange,
          itemAsString: (material) => material.na,
          initialValue: na!.na.isEmpty ? null : na,
        );
      },
    );
  }
}
