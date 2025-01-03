import 'dart:convert';

import 'package:flexurio_chiron_production/src/app/model/formulation_quantity.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
import 'package:flexurio_chiron_material_stock/src/app/model/material_retest.dart';
import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:flexurio_chiron_material/src/app/model/sertificate_documents.dart';
import 'package:flexurio_chiron_material/src/app/model/unit_convert.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_material/src/app/model/leadtime_material.dart';
import 'package:flexurio_chiron_material/src/app/model/material.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material/src/app/model/material_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_purchase_order/flexurio_chiron_purchase_order.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/foundation.dart';

class MaterialRepository extends Repository {
  MaterialRepository({required super.dio, required super.onUnauthorized});

  static final materialPath = '${Api.urlApi}/materials';
  static final materialGroupPath = '$materialPath/groups';
  static final materialUnitPath = '$materialPath/units';
  static final unitConvertPath = '$materialPath/unit-converts';
  static final materialApprovedVendorListPath =
      '${Api.urlApi}/material-approved-vendors/lists';
  static final materialTypePath = '$materialPath/types';
  static final certificateDocumentsPath = '${Api.urlApi}/certificate-documents';
  static final pathSuppliers = '${Api.urlApi}/suppliers';
  static final pathVendors = '${Api.urlApi}/vendors';
  static final materialRetestPath = '${Api.urlApi}/material-retests';
  static final materialIssuesPath = '${Api.urlApi}/material-issues';
  static get materialReturnPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/material-returns'
              : '${Api.urlApi}/material-returns';

  static get reportFormMaterialReturnPath => ({
        required bool isExternal,
      }) =>
          isExternal
              ? '${Api.urlApi}/external/report-form-material-returns'
              : '${Api.urlApi}/report-form-material-returns';
  static final materialIssuePath = '${Api.urlApi}/material-issues';
  static final materialStockPath = '${Api.urlApi}/material-stocks';
  static final formulationPath = '${Api.urlApi}/formulations';
  static final materialReturnNotePath =
      '${Api.urlApi}/return-notes/account-payables';
  static final materialReceivePath = '$materialPath/receives';

