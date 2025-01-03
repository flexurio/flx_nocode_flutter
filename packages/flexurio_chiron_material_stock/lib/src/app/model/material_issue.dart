import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_issue.freezed.dart';
part 'material_issue.g.dart';

@freezed
class MaterialIssue with _$MaterialIssue {
  factory MaterialIssue({
    required String id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'mi_type', fromJson: TransactionType.fromJson)
    required TransactionType miType,
    @JsonKey(name: 'department', fromJson: Department.fromJson)
    required Department department,
    @JsonKey(name: 'product', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'batch', fromJson: ProductionOrder.fromJson)
    required ProductionOrder batch,
    @JsonKey(name: 'product_expired_date', fromJson: isoDateToDateTime)
    required DateTime? productionExpiredDate,
    @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
    required MaterialGroup materialGroup,
    @JsonKey(name: 'mi_date', fromJson: isoDateToDateTime)
    required DateTime miDate,
    required String remarks,
  }) = _MaterialIssue;
  const MaterialIssue._();

  factory MaterialIssue.fromJson(Map<String, dynamic> json) =>
      _$MaterialIssueFromJson(json);
}
