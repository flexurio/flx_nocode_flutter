import 'package:flexurio_chiron_ticket/src/app/model/ticket.dart';
import 'package:appointment/src/app/resource/click_up_repository.dart';
import 'package:dio/dio.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';

enum TicketTag {
  error('Error'),
  newFeature('New Feature'),
  revisionFeature('Revision Feature'),
  editData('Edit Data');

  const TicketTag(this.value);
  final String value;
}

enum TicketList {
  requestAccounting('900300161359'),
  requestBoardOfDirection('900300287069'),
  requestBusinessDevelopment('900300287074'),
  requestCorporateSecretary('900300287098'),
  requestCorporateServiceOtc('900300287083'),
  requestCorporateServices('900300287081'),
  requestEngineering('900300161780'),
  requestFinance('900300161361'),
  requestGroupProductEthical('900300287119'),
  requestHumanResource('900300161364'),
  requestInformationTechnology('900300161374'),
  requestInternalAudit('900300161789'),
  requestManagementSystemDevelopment('900300287164'),
  requestMarketingControl('900300287193'),
  requestMarketingEthical('900300161369'),
  requestMarketingOtc('900300287209'),
  requestMarketingSupport('900300161367'),
  requestNsm('900300287219'),
  requestObatHewan('900300287800'),
  requestPpic('900300175862'),
  requestProcurement('900300287806'),
  requestProductManager('900300287811'),
  requestProduction('900300161782'),
  requestPurchasing('900300161363'),
  requestQualityAssurance('900300287823'),
  requestQualityControl('900300287827'),
  requestQualityExcellenceTl('900300287845'),
  requestRegulatory('900300287852'),
  requestResearchAndDevelopment('900300161366'),
  requestScma('900300287856'),
  requestTax('900300161370'),

  approvedAccounting('900300287896'),
  approvedBoardOfDirection('900300287908'),
  approvedBusinessDevelopment('900300287892'),
  approvedCorporateSecretary('900300287887'),
  approvedCorporateServiceOtc('900300287884'),
  approvedCorporateServices('900300287903'),
  approvedEngineering('900300287898'),
  approvedFinance('900300287897'),
  approvedGroupProductEthical('900300287888'),
  approvedHumanResource('900300287900'),
  approvedInformationTechnology('900300287885'),
  approvedInternalAudit('900300287902'),
  approvedManagementSystemDevelopment('900300287907'),
  approvedMarketingControl('900300287911'),
  approvedMarketingEthical('900300287912'),
  approvedMarketingOtc('900300287886'),
  approvedMarketingSupport('900300287899'),
  approvedNsm('900300287883'),
  approvedObatHewan('900300287905'),
  approvedPpic('900300287890'),
  approvedProcurement('900300287910'),
  approvedProductManager('900300287904'),
  approvedProduction('900300287894'),
  approvedPurchasing('900300287901'),
  approvedQualityAssurance('900300287882'),
  approvedQualityControl('900300287909'),
  approvedQualityExcellenceTl('900300287881'),
  approvedRegulatory('900300287880'),
  approvedResearchAndDevelopment('900300287895'),
  approvedScma('900300287906'),
  approvedTax('900300287893');

  const TicketList(this.id);
  final String id;
}

TicketList getListByDepartment(String department) {
  switch (department) {
    case 'ACCOUNTING':
      return TicketList.requestAccounting;
    case 'BOD':
      return TicketList.requestBoardOfDirection;
    case 'BUSINESS DEVELOPMENT':
      return TicketList.requestBusinessDevelopment;
    case 'CORPORATE SERVICES':
      return TicketList.requestCorporateServices;
    case 'CORPORATE SERVICES OTC':
      return TicketList.requestCorporateServiceOtc;
    case 'CORPORATE SECRETARY':
      return TicketList.requestCorporateSecretary;
    case 'ENGINEERING':
      return TicketList.requestEngineering;
    case 'FINANCE':
      return TicketList.requestFinance;
    case 'HRD':
      return TicketList.requestHumanResource;
    case 'INFORMATION TECHNOLOGY':
      return TicketList.requestInformationTechnology;
    case 'INTERNAL AUDIT':
      return TicketList.requestInternalAudit;
    case 'MANAGEMENT SYSTEM DEVELOPMENT':
      return TicketList.requestManagementSystemDevelopment;
    case 'MARKETING CONTROL':
      return TicketList.requestMarketingControl;
    case 'MARKETING ETHICAL':
      return TicketList.requestMarketingEthical;
    case 'MARKETING OTC':
      return TicketList.requestMarketingOtc;
    case 'MARKETING SUPPORT':
      return TicketList.requestMarketingSupport;
    case 'NSM':
      return TicketList.requestNsm;
    case 'OBAT HEWAN':
      return TicketList.requestObatHewan;
    case 'PPIC':
      return TicketList.requestPpic;
    case 'PROCUREMENT':
      return TicketList.requestProcurement;
    case 'PRODUCT MANAGER':
      return TicketList.requestProductManager;
    case 'PRODUCTION':
      return TicketList.requestProduction;
    case 'QUALITY ASSURANCE':
      return TicketList.requestQualityAssurance;
    case 'QUALITY CONTROL':
      return TicketList.requestQualityControl;
    case 'QUALITY EXCELLENCE TL':
      return TicketList.requestQualityExcellenceTl;
    case 'REGULATORY':
      return TicketList.requestRegulatory;
    case 'RESEARCH & DEVELOPMENT':
      return TicketList.requestResearchAndDevelopment;
    case 'SCMA':
      return TicketList.requestScma;
    case 'TAX':
      return TicketList.requestTax;
    default:
  }

  throw Exception('Department not found');
}

class TicketRepository extends ClickUpRepository {
  TicketRepository({required this.dio});

  final _clickUpCustomFieldRequesterNipID =
      '2b139385-675f-46f7-8947-d9e9707c7d37';
  final _clickUpCustomFieldRequesterNameID =
      'ad6dcc47-e1a2-4279-a517-5f9d00cd5ac2';

  final Dio dio;
  static TicketRepository instance = TicketRepository(dio: Api.dio);

  Future<void> delete({
    required String taskId,
  }) async {
    try {
      await dio.delete<String>(
        '$clickUpApiUrl/task/$taskId',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
      );
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }

  Future<String> create({
    required String title,
    required String description,
    required TicketList list,
    required String requesterName,
    required String requesterNip,
    required String category,
  }) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        '$clickUpApiUrl/list/${list.id}/task',
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
        data: {
          'name': title,
          'description': description,
          'tags': [category],
          'status': 'Open',
          'notify_all': true,
          'custom_fields': [
            {
              'id': _clickUpCustomFieldRequesterNameID,
              'value': requesterName,
            },
            {
              'id': _clickUpCustomFieldRequesterNipID,
              'value': requesterNip,
            }
          ],
        },
      );

      return response.data!['id'] as String;
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }

  Future<List<Ticket>> get({
    required TicketList list,
    required bool? isArchived,
  }) async {
    final tickets = <Ticket>[];

    try {
      final response = await dio.get<Map<String, dynamic>>(
        '$clickUpApiUrl/list/${list.id}/task',
        queryParameters: {
          'archived': isArchived ?? false,
          'include_closed': true,
        },
        options: Options(
          headers: {RequestHeader.authorization: clickUpApiKey},
        ),
      );

      for (final task in response.data!['tasks'] as List) {
        tickets.add(Ticket.fromJson(task as Map<String, dynamic>));
      }

      return tickets;
    } catch (error) {
      throw ApiException('Error calling API: $error');
    }
  }
}