  static MaterialRepository instance = MaterialRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  // Material Group
  Future<PageOptions<MaterialGroup>> materialGroupFetch({
    required String accessToken,
    required PageOptions<MaterialGroup> pageOptions,
    MaterialGroupCategory? materialGroupCategory,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (materialGroupCategory != null) {
        queryParameters['group_category.eq'] = materialGroupCategory.id;
      } else {
        queryParameters.clear();
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '');

      final response = await dio.get<Map<String, dynamic>>(
        materialGroupPath,
        queryParameters: queryParameters..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialGroup.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialGroupCreate({
    required String accessToken,
    required String id,
    required MaterialGroupCategory category,
    required bool hasVendor,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialGroupPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'group_category': category.id,
          'has_vendor': hasVendor,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialGroupDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialGroupPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Material Unit
  Future<PageOptions<MaterialUnit>> materialUnitFetch({
    required String accessToken,
    required PageOptions<MaterialUnit> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialUnitPath,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialUnit.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialUnitCreate({
    required String accessToken,
    required String type,
    required String id,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialUnitPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'id': id, 'Type': type}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialUnitUpdate({
    required String accessToken,
    required String type,
    required String id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialUnitPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({'Type': type}),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialUnitDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialUnitPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Unit Convert
  Future<PageOptions<UnitConvert>> unitConvertFetch({
    required PageOptions<UnitConvert> pageOptions,
    required String accessToken,
    required MaterialUnit unitFrom,
    required MaterialUnit unitTo,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        unitConvertPath,
        queryParameters: {
          'material_unit_id.eq': unitFrom.id,
          'converted_unit_id.eq': unitTo.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, UnitConvert.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> unitConvertCreate({
    required String accessToken,
    required String convertFormula,
    required MaterialUnit unit,
    required MaterialUnit convertedUnit,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        unitConvertPath,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        data: jsonEncode({
          'convert_formula': convertFormula,
          'material_unit_id': unit.id,
          'converted_unit_id': convertedUnit.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> unitConvertEdit({
    required String accessToken,
    required int id,
    required String convertFormula,
    required MaterialUnit unit,
    required MaterialUnit convertedUnit,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$unitConvertPath/$id',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
        data: jsonEncode({
          'convert_formula': convertFormula,
          'material_unit_id': unit.id,
          'converted_unit_id': convertedUnit.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> unitConvertDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$unitConvertPath/$id',
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

  Future<List<Supplier>> supplierFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathSuppliers,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <Supplier>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(Supplier.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Vendor>> vendorFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathVendors,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <Vendor>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(Vendor.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialSupplierLeadTime>> materialSupplierFetch({
    required String accessToken,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/material-lead-times',
        queryParameters: {
          'material_id.eq': material?.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <MaterialSupplierLeadTime>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(
          MaterialSupplierLeadTime.fromJson(data as Map<String, dynamic>),
        );
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialSupplierLeadTime>> materialSupplierFetchByMaterialId({
    required String accessToken,
    Material? material,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/material-lead-times',
        queryParameters:
            material != null ? {'material_id.eq': material.id} : {},
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final lines = <MaterialSupplierLeadTime>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(
          MaterialSupplierLeadTime.fromJson(data as Map<String, dynamic>),
        );
      }
      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialSupplierLeadTime> materialSupplierCreate({
    required String accessToken,
    required int leadTimePurch,
    required String materialId,
    required String supplierId,
  }) async {
    try {
      final data = jsonEncode({
        'lead_time': leadTimePurch,
        'material_id': materialId,
        'vendor_id': supplierId,
      });

      final response = await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/material-lead-times',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );

      return MaterialSupplierLeadTime.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialSupplierLeadTime> materialSupplierUpdate({
    required String accessToken,
    required MaterialSupplierLeadTime materialSupplierLeadTime,
    required int leadTimePurch,
    required String materialId,
  }) async {
    try {
      final data = jsonEncode({
        'lead_time': leadTimePurch,
        'material_id': materialId,
        'vendor_id': materialSupplierLeadTime.vendor.id,
      });

      final response = await dio.put<Map<String, dynamic>>(
        '${Api.urlApi}/material-lead-times/${materialSupplierLeadTime.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return MaterialSupplierLeadTime.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialSupplierDelete({
    // Future<String> materialSupplierDelete({
    required String accessToken,
    required MaterialSupplierLeadTime materialSupplierLeadTime,
  }) async {
    try {
      // final message =
      // Map<String, dynamic>
      await dio.delete<void>(
        '${Api.urlApi}/material-lead-times/${materialSupplierLeadTime.id}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      // return message.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Material Type
  Future<PageOptions<MaterialType>> materialTypeFetch({
    required String accessToken,
    required PageOptions<MaterialType> pageOptions,
    MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialTypePath,
        queryParameters: {
          'material_group_id.eq': materialGroup?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialType.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> materialTypeCreate({
    required String accessToken,
    required String type,
    required MaterialGroup materialGroup,
  }) async {
    try {
      final message = await dio.post<Map<String, dynamic>>(
        materialTypePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'id': type,
            'material_group_id': materialGroup.id,
          },
        ),
      );
      return message.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<String> materialTypeDelete({
    required String accessToken,
    required MaterialType materialType,
  }) async {
    try {
      final message = await dio.delete<Map<String, dynamic>>(
        '$materialTypePath/${materialType.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return message.data!['message'] as String;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Material Approve Vendor List
  Future<PageOptions<MaterialApprovedVendor>> materialApprovedVendorFetch({
    required PageOptions<MaterialApprovedVendor> pageOptions,
    required String accessToken,
    String? materialId,
    String? vendorId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialApprovedVendorListPath,
        queryParameters: <String, dynamic>{
          'material_id.eq': materialId,
          'vendor_id.eq': vendorId,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialApprovedVendor.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialApprovedVendorCreate({
    required String accessToken,
    required String materialId,
    required String vendorId,
    required String supplierId,
    required String certificateDocumentId,
    required String halalInstitution,
    required String halalNoCertificate,
    required String description,
    required String storageProcedure,
    required String category,
    required String type,
    DateTime? halalCertificateExpired,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialApprovedVendorListPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_id': materialId,
          'vendor_id': vendorId,
          'supplier_id': supplierId,
          'certificate_document_id': certificateDocumentId,
          'halal_certificate_expired':
              halalCertificateExpired?.toUtc().toIso8601String(),
          'halal_institution': halalInstitution,
          'halal_no_certificate': halalNoCertificate,
          'description': description,
          'storage_procedure': storageProcedure,
          'category': category,
          'type': type,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialApprovedVendorUpdate({
    required String accessToken,
    required int id,
    required String materialId,
    required String vendorId,
    required String supplierId,
    required String certificateDocumentId,
    required String description,
    required String storageProcedure,
    required String category,
    required String type,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialApprovedVendorListPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_id': materialId,
          'vendor_id': vendorId,
          'supplier_id': supplierId,
          'certificate_document_id': certificateDocumentId,
          'description': description,
          'storage_procedure': storageProcedure,
          'category': category,
          'type': type,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialApprovedVendorEditHalalCertificate({
    required String accessToken,
    required MaterialApprovedVendor materialApprovedVendor,
    required DateTime halalCertificateExpired,
    required String halalInstitution,
    required String halalNoCertificate,
  }) async {
    final id = materialApprovedVendor.id;
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialApprovedVendorListPath/$id/halal-certificate',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'halal_certificate_expired':
              halalCertificateExpired.toUtc().toIso8601String(),
          'halal_institution': halalInstitution,
          'halal_no_certificate': halalNoCertificate,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialApprovedVendorDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$materialApprovedVendorListPath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<SertificateDocuments>> sertificateDocumentsFetch({
    required String accessToken,
    required PageOptions<SertificateDocuments> pageOptions,
  }) async {
    try {
      final queryParameters = <String, dynamic>{}..addAll(
          pageOptions.toUrlQueryMap(),
        );
      final response = await dio.get<Map<String, dynamic>>(
        certificateDocumentsPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, SertificateDocuments.fromJson);
      // final lines = <SertificateDocuments>[];
      // final data = response.data!['data'] as List;

      // for (final data in data) {
      //   lines.add(SertificateDocuments.fromJson(data as Map<String, dynamic>));
      // }

      // return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReturnNote>> materialReturnNoteFetch({
    required String accessToken,
    required PageOptions<MaterialReturnNote> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReturnNotePath,
        queryParameters: {
          'page': pageOptions.page,
          'search': pageOptions.search,
          'sort': 'return_notes.created_at',
          'ascending': pageOptions.ascending,
          'limit': pageOptions.rowsPerPage,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialReturnNote.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReturnNoteDetail> materialReturnNoteDetailFetch({
    required String accessToken,
    required MaterialReturnNote materialReturnNote,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReturnNote.id);
      final result = await dio.get<Map<String, dynamic>>(
        '$materialReturnNotePath/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final data = result.data!['data'] as Map<String, dynamic>;

      return MaterialReturnNoteDetail.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialStock>> materialStockFetch({
    required String accessToken,
    Material? material,
    MaterialIssueDetail? materialIssueDetail,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialStockPath,
        queryParameters: {
          'materials_id.eq': material?.id ?? '',
          'na.eq': materialIssueDetail?.na ?? '',
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialStocks = <MaterialStock>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialStocks
            .add(MaterialStock.fromJson(data as Map<String, dynamic>));
      }

      return materialStocks;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<FormulationQuantity> formulationQuantities({
    required String accessToken,
    required Product product,
    required Material material,
  }) async {
    try {
      final id = Uri.encodeComponent(product.id);
      final response = await dio.get<Map<String, dynamic>>(
        '$formulationPath/products/$id/materials/${material.id}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>;

      return FormulationQuantity.fromJson(
        data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Material Return
  Future<PageOptions<MaterialReturn>> materialReturnFetch({
    required String accessToken,
    required bool isExternal,
    required PageOptions<MaterialReturn> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReturnPath(isExternal: isExternal),
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, MaterialReturn.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReturnNa>> materialReturnFetchNa({
    required String accessToken,
    bool isExternal = false,
    String? materialId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: isExternal)}/nas',
        queryParameters: {
          'material_id.eq': materialId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialReturnNas = <MaterialReturnNa>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialReturnNas
            .add(MaterialReturnNa.fromJson(data as Map<String, dynamic>));
      }

      return materialReturnNas;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReturnMaterial>> materialReturnFetchMaterial({
    required String accessToken,
    String? materialGroupId,
    String? productId,
    String? batchId,
    required bool isExternal,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: isExternal)}/materials',
        queryParameters: {
          'material_group_id.eq': materialGroupId,
          'product_id.eq': productId,
          'production_order_id.eq': batchId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialReturnMaterials = <MaterialReturnMaterial>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialReturnMaterials
            .add(MaterialReturnMaterial.fromJson(data as Map<String, dynamic>));
      }

      return materialReturnMaterials;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReturnMaterial>> materialReturnFetchMaterialByFilter({
    required String accessToken,
    required MaterialReturnDetail details,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: false)}/nas/${details.na}',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialReturnMaterials = <MaterialReturnMaterial>[];
      final data = response.data!['data'];

      materialReturnMaterials
          .add(MaterialReturnMaterial.fromJson(data as Map<String, dynamic>));

      return materialReturnMaterials;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReturn> materialReturnProductCreate({
    required String accessToken,
    required MaterialReturnFormProduct materialReturnFormProduct,
    required bool isExternal,
  }) async {
    try {
      String data;
      if (materialReturnFormProduct.product == null) {
        data = jsonEncode(
          {
            'material_group_id': materialReturnFormProduct.materialGroup.id,
            'department_id': materialReturnFormProduct.department.id,
            'remarks': materialReturnFormProduct.remarks,
            'return_type_id': materialReturnFormProduct.transactionType.id,
          },
        );
      } else {
        data = jsonEncode(
          {
            'material_group_id': materialReturnFormProduct.materialGroup.id,
            'department_id': materialReturnFormProduct.department.id,
            'remarks': materialReturnFormProduct.remarks,
            'return_type_id': materialReturnFormProduct.transactionType.id,
            'product_id': materialReturnFormProduct.product!.id,
            'batch_no': materialReturnFormProduct.productionOrder!.id,
          },
        );
      }
      final response = await dio.post<Map<String, dynamic>>(
        materialReturnPath(isExternal: isExternal),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return MaterialReturn.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReturn> materialReturnNonProductCreate({
    required String accessToken,
    required MaterialReturnFormProduct materialReturnFormProduct,
  }) async {
    try {
      final data = jsonEncode(
        {
          'material_group_id': materialReturnFormProduct.materialGroup.id,
          'department_id': materialReturnFormProduct.department.id,
          'remarks': materialReturnFormProduct.remarks,
          'return_type_id': materialReturnFormProduct.transactionType.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        materialReturnPath(isExternal: false),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return MaterialReturn.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReturnDelete({
    required String accessToken,
    required MaterialReturn materialReturn,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReturn.id);
      await dio.delete<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: false)}/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReturnDetail>> materialReturnDetailFetch({
    required String accessToken,
    required bool isExternal,
    required MaterialReturn materialReturn,
  }) async {
    try {
      debugPrintStack();
      final id = Uri.encodeComponent(materialReturn.id);
      final response = await dio.get<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: isExternal)}/$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final materialReturnDetails = <MaterialReturnDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialReturnDetails
            .add(MaterialReturnDetail.fromJson(data as Map<String, dynamic>));
      }
      return materialReturnDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<ReportFormMaterialReturn>> reportFormMaterialReturn({
    required String accessToken,
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) async {
    try {
      debugPrintStack();
      final response = await dio.get<Map<String, dynamic>>(
        '${reportFormMaterialReturnPath(isExternal: isExternal)}',
        queryParameters: {
          'material_return_id.eq': materialReturn.id,
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final materialReturnDetails = <ReportFormMaterialReturn>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialReturnDetails.add(
            ReportFormMaterialReturn.fromJson(data as Map<String, dynamic>));
      }
      return materialReturnDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReturnDetailCreate({
    required String accessToken,
    required MaterialReturnDetail materialReturnDetail,
    required MaterialReturn materialReturn,
    required bool isExternal,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: isExternal)}/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'material_return_id': materialReturn.id,
            'material_id': materialReturnDetail.material.id,
            'material_unit_id': materialReturnDetail.materialUnit.id,
            'na': materialReturnDetail.na,
            'quantity': materialReturnDetail.quantity,
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReturnDetail> materialReturnDetailEdit({
    required String accessToken,
    required MaterialReturnDetail materialReturnDetail,
  }) async {
    try {
      final data = jsonEncode(
        {
          'material_return_id': materialReturnDetail.materialReturn.id,
          'material_id': materialReturnDetail.material.id,
          'material_unit_id': materialReturnDetail.material.materialUnit.id,
          'na': materialReturnDetail.na,
          'quantity': materialReturnDetail.quantity,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: false)}/details/${materialReturnDetail.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return MaterialReturnDetail.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReturnDetailDelete({
    required String accessToken,
    required MaterialReturnDetail materialReturnDetail,
  }) async {
    try {
      final id = materialReturnDetail.id;
      await dio.delete<Map<String, dynamic>>(
        '${materialReturnPath(isExternal: false)}/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialReceive>> materialReceiveFetch({
    required String accessToken,
    PurchaseOrder? purchaseOrder,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialReceivePath,
        queryParameters: {'purchase_order_id.eq': purchaseOrder?.id},
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final materialReceives = <MaterialReceive>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        materialReceives
            .add(MaterialReceive.fromJson(data as Map<String, dynamic>));
      }

      return materialReceives;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReceive> materialReceiveFetchById({
    required String accessToken,
    String? materialReceiveId,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceiveId!);
      final response = await dio.get<Map<String, dynamic>>(
        '$materialReceivePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      final data = response.data!['data'] as Map<String, dynamic>;

      return MaterialReceive.fromJson(data);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReceive> materialReceiveCreatePurchaseOrder({
    required String accessToken,
    required MaterialReceiveCreateForm createForm,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        materialReceivePath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'transaction_type_id': createForm.transactionType.id,
          'purchase_order_id': createForm.purchaseOrder?.id,
          'delivery_order_id': createForm.deliveryOrderId,
          'delivery_order_date':
              createForm.deliveryOrderDate?.toUtc().toIso8601String(),
          'warehouse': createForm.warehouse,
          'description': createForm.description,
        }),
      );

      return MaterialReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<MaterialReceive> materialReceiveCreateNonPurchaseOrder({
    required String accessToken,
    required MaterialReceiveCreateForm createForm,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '$materialReceivePath/non-po',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'transaction_type_id': createForm.transactionType.id,
          'material_group_id': createForm.materialGroup?.id,
          'department_id': createForm.department?.id,
          'vendor_id': createForm.vendor?.id,
          'delivery_order_id': createForm.deliveryOrderId,
          'delivery_order_date':
              createForm.deliveryOrderDate?.toUtc().toIso8601String(),
          'description': createForm.description,
          'warehouse': createForm.warehouse,
        }),
      );

      return MaterialReceive.fromJson(
        response.data!['data'] as Map<String, dynamic>,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveEdit({
    required String accessToken,
    required MaterialReceive materialReceive,
    required String description,
    required WarehouseMaterialReceive warehouse,
    required String? deliveryOrderId,
    required DateTime? deliveryOrderDate,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceive.id);
      final data = jsonEncode({
        'description': description,
        'warehouse': warehouse.id,
        'delivery_order_id': deliveryOrderId,
        'delivery_order_date': deliveryOrderDate?.toUtcIso()
      });
      await dio.put<Map<String, dynamic>>(
        '$materialReceivePath/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveDetail>> materialReceiveDetailFetch({
    required String accessToken,
    required PageOptions<MaterialReceiveDetail> pageOptions,
    MaterialReceive? materialReceive,
    DateTime? period,
    String? materialStatusQc,
    String? materialGroupId,
  }) async {
    try {
      var path = materialReceivePath;
      if (materialReceive != null) {
        final id = Uri.encodeComponent(materialReceive.id);
        path += '/$id';
      }
      final response = await dio.get<Map<String, dynamic>>(
        '$path/details',
        queryParameters: {
          'material_status_qc.eq': materialStatusQc,
          'material_group_id.in': materialGroupId,
          // 'period.eq': DateFormat('yyyyMM').format(period ?? DateTime.now()),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveDetail>> materialReceiveDetailPrintFetch({
    required String accessToken,
    required PageOptions<MaterialReceiveDetail> pageOptions,
    DateTime? createdAtGte,
    DateTime? createdAtLte,
    List<WarehouseMaterialReceive>? warehouseIn,
    List<MaterialGroup>? materialGroupIn,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$materialReceivePath/details',
        queryParameters: {
          'warehouse.in': warehouseIn!.map((e) {
            return e.id;
          }).join(','),
          'material_group_id.in': materialGroupIn!.map((e) {
            return e.id;
          }).join(','),
          'created_at.gte': createdAtGte!.yyyyMMdd,
          'created_at.lte': createdAtLte!.yyyyMMdd,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialReceiveDetail>> materialReceiveDetailNaFetch({
    required String accessToken,
    required PageOptions<MaterialReceiveDetail> pageOptions,
    Material? material,
    DateTime? expiredDateLte,
    String? materialStatusQc,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$materialReceivePath/details',
        queryParameters: {
          'material_id.eq': material?.id,
          'expired_date.gte': expiredDateLte?.toUtc().toIso8601String(),
          'material_status_qc.eq': materialStatusQc,
          // 'expired_date.lte': DateFormat('yyyy-MM-dd').format(expiredDateLte ?? DateTime.now()),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(response, MaterialReceiveDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailCreate({
    required String accessToken,
    required MaterialReceive materialReceive,
    required MaterialReceiveDetail materialReceiveDetail,
    required MaterialReceiveType type,
  }) async {
    try {
      final id = Uri.encodeComponent(materialReceive.id);
      late String endpoint;
      if (type == MaterialReceiveType.purchaseOrder) {
        endpoint = '/';
      } else if (type == MaterialReceiveType.nonPurchaseOrder) {
        endpoint = '/non-po/';
      }
      final data = jsonEncode(
        {
          'material_id': materialReceiveDetail.material.id,
          'design_code_id': materialReceiveDetail.materialDesign?.id,
          'batch_no': materialReceiveDetail.batchNo,
          'vat_total': materialReceiveDetail.vatTotal,
          'quantity': materialReceiveDetail.quantity,
          'expired_date':
              materialReceiveDetail.expiredDate?.toUtc().toIso8601String(),
          'best_before':
              materialReceiveDetail.bestBefore?.toUtc().toIso8601String(),
          'manufacturing_date': materialReceiveDetail.manufacturingDate
              ?.toUtc()
              .toIso8601String(),
          'retest_date':
              materialReceiveDetail.retestDate?.toUtc().toIso8601String(),
          'shelf_life':
              materialReceiveDetail.shelfLife?.toUtc().toIso8601String(),
        },
      );
      await dio.post<Map<String, dynamic>>(
        '$materialReceivePath$endpoint$id/details',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialReceiveDetailEdit({
    required String accessToken,
    required MaterialReceiveDetail materialReceiveDetail,
    required String batchNo,
    required DateTime? expiredDate,
    required DateTime? bestBefore,
    required DateTime? manufacturingDate,
    required DateTime? shelfLife,
    required DateTime? retestDate,
  }) async {
    try {
      final id = materialReceiveDetail.id;
      final data = jsonEncode(
        {
          'batch_no': batchNo,
          'expired_date': expiredDate?.toUtc().toIso8601String(),
          'best_before': bestBefore?.toUtc().toIso8601String(),
          'manufacturing_date': manufacturingDate?.toUtc().toIso8601String(),
          'shelf_life': shelfLife?.toUtc().toIso8601String(),
          'retest_date': retestDate?.toUtc().toIso8601String(),
        },
      );
      await dio.put<Map<String, dynamic>>(
        '$materialReceivePath/details/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialAnalysisCreate({
    required String accessToken,
    required String? materialReceiveId,
    required String? supplierId,
    required String? materialGroupId,
    required String? materialId,
    required String? materialUnitId,
    required String? batchNo,
    required double? density,
    required double? qtySample,
    required DateTime? samplingDate,
    required int? samplingBy,
    required double? qtyRetainSample,
    required DateTime? retainSamplingDate,
    required int? retainSamplingBy,
    required int? qtyPackOpened,
    required int? qtyPackTotal,
    required String? na,
    required double? assay,
    required String? warehouse,
    required DateTime? microbiologyReleaseDate,
    required int? microbiologyReleaseBy,
    required bool? coaAvailability,
    required DateTime? materialReceiptDate,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '${Api.urlApi}/material-analysis',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            "material_receive_id": materialReceiveId,
            "supplier_id": supplierId,
            "material_group_id": materialGroupId,
            "material_id": materialId,
            "material_unit_id": materialUnitId,
            "batch_no": batchNo,
            "density": density ?? 0,
            "qty_sample": qtySample,
            "sampling_date": samplingDate?.toUtcIso(),
            "sampling_by": samplingBy,
            "qty_retain_sample": qtyRetainSample,
            "retain_sampling_date": retainSamplingDate?.toUtcIso(),
            "retain_sampling_by": retainSamplingBy,
            "qty_pack_opened": qtyPackOpened,
            "qty_pack_total": qtyPackTotal,
            "na": na,
            "assay": assay,
            "warehouse": warehouse,
            "is_active": true,
            "microbiology_release_date": microbiologyReleaseDate?.toUtcIso(),
            "microbiology_release_by": microbiologyReleaseBy,
            "coa_availability": coaAvailability,
            "material_receipt_date": materialReceiptDate?.toUtcIso(),
          },
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<MaterialIssues>> materialIssuesFetch({
    required String accessToken,
    required String? transactionCode,
    required MaterialGroup? materialGroup,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        materialIssuesPath,
        queryParameters: {
          'transaction_code.eq': transactionCode,
          'material_group_id.eq': materialGroup?.id,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <MaterialIssues>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(MaterialIssues.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<MaterialRetest>> materialRetestFetch({
    required String accessToken,
    required PageOptions<MaterialRetest> pageOptions,
    MaterialGroup? materialGroup,
    Material? material,
    String? na,
    String? status,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'material_group_id.eq': materialGroup?.id,
        'material_id.eq': material?.id,
        'na.eq': na,
        'status.eq': status,
      }..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        materialRetestPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, MaterialRetest.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRetestCreate({
    required String accessToken,
    required MaterialGroup materialGroup,
    required Material material,
    required String na,
    required int quantityRetest,
    required DateTime expiredDate,
    required MaterialIssue materialIssue,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        materialRetestPath,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'material_id': material.id,
          'material_group_id': materialGroup.id,
          'na': na,
          'quantity_retest': quantityRetest,
          'expired_date': expiredDate.toUtc().toIso8601String(),
          'material_issue_id': materialIssue.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> materialRetestUpdate({
    required String accessToken,
    required MaterialRetest materialRetest,
    required String status,
    required DateTime retestDate,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$materialRetestPath/${materialRetest.id}/status',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'status': status,
          'retest_date': retestDate.toUtc().toIso8601String(),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Leadtime Material
  Future<List<LeadtimeMaterial>> leadtimeMaterialFetch({
    required String accessToken,
    required String leadtime,
    required List<MaterialGroup> listMaterialGroup,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (leadtime == 'With Leadtime') {
        queryParameters['leadtime.gt'] = 0;
      } else {
        queryParameters['leadtime.eq'] = 0;
      }

      if (listMaterialGroup.isNotEmpty) {
        queryParameters['material_group_id.in'] = 0;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '');

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/lead-time-material-reports',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final leadtimeMaterials = <LeadtimeMaterial>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        leadtimeMaterials
            .add(LeadtimeMaterial.fromJson(data as Map<String, dynamic>));
      }

      return leadtimeMaterials;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
