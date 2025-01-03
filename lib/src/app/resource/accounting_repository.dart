import 'dart:convert';

import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_data.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_location.dart';
import 'package:flexurio_chiron_accounting/src/app/model/asset_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/balance_group.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_realization.dart';
import 'package:flexurio_chiron_accounting/src/app/model/budget_type.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_group.dart';
import 'package:flexurio_chiron_accounting/src/app/model/chart_of_account_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';
import 'package:flexurio_chiron_accounting/src/app/model/cogs_detail.dart';
import 'package:flexurio_chiron_finance/src/app/model/currency.dart';
import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/ebitda.dart';
import 'package:flexurio_chiron_accounting/src/app/model/ebitda_recap.dart';
import 'package:flexurio_chiron_accounting/src/app/model/journal_estimation.dart';
import 'package:flexurio_chiron_finance/src/app/model/rate.dart';
import 'package:flexurio_chiron_tax/src/app/model/tax_invoice_number.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_journal_accounting.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_non_order.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_routine.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

class AccountingRepository extends Repository {
  AccountingRepository({required super.dio, required super.onUnauthorized});
  static final pathEbitda = '${Api.urlApi}/accountings/ebitda/report';
  static final pathEbitdaUpload = '${Api.urlApi}/accounting';
  static final pathRate = '${Api.urlApi}/accounting';
  static final pathCogs = '${Api.urlApi}/cogs/categories';
  static final pathCurrency = '${Api.urlApi}/accounting/currencies';
  static final pathBalanceGroup = '${Api.urlApi}/balance-groups';
  static final pathChartOfAccountGroup =
      '${Api.urlApi}/chart-of-account-groups';
  static final pathChartOfAccountNumber = '${Api.urlApi}/chart-of-accounts';
  static final pathBudgetType = '${Api.urlApi}/budget-types';
  static final pathTaxInvoiceNumber = '${Api.urlApi}/tax-invoice-counters';
  static final pathJournalEstimation = '${Api.urlApi}/journal-estimations';
  static final pathTransactionNonOrder = '${Api.urlApi}/non-orders';
  static final pathTransactionRoutine = '${Api.urlApi}/transaction-routines';
  static final pathTransactionJournalAccounting =
      '${Api.urlApi}/transaction-journal-accountings';
  static final pathAssetType = '${Api.urlApi}/asset-types';
  static final pathAssetLocation = '${Api.urlApi}/asset-locations';
  static final pathAssetData = '${Api.urlApi}/asset-datas';
  static final budgetRealizationPath =
      '${Api.urlApi}/budget-realization-reports';
  static AccountingRepository instance =
      AccountingRepository(dio: Api.dio, onUnauthorized: () {});

