import 'dart:convert';

import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/material_request_detail.dart';
import 'package:flexurio_chiron_purchase_request/src/app/model/purchase_request.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_purchase_request/flexurio_chiron_purchase_request.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class PurchaseRequestRepository extends Repository {
  PurchaseRequestRepository({
    required super.dio,
    required super.onUnauthorized,
  });

  static final requestFormPath = '${Api.urlApi}/request-forms';
  static final materialRequestPath = '${Api.urlApi}/material-requests';
  static final materialRequestAll = '${Api.urlApi}/material-requests-all';
  static final materialRequestDetail =
      '${Api.urlApi}/material-requests/details';

  static PurchaseRequestRepository instance = PurchaseRequestRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Material Request
  Future<PageOptions<MaterialRequest>> purchaseRequestFetch({
    required String accessToken,
    required PurchaseRequestStatus? status,
    required List<Department>? departments,
    required bool isRequestForm,
    required PageOptions<MaterialRequest> pageOptions,
    bool? isOrder,
    List<MaterialGroup>? materialGroupIdIn,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'is_order.eq': isOrder,
        'department_id.in': departments?.map((e) => e.id).join(','),
        'status.eq': status?.id,
        'is_request_form.eq': isRequestForm,
      };

      if (periodStart != null) {
        queryParameters['created_at.gte'] = periodStart.yyyyMMdd;
      }

      if (periodEnd != null) {
        queryParameters['created_at.lte'] = periodEnd.yyyyMMdd;
      }

      if (materialGroupIdIn != null && materialGroupIdIn.isNotEmpty) {
        queryParameters['material_group_id.in'] = materialGroupIdIn.map(
          (materialGroup) {
            return materialGroup.id;
          },
        ).join(',');
      }

      queryParameters
        ..addAll(pageOptions.toUrlQueryMap())
        ..removeWhere((key, value) {
          return value == null;
        });

      final response = await dio.get<Map<String, dynamic>>(
        materialRequestPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialRequest.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialRequest> materialRequestCreate({
    required String accessToken,
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required String departmentId,
    required String departmentBudgetingId,
    required String description,
    required bool isRequestForm,
    required bool isOrder,
    Vendor? vendor,
  }) async {
    try {
      final dataParam = <String, dynamic>{
        'is_request_form': isRequestForm,
        'date_of_need': dateOfNeed.toUtc().toIso8601String(),
        'material_group_id': materialGroup.id,
        'description': description,
        'is_order': isOrder,
        'vendor_id': vendor?.id,
        'department_id': departmentId,
        'department_budgeting': departmentBudgetingId,
      };

      final testing = await dio.post<Map<String, dynamic>>(
        materialRequestPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(dataParam),
      );
      return MaterialRequest.fromJson(
        testing.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestUpdate({
    required String accessToken,
    required MaterialRequest materialRequest,
    required DateTime dateOfNeed,
    required MaterialGroup materialGroup,
    required String description,
    required Department department,
    Vendor? vendor,
  }) async {
    try {
      final materialRequestId = Uri.encodeComponent(materialRequest.id);

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/$materialRequestId',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'date_of_need': dateOfNeed.toUtc().toIso8601String(),
            'department_id': department.id,
            'description': description,
          }..removeWhere((key, value) => value == null),
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailUpdate({
    required String accessToken,
    required RequestFormDetail requestFormDetail,
    required Material material,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$requestFormPath/details/${requestFormDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_id': material.id,
          'unit_id': material.materialUnit.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDelete({
    required String accessToken,
    required MaterialRequest materialRequest,
  }) async {
    try {
      final materialRequestId = Uri.encodeComponent(materialRequest.id);

      await dio.delete<Map<String, dynamic>>(
        '$materialRequestPath/$materialRequestId',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestClose({
    required String accessToken,
    required MaterialRequest materialRequest,
  }) async {
    final id = Uri.encodeComponent(materialRequest.id);
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/$id/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestsDelete({
    required String accessToken,
    required String id,
  }) async {
    final enCodeId = Uri.encodeComponent(id);
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialRequestPath/$enCodeId',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestsDeleteAll({
    required String accessToken,
    required String id,
  }) async {
    final enCodeId = Uri.encodeComponent(id);
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialRequestPath/$enCodeId/details/delete-all',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Material Request Detail
  Future<List<PurchaseRequestDetail>> purchaseRequestDetailFetch({
    required String accessToken,
    required String purchaseRequestId,
    PurchaseRequestDetailStatus? status,
  }) async {
    try {
      final id = Uri.encodeComponent(purchaseRequestId);
      final queryParameters = <String, dynamic>{
        'status.eq': status?.id,
      };

      final response = await dio.get<Map<String, dynamic>>(
        '$materialRequestPath/$id/details',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialRequestDetails = <PurchaseRequestDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialRequestDetails
            .add(PurchaseRequestDetail.fromJson(data as Map<String, dynamic>));
      }

      return materialRequestDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PurchaseRequestDetail>> purchaseRequestDetailPrintFetch({
    required String accessToken,
    required DateTime? periodStart,
    required DateTime? periodEnd,
    required List<MaterialGroup>? materialGroupIdIn,
    required List<Department>? departmentIdIn,
    required bool? isRequestForm,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (periodStart != null) {
        queryParameters['created_at.gte'] = periodStart.yyyyMMdd;
      }

      if (periodEnd != null) {
        queryParameters['created_at.lte'] = periodEnd.yyyyMMdd;
      }

      if (materialGroupIdIn != null && materialGroupIdIn.isNotEmpty) {
        queryParameters['material_group_id.in'] = materialGroupIdIn.map((x) {
          return x.id;
        }).join(',');
      }

      if (departmentIdIn != null && departmentIdIn.isNotEmpty) {
        queryParameters['department_id.in'] = departmentIdIn.map((x) {
          return x.id;
        }).join(',');
      }

      queryParameters['is_request_form.eq'] = isRequestForm ?? true;

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/print/material-request-forms/details',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialRequestDetails = <PurchaseRequestDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialRequestDetails.add(
          PurchaseRequestDetail.fromJson(
            data as Map<String, dynamic>,
          ),
        );
      }

      return materialRequestDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<RequestFormDetail>> requestFormDetailFetch({
    required String accessToken,
    required MaterialRequest materialRequest,
    required RequestFormDetailStatus? status,
    required PageOptions<RequestFormDetail> pageOptions,
  }) async {
    try {
      final id = Uri.encodeComponent(materialRequest.id);
      final queryParameters = <String, dynamic>{};
      if (status != null) {
        queryParameters['status.eq'] = status.id;
      }
      queryParameters.addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '$materialRequestPath/$id/details',
        // queryParameters: queryParameters,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, RequestFormDetail.fromJson);

      // final materialRequestDetails = <RequestFormDetail>[];
      // final data = response.data!['data'] as List;

      // for (final data in data) {
      //   materialRequestDetails
      //       .add(RequestFormDetail.fromJson(data as Map<String, dynamic>));
      // }

      // return materialRequestDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<RequestFormMaterial>> requestFormMaterialFetch({
    required String accessToken,
    required MaterialGroup materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$requestFormPath/materials',
        queryParameters: {
          'material_group_id.eq': materialGroup.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialRequestDetails = <RequestFormMaterial>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialRequestDetails
            .add(RequestFormMaterial.fromJson(data as Map<String, dynamic>));
      }

      return materialRequestDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Print
  Future<void> materialRequestPrint({
    required String accessToken,
    required MaterialRequest materialRequest,
  }) async {
    try {
      final id = Uri.encodeComponent(materialRequest.id);
      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/$id/print',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<PurchaseRequestDetail>> purchaseRequestAllDetailFetch({
    required String accessToken,
    required Department? department,
    required MaterialGroup? materialGroup,
    PurchaseRequestStatus? status,
    required List<Department>? departmentIdIn,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'is_request_form.eq': false,
      };
      late PurchaseRequestStatus parameterStatus;
      if (status != null) {
        parameterStatus = status;
      } else {
        parameterStatus = PurchaseRequestStatus.input;
      }
      if (status != null) {
        queryParameters['status.eq'] = parameterStatus.id;
      }

      if (department != null) {
        queryParameters['department_id.eq'] = department.id;
      }

      if (materialGroup != null) {
        queryParameters['material_group_id.eq'] = materialGroup.id;
      }

      if (departmentIdIn != null && departmentIdIn.isNotEmpty) {
        queryParameters['department_id.in'] = departmentIdIn.map((x) {
          return x.id;
        }).join(',');
      }

      final response = await dio.get<Map<String, dynamic>>(
        '$materialRequestPath/details',
        queryParameters: queryParameters..addAll({'limit': 90000}),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <PurchaseRequestDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(PurchaseRequestDetail.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Future<List<RequestFormDetail>>
  Future<PageOptions<RequestFormDetail>> requestFormAllDetailFetch({
    required String accessToken,
    required PageOptions<RequestFormDetail> pageOptions,
    PurchaseRequestStatus? status,
    Department? department,
    required List<Department>? departments,
    MaterialGroup? materialGroup,
    bool? isRequestForm,
  }) async {
    try {
      late String parameter;
      if (status != null) {
        parameter = status.id;
      } else {
        parameter = 'INPUT';
      }

      final queryParameters = <String, dynamic>{
        'status.eq': parameter,
        'department_id.eq': department?.id,
        'material_group_id.eq': materialGroup?.id ?? '',
        'is_request_form.eq': isRequestForm,
        'department_id.in': departments?.map((e) => e.id).join(','),
      }
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(
          pageOptions.toUrlQueryMap(),
        );

      final response = await dio.get<Map<String, dynamic>>(
        '$materialRequestPath/details',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, RequestFormDetail.fromJson);
      // final lines = <RequestFormDetail>[];
      // final data = response.data!['data'] as List;

      // for (final data in data) {
      //   lines.add(RequestFormDetail.fromJson(data as Map<String, dynamic>));
      // }

      // return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailCreate({
    required String accessToken,
    required MaterialRequest materialRequest,
    required RequestFormDetail materialRequestDetail,
  }) async {
    try {
      final id = Uri.encodeComponent(materialRequest.id);
      await dio.post<Map<String, dynamic>>(
        '$requestFormPath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_type_id': materialRequestDetail.materialType?.id == ''
              ? null
              : materialRequestDetail.materialType?.id,
          'material_id': materialRequestDetail.material?.id == ''
              ? null
              : materialRequestDetail.material?.id,
          'unit_id': materialRequestDetail.material?.id == '' ||
                  materialRequestDetail.material?.materialUnit.id == ''
              ? 'PCS'
              : materialRequestDetail.material?.materialUnit.id,
          'quantity': materialRequestDetail.quantity,
          'is_fast_track': materialRequestDetail.isFastTrack,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailCreate({
    required String accessToken,
    required MaterialRequest materialRequest,
    required PurchaseRequestDetail materialRequestDetail,
  }) async {
    try {
      final id = Uri.encodeComponent(materialRequest.id);
      final body = {
        'material_id': materialRequestDetail.material?.id == ''
            ? null
            : materialRequestDetail.material?.id,
        'unit_id': materialRequestDetail.unit.id,
        'design_code_id': materialRequestDetail.materialDesign?.id == 0
            ? null
            : materialRequestDetail.materialDesign?.id,
        'product_id': materialRequestDetail.product?.id == ''
            ? null
            : materialRequestDetail.product?.id,
        'quantity': materialRequestDetail.quantity,
        'is_fast_track': materialRequestDetail.isFastTrack,
        'batch_no': materialRequestDetail.batchNo,
      };

      await dio.post<Map<String, dynamic>>(
        '$materialRequestPath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(body),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailConfirm({
    required String accessToken,
    required List<PurchaseRequestDetail> materialRequestDetail,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      String dataPut;
      if (materialGroup != null) {
        dataPut =
            jsonEncode({'id': dataId, 'material_group_id': materialGroup.id});
      } else {
        dataPut = jsonEncode({'id': dataId});
      }

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailApprove({
    required String accessToken,
    required List<RequestFormDetail> requestFormDetail,
  }) async {
    try {
      final id = <int>[];
      for (var i = 0; i < requestFormDetail.length; i++) {
        id.add(requestFormDetail[i].id);
      }
      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailConfirm({
    required String accessToken,
    required List<RequestFormDetail> materialRequestDetail,
    MaterialGroup? materialGroup,
    MaterialRequest? materialRequest,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      final dataPut = jsonEncode(
        {
          'id': dataId,
          'material_group_id': materialGroup!.id,
          'material_request_form_id': materialRequest!.id,
        },
      );

      await dio.put<Map<String, dynamic>>(
        '$requestFormPath/details/confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailDelete({
    required String accessToken,
    required RequestFormDetail materialRequestDetails,
  }) async {
    try {
      await dio.delete<String>(
        '$materialRequestDetail/${materialRequestDetails.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailClose({
    required String accessToken,
    required RequestFormDetail materialRequestDetail,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$requestFormPath/details/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': [materialRequestDetail.id],
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailCloseAll({
    required String accessToken,
    required List<RequestFormDetail> materialRequestDetail,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }
      await dio.put<Map<String, dynamic>>(
        '$requestFormPath/details/close',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': dataId,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailReject({
    required String accessToken,
    required List<PurchaseRequestDetail> materialRequestDetail,
    required String reason,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      final dataPut = jsonEncode(
        {
          'id': dataId,
          'reject_reason': reason,
        },
      );

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/reject',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailUndoConfirm({
    required String accessToken,
    required List<PurchaseRequestDetail> materialRequestDetail,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      final dataPut = jsonEncode(
        {
          'id': dataId,
        },
      );

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/undo-confirm',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailRejectManager({
    required String accessToken,
    required List<PurchaseRequestDetail> materialRequestDetail,
    required String reason,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      final dataPut = jsonEncode(
        {
          'id': dataId,
          'reject_reason': reason,
        },
      );

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/reject-manager',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> requestFormDetailReject({
    required String accessToken,
    required List<RequestFormDetail> materialRequestDetail,
    required String reason,
  }) async {
    try {
      final dataId = <int>[];
      for (var index = 0; index < materialRequestDetail.length; index++) {
        dataId.add(materialRequestDetail[index].id);
      }

      final dataPut = jsonEncode(
        {
          'id': dataId,
          'reject_reason': reason,
        },
      );

      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/reject-manager',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: dataPut,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailUpdate({
    required String accessToken,
    required String id,
    required String material,
    required String designCodeId,
    required String batchNo,
    required String product,
    required String quantity,
    required bool isFastTrack,
  }) async {
    final enCodeId = Uri.encodeComponent(id);
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialRequestPath/details/$enCodeId',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'material': material,
          'design_code_id': designCodeId,
          'batchNo': batchNo,
          'product': product,
          'quantity': int.parse(quantity),
          'status': '',
          'is_fast_track': isFastTrack,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRequestDetailDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialRequestDetail/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
