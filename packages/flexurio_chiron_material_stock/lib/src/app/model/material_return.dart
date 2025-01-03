import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_accounting/src/app/model/transaction_type.dart';
import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_return.freezed.dart';
part 'material_return.g.dart';

@freezed
class MaterialReturn with _$MaterialReturn {
  factory MaterialReturn({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'is_print') required bool isPrint,
    @JsonKey(name: 'remarks') required String remark,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updateAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'return_type_id', fromJson: TransactionType.fromJson)
    required TransactionType transactionType,
    @JsonKey(name: 'product_id', fromJson: Product.fromJson)
    required Product product,
    @JsonKey(name: 'material_group_id', fromJson: MaterialGroup.fromJson)
    required MaterialGroup materialGroup,
    @JsonKey(name: 'department_id', fromJson: Department.fromJson)
    required Department department,
    @JsonKey(name: 'batch_no_id', fromJson: ProductionOrder.fromJson)
    required ProductionOrder productionOrder,
    @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
    required DateTime transactionDate,
  }) = _MaterialReturn;

  factory MaterialReturn.fromJson(Map<String, dynamic> json) =>
      _$MaterialReturnFromJson(json);
  const MaterialReturn._();

  factory MaterialReturn.empty() {
    return MaterialReturn(
      id: '',
      isPrint: false,
      remark: '',
      createdAt: DateTime(0),
      createdById: 0,
      updateAt: DateTime(0),
      updatedById: 0,
      transactionType: TransactionType.empty(),
      product: Product.empty(),
      materialGroup: MaterialGroup.empty(),
      department: Department.empty(),
      productionOrder: ProductionOrder.empty(),
      transactionDate: DateTime(0),
    );
  }

  MaterialReturnType get type {
    if (productionOrder.id != '') {
      return MaterialReturnType.returnX;
    }
    if (product.id != '') {
      return MaterialReturnType.returnX;
    }

    return MaterialReturnType.adjustment;
  }
}

enum MaterialReturnType {
  returnX('Return'),
  adjustment('Adjustment');

  const MaterialReturnType(this.title);
  final String title;

  static List<MaterialReturnType> get list => [
        MaterialReturnType.returnX,
        MaterialReturnType.adjustment,
      ];
}

class MaterialReturnFormProduct {
  MaterialReturnFormProduct({
    required this.materialGroup,
    required this.department,
    required this.remarks,
    required this.transactionType,
    required this.product,
    required this.productionOrder,
    required this.type,
  });

  final MaterialGroup materialGroup;
  final Department department;
  final String remarks;
  final TransactionType transactionType;
  final Product? product;
  final ProductionOrder? productionOrder;
  final MaterialReturnType type;

  bool get isCreateExternal => transactionType.id == '31';
}

class MaterialReturnFormType {
  MaterialReturnFormType({
    required this.type,
  });
  final MaterialReturnType type;
}
