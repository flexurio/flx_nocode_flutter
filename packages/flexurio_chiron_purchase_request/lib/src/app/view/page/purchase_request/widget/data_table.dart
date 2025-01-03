import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/approve_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/create_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/edit_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/export_excel_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/export_pdf_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/reject_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/undo_confirm_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/purchase_request/widget/view_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';

class PurchaseRequestDataTable extends StatefulWidget {
  const PurchaseRequestDataTable({super.key});

  @override
  State<PurchaseRequestDataTable> createState() =>
      _PurchaseRequestDataTableState();
}

class _PurchaseRequestDataTableState extends State<PurchaseRequestDataTable> {
  late Department? department;
  late bool isDepartmentProcurement;
  PurchaseRequestStatus? _status = PurchaseRequestStatus.input;

  initState() {
    super.initState();
    department = UserRepositoryApp.instance.department;
    isDepartmentProcurement = department?.id == 'PC';
    _fetch(null);
  }

  void _fetch(PageOptions<MaterialRequest>? pageOptions) {
    context.read<PurchaseRequestQueryBloc>().add(
          PurchaseRequestQueryEvent.fetch(
            status: _status,
            departments: isDepartmentProcurement ? null : [department!],
            isRequestForm: false,
            pageOptions: pageOptions,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseRequestQueryBloc, PurchaseRequestQueryState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DataTableBackend<MaterialRequest>(
            freezeFirstColumn: true,
            freezeLastColumn: true,
            status: state.maybeWhen(
              loading: (_) => Status.progress,
              loaded: (_) => Status.loaded,
              orElse: () => Status.error,
            ),
            onRefresh: () => _fetch(null),
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              MaterialRequestExportExcelButton.prepare(),
              const UndoConfirmButton(),
              const ApproveButton(),
              const RejectButton(),
              refreshButton,
              const MaterialRequestCreateButton(),
            ],
            actionLeft: [
              DropDownSmall<PurchaseRequestStatus>(
                key: ValueKey(_status),
                labelText: 'status'.tr(),
                initialValue: _status,
                itemAsString: (status) => status.label,
                items: PurchaseRequestStatus.list,
                onChanged: (status) {
                  if (status != null) {
                    _status = status;
                    _fetch(null);
                  }
                },
              ),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(backendColumn: 'id', label: 'ID'),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 9,
                head: DTHead(backendColumn: 'status', label: 'status'.tr()),
                body: (materialRequest) =>
                    DataCell(ChipType(materialRequest.status)),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'Department.name',
                  label: 'department'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'MaterialGroup.id',
                  label: 'material_group'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'Vendor.name',
                  label: 'Manufacturer',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.vendor?.name ?? '-'),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: DTHead(
                  backendColumn: 'date_of_need',
                  label: 'date_of_need'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.dateOfNeed.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'description',
                  label: 'description'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.description).withTooltip,
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'created_by_id',
                  label: 'created_by'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  GetNameUser(userId: materialRequest.createdById),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: DTHead(
                  backendColumn: 'created_at',
                  label: 'created_at'.tr(),
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.createdAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'updated_by_id',
                  label: 'Updated By',
                ),
                body: (materialRequest) => DataCell(
                  GetNameUser(userId: materialRequest.updateById),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'updated_at',
                  label: 'Updated At',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.updatedAt.yMMMdHm),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: DTHead(backendColumn: null, label: 'actions'.tr()),
                body: (materialRequest) => DataCell(
                  Row(
                    children: [
                      ViewButton.prepare(materialRequest: materialRequest),
                      ExportPdfButton.prepare(materialRequest, _status),
                      if (materialRequest.status.isInput)
                        PurchaseRequestEditButton(
                          materialRequest,
                          refresh: () => _fetch(null),
                        ),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (pageOptions) {
              _fetch(pageOptions);
            },
          ),
        );
      },
    );
  }
}