  // Asset Type
  Future<PageOptions<AssetType>> assetTypeFetch({
    required String accessToken,
    required PageOptions<AssetType> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathAssetType,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, AssetType.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetTypeUpdate({
    required AssetType assetType,
    required String name,
    required int amountOfDepreciation,
    required String accessToken,
    ChartOfAccountNumber? coa,
    ChartOfAccountNumber? coaInvoice,
    ChartOfAccountNumber? coaAccumulation,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'amount_of_depreciation': amountOfDepreciation,
          'coa_invoice_id': coaInvoice != null ? coaInvoice.id : '',
          'coa_id': coa != null ? coa.id : '',
          'coa_accumulation_id':
              coaAccumulation != null ? coaAccumulation.id : '',
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathAssetType/${assetType.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetTypeCreate({
    required String accessToken,
    required String id,
    required String name,
    required int amountOfDepreciation,
    ChartOfAccountNumber? coa,
    ChartOfAccountNumber? coaInvoice,
    ChartOfAccountNumber? coaAccumulation,
  }) async {
    try {
      final data = jsonEncode(
        {
          'id': id,
          'name': name,
          'amount_of_depreciation': amountOfDepreciation,
          'coa_invoice_id': coaInvoice != null ? coaInvoice.id : '',
          'coa_id': coa != null ? coa.id : '',
          'coa_accumulation_id':
              coaAccumulation != null ? coaAccumulation.id : '',
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathAssetType,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetTypeDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathAssetType/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AssetLocation>> assetLocationFetch({
    required String accessToken,
    required PageOptions<AssetLocation> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathAssetLocation,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, AssetLocation.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetLocationCreate({
    required String accessToken,
    required String id,
    required String name,
  }) async {
    try {
      final data = jsonEncode(
        {
          'id': id,
          'location_name': name,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathAssetLocation,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetLocationDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathAssetLocation/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AssetData>> assetDataFetch({
    required String accessToken,
    required PageOptions<AssetData> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathAssetData,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, AssetData.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetDataUpdate({
    required AssetData assetData,
    required Department department,
    required Supplier supplier,
    required String assetName,
    required int quantity,
    required MaterialUnit materialUnit,
    required double price,
    required String remark,
    required String serialNumber,
    required String accessToken,
    String? pic,
  }) async {
    try {
      final id = Uri.encodeComponent(assetData.id);
      final data = jsonEncode(
        {
          'department_id': department.id,
          'supplier_id': supplier.id,
          'asset_name': assetName,
          'quantity': quantity,
          'unit_id': materialUnit.id,
          'price': price,
          'remark': remark,
          'pic': pic ?? '',
          'serial_number': serialNumber,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathAssetData/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetDataCreate({
    required Department department,
    required Supplier supplier,
    required AssetType assetType,
    required AssetLocation assetLocation,
    required AssetLocation assetCurrentLocation,
    required DateTime date,
    required String assetName,
    required int quantity,
    required MaterialUnit materialUnit,
    required double price,
    required String remark,
    required String serialNumber,
    required String accessToken,
    String? pic,
  }) async {
    try {
      final data = jsonEncode(
        {
          'department_id': department.id,
          'supplier_id': supplier.id,
          'asset_type': assetType.id,
          'asset_location': assetLocation.id,
          'current_location': assetCurrentLocation.id,
          'date': date.toUtc().toIso8601String(),
          'asset_name': assetName,
          'quantity': quantity,
          'unit_id': materialUnit.id,
          'price': price,
          'remark': remark,
          'pic': pic ?? '',
          'serial_number': serialNumber,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathAssetData,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetDataNonActive({
    required AssetData assetData,
    required String note,
    required String accessToken,
  }) async {
    try {
      final id = Uri.encodeComponent(assetData.id);
      final data = jsonEncode(
        {
          'non_active_note': note,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathAssetData/nonactive/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetDataMoving({
    required AssetData assetData,
    required AssetLocation assetLocation,
    required String accessToken,
  }) async {
    try {
      final id = Uri.encodeComponent(assetData.id);
      final data = jsonEncode(
        {
          'current_location': assetLocation.id,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathAssetData/moving/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> assetDataDelete({
    required String accessToken,
    required String assetDataId,
  }) async {
    try {
      final id = Uri.encodeComponent(assetDataId);
      await dio.delete<Map<String, dynamic>>(
        '$pathAssetData/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Balance Group
  Future<void> balanceGroupCreate({
    required String accessToken,
    required BalanceGroupType type,
    required BalanceGroupCategory category,
    required String name,
    required String id,
  }) async {
    try {
      final result = await dio.post<Map<String, dynamic>>(
        pathBalanceGroup,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'name': name,
            'type': type.type,
            'category': category.label,
            'id': id,
          },
        ),
      );
      return result.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> balanceGroupDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathBalanceGroup/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<BalanceGroup>> balanceGroupFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathBalanceGroup,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final balanceGroup = <BalanceGroup>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        balanceGroup.add(BalanceGroup.fromJson(data as Map<String, dynamic>));
      }
      return balanceGroup;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Budget Realization
  Future<PageOptions<BudgetRealization>> budgetRealizationFetch({
    required String accessToken,
    required int year,
    required BudgetRealizationType type,
    required BudgetRealizationViewBy viewBy,
    required PageOptions<BudgetRealization> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        budgetRealizationPath,
        queryParameters: {
          'post_budget.eq': type.postBudget,
          'department_id${viewBy == BudgetRealizationViewBy.department ? '.ne' : '.eq'}':
              '-',
          'period.eq': year,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, BudgetRealization.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Budget Type
  Future<void> budgetTypeCreate({
    required String accessToken,
    required String name,
    required int level,
    required BudgetTypeDepartmentType departmentType,
    required BudgetTypeUsageType usageType,
    required int parent,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        pathBudgetType,
        data: jsonEncode({
          'name': name,
          'level': level,
          'department_type': departmentType.id,
          'usage_type': usageType.id,
          'parent': parent,
        }),
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

  Future<void> budgetTypeDelete({
    required String accessToken,
    required BudgetType budgetType,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathBudgetType/${budgetType.id}',
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

  Future<void> budgetTypeEdit({
    required String accessToken,
    required String name,
    required int id,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathBudgetType/$id',
        data: jsonEncode({
          'name': name,
        }),
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

  Future<List<BudgetType>> budgetTypeFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathBudgetType,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final budgetTypes = <BudgetType>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        budgetTypes.add(BudgetType.fromJson(data as Map<String, dynamic>));
      }
      return budgetTypes;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<BudgetType>> budgetTypeSummaryFetch({
    required String accessToken,
    required String chartOfAccountNumberID,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathBudgetType/coa/$chartOfAccountNumberID',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final budgetTypes = <BudgetType>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        final summary =
            BudgetTypeSummary.fromJson(data as Map<String, dynamic>);
        budgetTypes.add(
          BudgetType.empty().copyWith(
            id: summary.subtypeId,
            name: summary.subtypeName,
          ),
        );
      }
      return budgetTypes;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountGroupCreate({
    required String name,
    required String forecastNumber,
    required BalanceGroup balanceGroup,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'forecast_number': forecastNumber,
          'balance_group_id': balanceGroup.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathChartOfAccountGroup,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountGroupDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathChartOfAccountGroup/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Chart of Account
  Future<List<ChartOfAccountGroup>> chartOfAccountGroupFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathChartOfAccountGroup,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final chartOfAccountGroup = <ChartOfAccountGroup>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        chartOfAccountGroup
            .add(ChartOfAccountGroup.fromJson(data as Map<String, dynamic>));
      }
      return chartOfAccountGroup;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountGroupUpdate({
    required String id,
    required String name,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathChartOfAccountGroup/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountNumberCreate({
    required String name,
    required String number,
    required ChartOfAccountGroup chartOfAccountGroup,
    required ChartOfAccountNumberStatus status,
    required bool isFactoryOverhead,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode(
        {
          'id': number,
          'name': name,
          'status': status.id,
          'is_factory_overhead': isFactoryOverhead,
          'chart_of_account_group_id': chartOfAccountGroup.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathChartOfAccountNumber,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountNumberDelete({
    required String accessToken,
    required String id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathChartOfAccountNumber/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ChartOfAccountNumber>> chartOfAccountNumberFetch({
    required String accessToken,
    required PageOptions<ChartOfAccountNumber> pageOptions,
    String? chartOfAccountType,
    int? statusNotEqual,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathChartOfAccountNumber,
        queryParameters: {
          'chart_of_account_type': chartOfAccountType,
          'status.ne': statusNotEqual,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ChartOfAccountNumber.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ChartOfAccountNumber>>
      chartOfAccountNumberAccumulationFetch({
    required String accessToken,
    required PageOptions<ChartOfAccountNumber> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathChartOfAccountNumber,
        queryParameters: {'chart_of_account_group_id.eq': 104, 'status.ne': 0}
          ..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ChartOfAccountNumber.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ChartOfAccountNumber>> chartOfAccountNumberInvoiceFetch({
    required String accessToken,
    required PageOptions<ChartOfAccountNumber> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathChartOfAccountNumber,
        queryParameters: {'chart_of_account_group_id.eq': 605, 'status.ne': 0}
          ..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, ChartOfAccountNumber.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> chartOfAccountNumberUpdate({
    required String id,
    required String name,
    required String accessToken,
    required ChartOfAccountNumberStatus status,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'status': status.id,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathChartOfAccountNumber/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<CogsDetail>> cogsDetailFetch({
    required String accessToken,
    required int categoryId,
    required int month,
    required int year,
    required String division,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/cogs/categories/$categoryId/details',
        queryParameters: {
          'month.eq': month,
          'year.eq': year,
          'division': division,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final cogsDetails = <CogsDetail>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        cogsDetails.add(CogsDetail.fromJson(data as Map<String, dynamic>));
      }

      return cogsDetails;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // COGS
  Future<List<CogsRaw>> cogsFetch({
    required String accessToken,
    required String division,
    required int year,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCogs,
        queryParameters: {
          'year.eq': year,
          'division.eq': division,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final cogs = <CogsRaw>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        cogs.add(CogsRaw.fromJson(data as Map<String, dynamic>));
      }

      return cogs;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> cogsReprocess({
    required String accessToken,
    required DateTime period,
    required Company company,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$pathCogs/monthly/process/${period.year}/${period.month}/${company.id}',
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

  Future<void> currencyCreate({
    required String id,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode({
        'id': id,
      });
      final response = await dio.post<Map<String, dynamic>>(
        pathCurrency,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> currencyDelete({
    required String id,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode({
        'id': id,
      });
      final response = await dio.delete<Map<String, dynamic>>(
        '$pathCurrency/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
      return response.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Currency
  Future<PageOptions<Currency>> currencyFetch({
    required String accessToken,
    required PageOptions<Currency> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCurrency,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, Currency.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Ebitda
  Future<List<Ebitda>> ebitdaFetch({
    required String accessToken,
    required String period,
    required String marketingAreaCode,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathEbitda,
        queryParameters: {
          'period.like': period,
          'marketing_area_code.eq': marketingAreaCode,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final ebitda = <Ebitda>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        ebitda.add(Ebitda.fromJson(data as Map<String, dynamic>));
      }

      return ebitda;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<EbitdaRecap>> ebitdaRecapFetch({
    required String accessToken,
    required String period,
    required String marketingAreaCode,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathEbitda/recap',
        queryParameters: {
          'period.like': period,
          'marketing_area_code.eq': marketingAreaCode,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final ebitda = <EbitdaRecap>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        ebitda.add(EbitdaRecap.fromJson(data as Map<String, dynamic>));
      }

      return ebitda;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> ebitdaUpload({
    required String accessToken,
    required String url,
    required int period,
    required PlatformFile attachment,
  }) async {
    try {
      late String bodyDocument;
      if (url == 'incentive/report') {
        bodyDocument = 'incentive_file';
      } else if (url == 'cogs/manual') {
        bodyDocument = 'cogs_manual';
      } else if (url == 'salary/report') {
        bodyDocument = 'salary_marketing';
      }
      await dio.post<String>(
        '$pathEbitdaUpload/$url/process/$period',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: FormData.fromMap({
          bodyDocument: MultipartFile.fromBytes(
            attachment.bytes!,
            filename: attachment.name,
          ),
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> journalEstimationCreate({
    required String accessToken,
    required String id,
    required String name,
    required String type,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        pathJournalEstimation,
        data: jsonEncode({
          'id': id,
          'name': name,
          'type': type,
        }),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> journalEstimationDelete({
    required JournalEstimation journalEstimation,
    required String accessToken,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathJournalEstimation/${journalEstimation.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Journal Estimation
  Future<List<JournalEstimation>> journalEstimationFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathJournalEstimation,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final journalEstimations = <JournalEstimation>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        journalEstimations
            .add(JournalEstimation.fromJson(data as Map<String, dynamic>));
      }
      return journalEstimations;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Rate
  Future<void> rateCreate({
    required String accessToken,
    required DateTime validityDate,
    required Currency currency,
    required int rate,
  }) async {
    try {
      final result = await dio.post<Map<String, dynamic>>(
        '$pathRate/rates',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(
          {
            'rate': rate,
            'validity_date': validityDate.toUtc().toIso8601String(),
            'currency_id': currency.id,
          },
        ),
      );
      return result.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> rateDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathRate/rates/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<Rate>> rateFetch({
    required String accessToken,
    required PageOptions<Rate> pageOptions,
    Currency? currency,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$pathRate/rates',
        queryParameters: {
          'currency_id.eq': currency?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(response, Rate.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Tax Invoice Number
  Future<void> taxInvoiceNumberCreate({
    required String year,
    required int minValue,
    required int maxValue,
    required bool isActive,
    required String prefix,
    required String accessToken,
  }) async {
    try {
      final result = await dio.post<Map<String, dynamic>>(
        pathTaxInvoiceNumber,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'year': year,
          'min_value': minValue,
          'max_value': maxValue,
          'is_active': isActive,
          'prefix': prefix,
        }),
      );

      return result.data!['data'];
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> taxInvoiceNumberDelete({
    required int id,
    required String accessToken,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathTaxInvoiceNumber/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<TaxInvoiceNumber>> taxInvoiceNumberFetch({
    required String accessToken,
    required List<DateTime>? year,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathTaxInvoiceNumber,
        queryParameters: {
          'year.in': year?.map((e) => e.year).join(','),
        },
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      final taxInvoiceNumbers = <TaxInvoiceNumber>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        taxInvoiceNumbers
            .add(TaxInvoiceNumber.fromJson(data as Map<String, dynamic>));
      }

      return taxInvoiceNumbers;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction Non Order
  Future<void> transactionNonOrderCreate({
    required String accessToken,
    required String name,
    required String value,
    required ChartOfAccountNumber coaNumber,
  }) async {
    try {
      final data = jsonEncode([
        {
          'code': 'GMB',
          'transaction_date': DateTime.now().toUtc().toIso8601String(),
          'title': name,
          'chart_of_account_no': coaNumber.id,
          'unique': 'Penerimaan Bank GE',
          'value': value,
          'type': 'PAYMENT',
        },
      ]);

      await dio.post<Map<String, dynamic>>(
        pathTransactionNonOrder,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionNonOrderDelete({
    required String accessToken,
    required TransactionNonOrder transactionNonOrder,
  }) async {
    try {
      final id = transactionNonOrder.id;
      await dio.delete<Map<String, dynamic>>(
        '$pathTransactionNonOrder/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<TransactionNonOrder>> transactionNonOrderFetch({
    required String accessToken,
    required PageOptions<TransactionNonOrder> pageOptions,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathTransactionNonOrder,
        queryParameters: pageOptions.toUrlQueryMap(),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, TransactionNonOrder.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction Routine
  Future<void> transactionRoutineCreate({
    required String accessToken,
    required TransactionRoutineHeader transactionRoutineHeader,
    required List<TransactionRoutineDetail> transactionRoutineDetail,
  }) async {
    try {
      final data = <dynamic>[];

      for (var i = 0; i < transactionRoutineDetail.length; i++) {
        data.add({
          'title': transactionRoutineHeader.title,
          'chart_of_account_no': transactionRoutineDetail[i].chartOfAccountNo,
          'unique': transactionRoutineDetail[i].unique,
          'value': transactionRoutineDetail[i].value,
          'dk': transactionRoutineDetail[i].category!.id,
          'code': transactionRoutineHeader.code,
          'is_auto': transactionRoutineHeader.isActive,
          'minute': '0',
          'hour': '0',
          'day_month': transactionRoutineHeader.date,
          'month': transactionRoutineHeader.month,
          'day_week': transactionRoutineHeader.week,
          'reference': transactionRoutineHeader.reference,
          'department_id': transactionRoutineHeader.department!.id,
          'description': transactionRoutineDetail[i].description,
          'material_id': transactionRoutineDetail[i].material,
        });
      }

      await dio.post<Map<String, dynamic>>(
        pathTransactionRoutine,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode(data),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionRoutineDelete({
    required TransactionRoutine transactionRoutine,
    required String accessToken,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathTransactionRoutine/${transactionRoutine.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<TransactionRoutine>> transactionRoutineFetch({
    required String accessToken,
    required PageOptions<TransactionRoutine> pageOptions,
    String? active,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathTransactionRoutine,
        queryParameters: {
          'is_active.eq': active,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, TransactionRoutine.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction Journal Accounting
  Future<PageOptions<TransactionJournalAccounting>>
      transactionJournalAccountingFetch({
    required String accessToken,
    required PageOptions<TransactionJournalAccounting> pageOptions,
    required bool generals,
    String? transactionNoEq,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        generals == true
            ? '$pathTransactionJournalAccounting/generals'
            : pathTransactionJournalAccounting,
        queryParameters: {
          'transaction_no.eq': transactionNoEq,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      return pageOptions.setFromApi(
        response,
        TransactionJournalAccounting.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionJournalAccountingCreate({
    required String accessToken,
    required List<TransactionJournalAccounting> transactions,
  }) async {
    try {
      final data = jsonEncode(
        transactions
            .map(
              (e) => {
                'department_id': e.department.id,
                'chart_of_account_id': e.chartOfAccountId,
                'chart_of_account_name': e.chartOfAccountName,
                'debit': e.debit,
                'credit': e.credit,
                'transaction_date': e.transactionDate.toUtc().toIso8601String(),
                'reference': e.reference,
                'description': e.description,
                'budget_type': e.budgetType,
              },
            )
            .toList(),
      );

      await dio.post<Map<String, dynamic>>(
        '$pathTransactionJournalAccounting/general-journal',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionJournalAccountingDeleteByTransactionNo({
    required String accessToken,
    required TransactionJournalAccounting transactionJournalAccounting,
  }) async {
    try {
      final number =
          Uri.encodeComponent(transactionJournalAccounting.transactionNo);
      await dio.delete<Map<String, dynamic>>(
        '$pathTransactionJournalAccounting/$number',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionJournalAccountingDeleteById({
    required String accessToken,
    required TransactionJournalAccounting transactionJournalAccounting,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathTransactionJournalAccounting/by-id/${transactionJournalAccounting.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
