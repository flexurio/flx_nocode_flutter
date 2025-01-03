import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_force_summary.freezed.dart';
part 'field_force_summary.g.dart';

enum FieldForceSummaryCategory {
  sales('SALES', 'Sales', Colors.blue),
  estimation('ESTIMASI', 'Estimation', Colors.orange),
  target('TARGET', 'Target', Colors.green),
  call('CALL', 'Call', Colors.purple);

  const FieldForceSummaryCategory(this.value, this.en, this.color);
  final String value;
  final String en;
  final Color color;
}

enum MarketingPositionE {
  md('MD'),
  sm('SM'),
  am('AM');

  const MarketingPositionE(this.id);
  final String id;
}

enum FieldForceSummaryCategorySub {
  all(
    'ALL',
    'ALL',
    Colors.blue,
  ),
  product('PRODUCT', 'PRODUCT', Colors.blue),
  customer('CUSTOMER', 'CUSTOMER', Colors.blue),
  outlet('OUTLET', 'OUTLET', Colors.blue),
  outletProduct('OUTLET-PRODUCT', 'OUTLET-PRODUCT', Colors.blue),
  customerProduct('CUSTOMER-PRODUCT', 'CUSTOMER-PRODUCT', Colors.blue),
  customerOutlet('CUSTOMER-OUTLET', 'CUSTOMER-OUTLET', Colors.blue),
  customerOutletProduct(
    'CUSTOMER-OUTLET-PRODUCT',
    'CUSTOMER-OUTLET-PRODUCT',
    Colors.blue,
  ),

  salesDailyNational(
    'SALES-DAILY-NATIONAL',
    'SALES-DAILY-NATIONAL',
    Colors.blue,
  ),
  targetDailyNational(
    'TARGET-DAILY-NATIONAL',
    'TARGET-DAILY-NATIONAL',
    Colors.blue,
  ),
  salesVersusTarget('SALES VS TARGET', 'SALES VS TARGET', Colors.blue),
  deltaCustomer('DELTA-CUSTOMER', 'DELTA-CUSTOMER', Colors.blue),
  deltaProduct('DELTA-PRODUCT', 'DELTA-PRODUCT', Colors.blue),
  deltaOutlet('DELTA-OUTLET', 'DELTA-OUTLET', Colors.blue);

  const FieldForceSummaryCategorySub(this.value, this.en, this.color);
  final String value;
  final String en;
  final Color color;

  static FieldForceSummaryCategorySub fromString(
    String value,
  ) {
    for (final sub in FieldForceSummaryCategorySub.values) {
      if (value == sub.value) {
        return sub;
      }
    }
    throw ArgumentError(value);
  }
}

enum FieldForceSummaryFlag {
  all('ALL', 'All', Icon(FontAwesomeIcons.borderAll)),
  customer('CUSTOMER', 'Customer', Icon(FontAwesomeIcons.userDoctor)),
  outlet('OUTLET', 'Outlet', Icon(FontAwesomeIcons.store)),
  product('PRODUCT', 'Product', Icon(FontAwesomeIcons.tablets)),
  productCustomer('PRODUCT-CUSTOMER', '-', Icon(FontAwesomeIcons.times)),
  customerOutlet('OUTLET-CUSTOMER', '-', Icon(FontAwesomeIcons.times));

  const FieldForceSummaryFlag(this.value, this.label, this.icon);
  final String value;
  final String label;
  final Icon icon;
}

class FieldForceSummaryWithDelta {
  FieldForceSummaryWithDelta({
    required this.summary,
    required this.deltaN1,
    required this.deltaN2,
    required this.deltaN3,
  });

  final FieldForceSummary summary;
  final double deltaN1;
  final double deltaN2;
  final double deltaN3;
}

