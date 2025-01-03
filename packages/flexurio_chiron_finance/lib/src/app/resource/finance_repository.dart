import 'dart:convert';

import 'package:appointment/constant/company.dart';
import 'package:flexurio_chiron_finance/src/app/model/bank.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow.dart';
import 'package:flexurio_chiron_finance/src/app/model/cash_flow_code.dart';
import 'package:flexurio_chiron_customer/flexurio_chiron_customer.dart';
import 'package:flexurio_chiron_finance/src/app/model/finance_return_note.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_customer.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_detail.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_global.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_group.dart';
import 'package:flexurio_chiron_finance/src/app/model/accounts_receivable_mutation.dart';
import 'package:flexurio_chiron_finance/src/app/model/form_a1.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_completed_petty_cash.dart';
import 'package:flexurio_chiron_finance/src/app/model/report_sales_credit_note.dart';
import 'package:flexurio_chiron_accounting/flexurio_chiron_accounting.dart';
import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flexurio_erp_authentication/flexurio_erp_authentication.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:intl/intl.dart';

class FinanceRepository extends Repository {
  FinanceRepository({required super.dio, required super.onUnauthorized});

  static final pathCashFlow = '${Api.urlApi}/cash-flows';
  static final pathCode = '${Api.urlApi}/cash-flow-codes';
  static final pathCustomer = '${Api.urlApi}/customers';
  static final pathCustomerDiscount = '${Api.urlApi}/customer-discounts';
  static final pathRate = '${Api.urlApi}/accounting/rates';
  static final pathTransactionType = '${Api.urlApi}/transactions/types';
  static final pathTypeCost = '${Api.urlApi}/type-costs';
  static final paymentPath = '${Api.urlApi}/payments';
  static final paymentOtherCostPath = '${Api.urlApi}/payment-other-costs';

  static final transactionPath = '${Api.urlApi}/transactions';
  static final reportSalesCreditNotePath =
      '${Api.urlApi}/sales-credit-note-reports';
  static final reportCompletedPettyCashPath =
      '${Api.urlApi}/petty-cash-reports';

  static FinanceRepository instance = FinanceRepository(
    dio: Api.dio,
    onUnauthorized: AuthenticationRepository.logout,
  );

