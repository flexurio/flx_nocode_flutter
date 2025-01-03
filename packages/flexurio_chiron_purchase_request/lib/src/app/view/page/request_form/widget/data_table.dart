import 'package:flexurio_chiron_purchase_request/src/app/bloc/material_request_query/material_request_query_bloc.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/close_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/create_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/create_mr_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/edit_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/reject_button.dart';
import 'package:flexurio_chiron_purchase_request/src/app/view/page/request_form/widget/view_button.dart';
import 'package:appointment/src/app/view/widget/get_user_name.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestFormDataTable extends StatefulWidget {
  const RequestFormDataTable({super.key});

  @override
  State<RequestFormDataTable> createState() => _RequestFormDataTableState();
}

class _RequestFormDataTableState extends State<RequestFormDataTable> {
  PurchaseRequestStatus? _status = PurchaseRequestStatus.input;

  final userDepartment = UserRepositoryApp.instance.department;
  Department? _department;
  final listDepartmentIT = [
    Department.empty().copyWith(id: 'IT', name: 'Department IT'),
    Department.empty().copyWith(
      id: 'IT COMP',
      name: 'Material Group IT COMP',
    ),
  ];
  final listDepartmentCS = [
    Department.empty().copyWith(
      id: 'CS',
      name: 'Department CS',
    ),
    Department.empty().copyWith(
      id: 'ATK',
      name: 'Material Group ATK, SAFETY, ALAT DAPUR, UMUM',
    ),
  ];
  List<MaterialGroup>? setMaterialGroupIdIn;
  List<Department>? setDepartments;

  void _setFilter() {
    if (_department != null) {
      if (_department!.id == listDepartmentIT[0].id) {
        setDepartments = [_department!];
      } else if (_department!.id == listDepartmentCS[0].id) {
        setDepartments = [_department!];
      } else if (_department!.id == listDepartmentIT[1].id) {
        setDepartments = [];
        setMaterialGroupIdIn = [
          MaterialGroup.empty().copyWith(
            id: _department!.id,
          ),
        ];
      } else {
        setDepartments = [];
        setMaterialGroupIdIn = [
          MaterialGroup.empty().copyWith(
            id: 'ATK',
          ),
          MaterialGroup.empty().copyWith(
            id: 'SAFETY',
          ),
          MaterialGroup.empty().copyWith(
            id: 'ALAT DAPUR',
          ),
          MaterialGroup.empty().copyWith(
            id: 'UMUM',
          ),
        ];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _department = userDepartment;
    final queryBloc = context.read<PurchaseRequestQueryBloc>();
    return BlocBuilder<PurchaseRequestQueryBloc, PurchaseRequestQueryState>(
      builder: (context, state) {
        final showFilter = userDepartment!.id == listDepartmentIT[0].id ||
            userDepartment!.id == listDepartmentCS[0].id;
        final listFilter = userDepartment!.id == listDepartmentIT[0].id
            ? listDepartmentIT
            : userDepartment!.id == listDepartmentCS[0].id
                ? listDepartmentCS
                : <Department>[];
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
            onRefresh: () {
              _setFilter();
              context.read<PurchaseRequestQueryBloc>().add(
                    PurchaseRequestQueryEvent.fetch(
                      status: _status,
                      isRequestForm: true,
                      isOrder: true,
                      departments: setDepartments ??
                          UserRepositoryApp.instance.departments,
                      materialGroupIdIn: setMaterialGroupIdIn,
                    ),
                  );
            },
            onChanged: (pageOptions) {
              _setFilter();
              context.read<PurchaseRequestQueryBloc>().add(
                    PurchaseRequestQueryEvent.fetch(
                      pageOptions: pageOptions,
                      status: _status,
                      isRequestForm: true,
                      isOrder: true,
                      departments: setDepartments ??
                          UserRepositoryApp.instance.departments,
                      materialGroupIdIn: setMaterialGroupIdIn,
                    ),
                  );
            },
            key: ValueKey(state.hashCode),
            pageOptions: state.maybeWhen(
              loaded: (data) => data,
              loading: (data) => data,
              orElse: PageOptions.empty,
            ),
            actionRight: (refreshButton) => [
              const RejectButton(),
              const RequestFormCreateMRButton(),
              const RequestFormCloseButton(),
              refreshButton,
              const RequestFormCreateButton(),
            ],
            actionLeft: [
              _buildFilterStatus(queryBloc),
              Visibility(
                visible: showFilter,
                child: DropDownSmall<Department>(
                  key: ValueKey(DateTime.now().microsecondsSinceEpoch),
                  labelText: 'Material Group',
                  initialValue: _department,
                  itemAsString: (filter) => filter.name,
                  items: listFilter,
                  onChanged: (value) {
                    if (value != null) {
                      _department = value;
                      _setFilter();
                      context.read<PurchaseRequestQueryBloc>().add(
                            PurchaseRequestQueryEvent.fetch(
                              pageOptions: PageOptions.empty(),
                              status: _status,
                              isRequestForm: true,
                              isOrder: true,
                              departments: setDepartments,
                              materialGroupIdIn: setMaterialGroupIdIn,
                            ),
                          );
                    }
                  },
                ),
              ),
            ],
            columns: [
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  backendColumn: 'id',
                  label: 'ID',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.id).canCopy(),
                ),
              ),
              DTColumn(
                widthFlex: 9,
                head: const DTHead(
                  backendColumn: 'status',
                  label: 'Status',
                ),
                body: (materialRequest) =>
                    DataCell(ChipType(materialRequest.status)),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'Department.name',
                  label: 'Department',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.department.name),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'MaterialGroup.id',
                  label: 'Material Group',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.materialGroup.id),
                ),
              ),
              DTColumn(
                widthFlex: 6,
                head: const DTHead(
                  backendColumn: 'date_of_need',
                  label: 'Date of Need ',
                ),
                body: (materialRequest) => DataCell(
                  Text(materialRequest.dateOfNeed.yMMMd),
                ),
              ),
              DTColumn(
                widthFlex: 7,
                head: const DTHead(
                  backendColumn: 'description',
                  label: 'Description',
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
                  Text(
                    materialRequest.createdAt.yMMMdHm,
                  ),
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
                  Text(
                    materialRequest.updatedAt.yMMMdHm,
                  ),
                ),
              ),
              DTColumn(
                widthFlex: 8,
                head: const DTHead(
                  backendColumn: null,
                  label: 'Actions',
                ),
                body: (materialRequest) => DataCell(
                  Row(
                    children: [
                      ViewButton(
                        materialRequest: materialRequest,
                        status: _status,
                        showStatus: true,
                      ),
                      if (materialRequest.status.isInput &&
                          materialRequest.createdById ==
                              UserRepositoryApp.instance.userApp!.id)
                        RequestFormEditButton(
                          materialRequest: materialRequest,
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

  DropDownSmall<PurchaseRequestStatus> _buildFilterStatus(
      PurchaseRequestQueryBloc queryBloc) {
    return DropDownSmall<PurchaseRequestStatus>(
      key: ValueKey(_status),
      labelText: 'Status',
      initialValue: _status,
      itemAsString: (status) => status.label,
      items: PurchaseRequestStatus.requestFormList,
      onChanged: (status) {
        if (status != null) {
          _status = status;
          queryBloc.add(
            PurchaseRequestQueryEvent.fetch(
              status: status,
              isRequestForm: true,
              isOrder: true,
              departments: UserRepositoryApp.instance.departments,
            ),
          );
        }
      },
    );
  }
}