@freezed
class FieldForceSummary with _$FieldForceSummary {
  const factory FieldForceSummary(
    int year,
    int month,
    int date,
    @JsonKey(name: 'area_code') String areaCode,
    @JsonKey(name: 'area_boss') String areaCodeBoss,
    String nip,
    String name,
    @JsonKey(fromJson: _fieldForceSummaryCategoryFromString)
    FieldForceSummaryCategory category,
    @JsonKey(
      name: 'category_sub',
      fromJson: FieldForceSummaryCategorySub.fromString,
    )
    FieldForceSummaryCategorySub categorySub,
    @JsonKey(name: 'value') String amount,
    @JsonKey(name: 'percentage') double scale,
    @JsonKey(name: 'flag1') String flag1,
    @JsonKey(name: 'flag1_desc') String flag1Desc,
    @JsonKey(name: 'flag2') String flag2,
    @JsonKey(name: 'flag2_desc') String flag2Desc,
    @JsonKey(name: 'flag3') String flag3,
    @JsonKey(name: 'flag3_desc') String flag3Desc,
    @JsonKey(name: 'flag4') String flag4,
    @JsonKey(name: 'flag4_desc') String flag4Desc,
    @JsonKey(name: 'flag5') String flag5,
    @JsonKey(name: 'flag5_desc') String flag5Desc,
  ) = _FieldForceSummary;
  const FieldForceSummary._();

  factory FieldForceSummary.fromJson(Map<String, Object?> json) =>
      _$FieldForceSummaryFromJson(json);

  DateTime get dateTime => DateTime(year, month);

  (String? id, String? name) get outlet {
    if (categorySub == FieldForceSummaryCategorySub.outlet) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.outletProduct) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerOutlet) {
      return (flag2, flag2Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerOutletProduct) {
      return (flag2, flag2Desc);
    }
    return (null, null);
  }

  (String? id, String? name) get product {
    if (categorySub == FieldForceSummaryCategorySub.product) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerProduct) {
      return (flag2, flag2Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.outletProduct) {
      return (flag2, flag2Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerOutletProduct) {
      return (flag3, flag3Desc);
    }
    return (null, null);
  }

  (String? id, String? name) get customer {
    if ([
      FieldForceSummaryCategorySub.customer,
      FieldForceSummaryCategorySub.deltaCustomer,
    ].contains(categorySub)) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerProduct) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerOutlet) {
      return (flag1, flag1Desc);
    }
    if (categorySub == FieldForceSummaryCategorySub.customerOutletProduct) {
      return (flag1, flag1Desc);
    }
    return (null, null);
  }

  FieldForceSummary get asProduct {
    return copyWith(
        // data: area,
        // dataDescription: areaDescription,
        // flag: FieldForceSummaryFlag.product,
        );
  }

  FieldForceSummary get asCustomer {
    return copyWith(
        // flag: FieldForceSummaryFlag.customer,
        );
  }

  FieldForceSummary get asOutlet {
    return copyWith(
        // flag: FieldForceSummaryFlag.outlet,
        );
  }

  FieldForceSummary get asOutletFromProduct {
    return copyWith(
        // data: area,
        // dataDescription: areaDescription,
        // flag: FieldForceSummaryFlag.outlet,
        );
  }
}

FieldForceSummaryFlag _fieldForceSummaryFlagFromString(String value) {
  if (value == FieldForceSummaryFlag.all.value) {
    return FieldForceSummaryFlag.all;
  }
  if (value == FieldForceSummaryFlag.product.value) {
    return FieldForceSummaryFlag.product;
  }
  if (value == FieldForceSummaryFlag.outlet.value) {
    return FieldForceSummaryFlag.outlet;
  }
  if (value == FieldForceSummaryFlag.customer.value) {
    return FieldForceSummaryFlag.customer;
  }
  if (value == FieldForceSummaryFlag.productCustomer.value) {
    return FieldForceSummaryFlag.productCustomer;
  }
  // if (value == FieldForceSummaryFlag.outletProduct.value) {
  //   return FieldForceSummaryFlag.outletProduct;
  // }
  if (value == FieldForceSummaryFlag.customerOutlet.value) {
    return FieldForceSummaryFlag.customerOutlet;
  }

  throw ArgumentError(value);
}

FieldForceSummaryCategory _fieldForceSummaryCategoryFromString(String value) {
  if (value == FieldForceSummaryCategory.sales.value) {
    return FieldForceSummaryCategory.sales;
  }
  if (value == FieldForceSummaryCategory.estimation.value) {
    return FieldForceSummaryCategory.estimation;
  }
  if (value == FieldForceSummaryCategory.target.value) {
    return FieldForceSummaryCategory.target;
  }
  if (value == FieldForceSummaryCategory.call.value) {
    return FieldForceSummaryCategory.call;
  }
  throw ArgumentError();
}