  Future<List<String>> srpNoFetch({
    required String accessToken,
    required String companyId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/return-notes/account-receivables/srp-no',
        queryParameters: {
          'company': companyId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final srp = <String>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        srp.add((data as Map<String, dynamic>)['no_srp'] as String);
      }

      return srp;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<FinanceReturnNote>> returnNoteFetch({
    required String accessToken,
    required String companyId,
    required String periodStart,
    required String periodEnd,
    required String srpNo,
    required String customerCode,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/return-notes/account-receivable/$companyId/$periodStart/$periodEnd',
        queryParameters: {
          'NoSRP.eq': srpNo,
          'customer_code': customerCode,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final returnNote = <FinanceReturnNote>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        returnNote
            .add(FinanceReturnNote.fromJson(data as Map<String, dynamic>));
      }

      return returnNote;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Cash Flow
  Future<List<CashFlow>> cashFlowFetch({
    required String accessToken,
    required Company company,
    required String? transactionNo,
    required DateTime? periodStart,
    required DateTime? periodEnd,
  }) async {
    try {
      final transactionEscape = Uri.encodeComponent(transactionNo!);
      String? parsePeriodStart;
      if (periodStart == null) {
        parsePeriodStart = '';
      } else {
        parsePeriodStart = DateFormat('yyyy-MM-dd').format(periodStart);
      }
      String? parsePeriodEnd;
      if (periodEnd == null) {
        parsePeriodEnd = '';
      } else {
        parsePeriodEnd = DateFormat('yyyy-MM-dd').format(periodEnd);
      }
      String? dateBW;
      if (parsePeriodStart != '' || parsePeriodEnd != '') {
        dateBW = '$parsePeriodStart|$parsePeriodEnd';
      } else {
        dateBW = '';
      }
      final response = await dio.get<Map<String, dynamic>>(
        '$pathCashFlow/${company.id}?no_transaction.eq=$transactionEscape&date.bw=$dateBW',
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <CashFlow>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(CashFlow.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> cashFlowEdit({
    required String accessToken,
    required String transactionNo,
    required String code,
    required String subCode,
    required String mutationDate,
    required int transferFee,
    required int totalTransfer,
    required Bank bank,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        pathCashFlow,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'no_transaction': transactionNo,
          'code': code,
          'sub_code': subCode,
          'mutation_date': mutationDate,
          'transfer_fee': transferFee,
          'total_transfer': totalTransfer,
          'bank': bank.bank,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> cashFlowApprove({
    required String accessToken,
    required String transactionNo,
  }) async {
    try {
      final transactionEscape = Uri.encodeComponent(transactionNo);
      await dio.put<Map<String, dynamic>>(
        '$pathCashFlow/$transactionEscape/approve',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> cashFlowOpen({
    required String accessToken,
    required String transactionNo,
  }) async {
    try {
      final transactionEscape = Uri.encodeComponent(transactionNo);
      await dio.put<Map<String, dynamic>>(
        '$pathCashFlow/$transactionEscape/open',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<CashFlowCode>> cashFlowCodeFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCode,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final lines = <CashFlowCode>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        lines.add(CashFlowCode.fromJson(data as Map<String, dynamic>));
      }

      return lines;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Customer
  Future<PageOptions<Customer>> customerFetch({
    required String accessToken,
    required PageOptions<Customer> pageOptions,
    Customer? parent,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCustomer,
        queryParameters: {'parent.eq': parent?.id}
          ..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, Customer.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<Customer>> customerFetchByParent({
    required String accessToken,
    required PageOptions<Customer> pageOptions,
    Customer? customer,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'parent.eq': customer!.parent,
      }..addAll(pageOptions.toUrlQueryMap());
      final response = await dio.get<Map<String, dynamic>>(
        pathCustomer,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, Customer.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<List<Customer>> customerFetchById({
    required String accessToken,
    String? customerId,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCustomer,
        queryParameters: {
          'id.eq': customerId,
        },
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      final customers = <Customer>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        customers.add(Customer.fromJson(data as Map<String, dynamic>));
      }

      return customers;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> customerCreate({
    required String accessToken,
    required String id,
    required String name,
    required String address,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required String nppkp,
    required int term,
    required int discount,
    required bool isAdministration,
    required String parent,
    required CustomerType customerType,
    required CustomerCategory customerCategory,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        pathCustomer,
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'id': id,
          'name': name,
          'address': address,
          'country_id': country,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
          'nppkp': nppkp,
          'term_of_payment': term,
          'discount': discount,
          'is_administration': isAdministration,
          'parent': parent,
          'customer_type': customerType.id,
          'customer_category': customerCategory.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> customerUpdate({
    required String accessToken,
    required Customer customer,
    required String name,
    required String address,
    required String country,
    required int postalCode,
    required String phone,
    required String fax,
    required String pic,
    required String email,
    required String npwp,
    required String nppkp,
    required int term,
    required int discount,
    required bool isAdministration,
    required String parent,
    required CustomerType customerType,
    required CustomerCategory customerCategory,
  }) async {
    try {
      await dio.put<Map<String, dynamic>>(
        '$pathCustomer/${customer.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'name': name,
          'address': address,
          'country_id': country,
          'postal_code': postalCode,
          'phone': phone,
          'fax': fax,
          'pic': pic,
          'email': email,
          'npwp': npwp,
          'nppkp': nppkp,
          'term_of_payment': term,
          'discount': discount,
          'is_administration': isAdministration,
          'parent': parent,
          'customer_type': customerType.id,
          'customer_category': customerCategory.id,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> customerDelete({
    required String accessToken,
    required Customer customer,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathCustomer/${customer.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Customer Discount
  Future<PageOptions<CustomerDiscount>> customerDiscountFetch({
    required String accessToken,
    required PageOptions<CustomerDiscount> pageOptions,
    Customer? customer,
    String? id,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathCustomerDiscount,
        queryParameters: {
          'customer_id.eq': customer?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, CustomerDiscount.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> customerDiscountCreate({
    required String accessToken,
    required double discount,
    required Customer customer,
    required DateTime startDate,
  }) async {
    try {
      await dio.post<Map<String, dynamic>>(
        '$pathCustomer/${customer.id}/discounts',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: jsonEncode({
          'start_date': startDate.toUtcIso(),
          'discount': discount,
        }),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> customerDiscountDelete({
    required String accessToken,
    required CustomerDiscount customerDiscount,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathCustomer/${customerDiscount.customer.id}/discounts/${customerDiscount.id}',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Payment Other Cost
  Future<PageOptions<PaymentOtherCost>> paymentOtherCostFetch({
    required String accessToken,
    required PageOptions<PaymentOtherCost> pageOptions,
    Payment? payment,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        paymentOtherCostPath,
        queryParameters: {
          'payment_id.eq': payment?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, PaymentOtherCost.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction
  Future<PageOptions<Transaction>> transactionFetch({
    required String accessToken,
    required PageOptions<Transaction> pageOptions,
    double? paymentRemainingGreaterThan,
    DateTime? dateGraterThanEqualTo,
    DateTime? dateLessThanEqualTo,
    TransactionJournalType? type,
    Supplier? supplier,
    Customer? customer,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        transactionPath,
        queryParameters: {
          'payment_remaining.gt': paymentRemainingGreaterThan,
          'is_type_transaction.eq': type?.value,
          'date.gte': dateGraterThanEqualTo?.startOfDay.toUtcIso(),
          'date.lte': dateLessThanEqualTo?.endOfDay.toUtcIso(),
          'supplier_id.eq': supplier?.id,
          'customer_id.eq': customer?.id,
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(
        response,
        Transaction.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction Payment
  Future<PageOptions<TransactionPayment>> transactionPaymentFetch({
    required String accessToken,
    required PageOptions<TransactionPayment> pageOptions,
    TransactionJournalType? type,
    String? supplierId,
    String? customerId,
    double? paymentRemainingGreaterThanEqualTo,
    double? paymentRemainingLessThanEqualTo,
    double? paymentRemainingEqualTo,
    double? paymentRemainingNotEqualTo,
    DateTime? dateGraterThanEqualTo,
    DateTime? dateLessThanEqualTo,
    DateTime? paymentDateGreaterThanEqualTo,
    DateTime? paymentDateLessThanEqualTo,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/transaction-by-payments',
        queryParameters: {
          if (type != null)
            'is_type_transaction.in': type.isReceivable ? '0,2' : type.value,
          'supplier_id.eq': supplierId,
          'customer_id.eq': customerId,
          'payment_remaining.gte': paymentRemainingGreaterThanEqualTo,
          'payment_remaining.lte': paymentRemainingLessThanEqualTo,
          'payment_remaining.eq': paymentRemainingEqualTo?.toInt(),
          'payment_remaining.ne': paymentRemainingNotEqualTo?.toInt(),
          'date.gte': dateGraterThanEqualTo?.startOfDay.toUtcIso(),
          'date.lte': dateLessThanEqualTo?.endOfDay.toUtcIso(),
          'payment_date.gte':
              paymentDateGreaterThanEqualTo?.startOfDay.toUtcIso(),
          'payment_date.lte': paymentDateLessThanEqualTo?.endOfDay.toUtcIso(),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );

      return pageOptions.setFromApi(
        response,
        TransactionPayment.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Transaction Type
  Future<PageOptions<TransactionType>> transactionTypeFetch({
    required String accessToken,
    required PageOptions<TransactionType> pageOptions,
    String? name,
    String? flag,
    String? code,
    List<String>? codes,
    String? type,
    List<String>? id,
    String? value,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathTransactionType,
        queryParameters: {
          'name.like': name,
          'flag.eq': flag,
          'code.eq': code,
          'type.eq': type,
          'value.eq': value,
          'left(code, 2).in': codes?.join(','),
        }..addAll(pageOptions.toUrlQueryMap()),
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
      return pageOptions.setFromApi(response, TransactionType.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionTypeCreate({
    required String id,
    required String name,
    required String code,
    required String value,
    required TransactionTypeFlag flag,
    required String accessToken,
    required TypeTransaction type,
  }) async {
    try {
      final data = jsonEncode(
        {
          'id': id,
          'name': name,
          'code': code,
          'value': value,
          'flag': flag.id,
          'type': type.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathTransactionType,
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

  Future<void> transactionTypeUpdate({
    required String id,
    required String name,
    required String value,
    required String accessToken,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'value': value,
        },
      );
      await dio.put<Map<String, dynamic>>(
        '$pathTransactionType/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
        data: data,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> transactionTypeDelete({
    required String id,
    required String accessToken,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathTransactionType/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  // Type Cost
  Future<List<TypeCost>> typeCostFetch({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<Map<String, dynamic>>(
        pathTypeCost,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );
      final type = <TypeCost>[];
      final data = response.data!['data'] as List;

      for (final data in data) {
        type.add(TypeCost.fromJson(data as Map<String, dynamic>));
      }
      return type;
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<void> typeCostCreate({
    required String accessToken,
    required String name,
    required ChartOfAccountNumber chartOfAccountNumber,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'chart_of_account_number': chartOfAccountNumber.id,
        },
      );
      final response = await dio.post<Map<String, dynamic>>(
        pathTypeCost,
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

  Future<void> typeCostEdit({
    required String accessToken,
    required String name,
    required ChartOfAccountNumber chartOfAccountNumber,
    required int id,
  }) async {
    try {
      final data = jsonEncode(
        {
          'name': name,
          'chart_of_account_number': chartOfAccountNumber.id,
        },
      );
      final response = await dio.put<Map<String, dynamic>>(
        '$pathTypeCost/$id',
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

  Future<void> typeCostDelete({
    required String accessToken,
    required int id,
  }) async {
    try {
      await dio.delete<Map<String, dynamic>>(
        '$pathTypeCost/$id',
        options: Options(
          headers: {RequestHeader.authorization: 'Bearer $accessToken'},
        ),
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<FormA1>> formA1Fetch({
    required String accessToken,
    required PageOptions<FormA1> pageOptions,
    DateTime? periodStart,
    DateTime? periodEnd,
    String? divisi,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (divisi != null) {
        queryParameters['divisi.eq'] = divisi;
      }

      if (periodStart != null) {
        queryParameters['period_start'] =
            DateFormat('yyyyMMdd').format(periodStart);
      }

      if (periodEnd != null) {
        queryParameters['period_end'] =
            DateFormat('yyyyMMdd').format(periodEnd);
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/recap-finance-forms',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, FormA1.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivableDetail>> accountsReceivableDetailFetch({
    required String accessToken,
    required PageOptions<AccountsReceivableDetail> pageOptions,
    TransactionType? transactionType,
    Customer? customer,
    DateTime? dueDate,
    DateTime? transactionDate,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (transactionType != null) {
        queryParameters['transaction_type.eq'] = transactionType.id;
      }
      if (customer != null) {
        queryParameters['customer_id.eq'] = customer.id;
      }
      if (dueDate != null) {
        queryParameters['due_date.lte'] = dueDate;
      }
      if (transactionDate != null) {
        queryParameters['transaction_date.lte'] = transactionDate;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/accounts-receivable-by-invoice-dates',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivableDetail.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivableGlobal>> accountsReceivableGlobalFetch({
    required String accessToken,
    required PageOptions<AccountsReceivableGlobal> pageOptions,
    TransactionType? transactionType,
    Customer? customer,
    DateTime? dueDate,
    DateTime? transactionDate,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (transactionType != null) {
        queryParameters['transaction_type_id.eq'] = transactionType.id;
      }
      if (customer != null) {
        queryParameters['customer_id.eq'] = customer.id;
      }
      if (dueDate != null) {
        queryParameters['due_date.lte'] = dueDate;
      }
      if (transactionDate != null) {
        queryParameters['transaction_date.lte'] = transactionDate;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/accounts-receivable-global-by-invoice-dates',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivableGlobal.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivableGroup>> accountsReceivableGroupFetch({
    required String accessToken,
    required PageOptions<AccountsReceivableGroup> pageOptions,
    TransactionType? transactionType,
    Customer? customer,
    DateTime? dueDate,
    DateTime? date,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (transactionType != null) {
        queryParameters['transaction_type_id.eq'] = transactionType.id;
      }
      if (customer != null) {
        queryParameters['customer_id.eq'] = customer.id;
      }
      if (dueDate != null) {
        queryParameters['due_date.lte'] = dueDate;
      }
      if (date != null) {
        queryParameters['date.lte'] = date;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/accounts-receivable-detail-group-by-invoice-dates',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(response, AccountsReceivableGroup.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivableMutation>>
      accountsReceivableMutationFetch({
    required String accessToken,
    required PageOptions<AccountsReceivableMutation> pageOptions,
    TransactionType? transactionType,
    Customer? customer,
    DateTime? dueDate,
    DateTime? date,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (transactionType != null) {
        queryParameters['transaction_type_id.eq'] = transactionType.id;
      }
      if (customer != null) {
        queryParameters['customer_id.eq'] = customer.id;
      }
      if (dueDate != null) {
        queryParameters['due_date.lte'] = dueDate;
      }
      if (date != null) {
        queryParameters['date.lte'] = date;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/accounts-receivable-mutation-by-invoice-dates',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivableMutation.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<AccountsReceivableCustomer>>
      accountsReceivableCustomerFetch({
    required String accessToken,
    required PageOptions<AccountsReceivableCustomer> pageOptions,
    TransactionType? transactionType,
    Customer? customer,
    DateTime? transactionDateGte,
    DateTime? transactionDateLte,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};

      if (transactionType != null) {
        queryParameters['transaction_type_id.eq'] = transactionType.id;
      }
      if (customer != null) {
        queryParameters['customer_id.eq'] = customer.id;
      }
      if (transactionDateGte != null) {
        queryParameters['transaction_date.gte'] = transactionDateGte;
      }
      if (transactionDateLte != null) {
        queryParameters['transaction_date.lte'] = transactionDateLte;
      }

      queryParameters
        ..removeWhere((key, value) => value == null)
        ..removeWhere((key, value) => value == '')
        ..addAll(pageOptions.toUrlQueryMap());

      final response = await dio.get<Map<String, dynamic>>(
        '${Api.urlApi}/card-reports-customer-by-invoice-dates',
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
          response, AccountsReceivableCustomer.fromJson);
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ReportSalesCreditNote>> reportSalesCreditNoteFetch({
    required String accessToken,
    required PageOptions<ReportSalesCreditNote> pageOptions,
    required DateTime? dateStart,
    required DateTime? dateEnd,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (dateStart != null) {
        queryParameters['period_start.eq'] =
            DateFormat('yyyyMMdd').format(dateStart);
      }

      if (dateEnd != null) {
        queryParameters['period_end.eq'] =
            DateFormat('yyyyMMdd').format(dateEnd);
      }

      final response = await dio.get<Map<String, dynamic>>(
        reportSalesCreditNotePath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ReportSalesCreditNote.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }

  Future<PageOptions<ReportCompletedPettyCash>> reportCompletedPettyCashFetch({
    required String accessToken,
    required PageOptions<ReportCompletedPettyCash> pageOptions,
    required DateTime? dateStart,
    required DateTime? dateEnd,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (dateStart != null) {
        queryParameters['created_at.gte'] = dateStart.toUtcIso();
      }

      if (dateEnd != null) {
        queryParameters['created_at.lte'] = dateEnd.toUtcIso();
      }

      final response = await dio.get<Map<String, dynamic>>(
        reportCompletedPettyCashPath,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            RequestHeader.authorization: 'Bearer $accessToken',
          },
        ),
      );

      return pageOptions.setFromApi(
        response,
        ReportCompletedPettyCash.fromJson,
      );
    } catch (error) {
      throw checkErrorApi(error);
    }
  }
}
