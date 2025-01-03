import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:appointment/src/app/resource/user_repository.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_material_stock/flexurio_chiron_material_stock.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'material_issue_bloc.freezed.dart';

@freezed
class MaterialIssueState with _$MaterialIssueState {
  factory MaterialIssueState.initial() = _Initial;
  factory MaterialIssueState.loading() = _Loading;
  factory MaterialIssueState.success() = _Success;
  factory MaterialIssueState.error(String error) = _Error;
}

@freezed
class MaterialIssueEvent with _$MaterialIssueEvent {
  factory MaterialIssueEvent.create({
    required Product product,
    required MaterialGroup materialGroup,
    required Department department,
    required ProductionOrder productionOrder,
    required TransactionType transactionType,
    required String remarks,
  }) = _Create;
  factory MaterialIssueEvent.createNonMi({
    required MaterialGroup materialGroup,
    required Department department,
    required TransactionType transactionType,
    required String remarks,
    Product? product,
    ProductionOrder? productionOrder,
  }) = _CreateNonMi;
  factory MaterialIssueEvent.delete({
    required MaterialIssue materialIssue,
  }) = _Delete;
}

class MaterialIssueBloc extends Bloc<MaterialIssueEvent, MaterialIssueState> {
  final bool isExternal;
  MaterialIssueBloc({
    required this.isExternal,
  }) : super(_Initial()) {
    on<MaterialIssueEvent>(
      (event, emit) async {
        await event.when(
          create: (
            product,
            materialGroup,
            department,
            productionOrder,
            transactionType,
            remarks,
          ) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueCreate(
                accessToken: UserRepositoryApp.instance.token!,
                remarks: remarks,
                product: product,
                productionOrder: productionOrder,
                materialGroup: materialGroup,
                department: department,
                transactionType: transactionType,
                isExternal: isExternal,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          createNonMi: (
            materialGroup,
            department,
            transactionType,
            remarks,
            product,
            productionOrder,
          ) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueNonMiCreate(
                accessToken: UserRepositoryApp.instance.token!,
                remarks: remarks,
                product: product,
                productionOrder: productionOrder,
                materialGroup: materialGroup,
                department: department,
                transactionType: transactionType,
                isExternal: isExternal,
              );
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
          delete: (materialIssue) async {
            emit(_Loading());
            try {
              await MaterialIssueRepository.instance.materialIssueDelete(
                  accessToken: UserRepositoryApp.instance.token!,
                  materialIssue: materialIssue,
                  isExternal: isExternal);
              emit(_Success());
            } catch (error) {
              emit(_Error(errorMessage(error)));
            }
          },
        );
      },
    );
  }
}
