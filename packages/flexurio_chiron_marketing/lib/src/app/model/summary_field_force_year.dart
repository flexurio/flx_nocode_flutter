abstract class SummaryFieldForceYear {
  SummaryFieldForceYear({
    required this.category,
    required this.categoryParent,
    required this.areaCode,
    required this.jabCode,
    required this.month1,
    required this.month2,
    required this.month3,
    required this.month4,
    required this.month5,
    required this.month6,
    required this.month7,
    required this.month8,
    required this.month9,
    required this.month10,
    required this.month11,
    required this.month12,
    this.typeRow,
  });

  String? typeRow;
  final String category;
  final String categoryParent;
  late String? areaCode;
  late String? jabCode;
  double month1;
  double month2;
  double month3;
  double month4;
  double month5;
  double month6;
  double month7;
  double month8;
  double month9;
  double month10;
  double month11;
  double month12;

  double getValueByMonth(int month) {
    switch (month) {
      case 1:
        return month1;
      case 2:
        return month2;
      case 3:
        return month3;
      case 4:
        return month4;
      case 5:
        return month5;
      case 6:
        return month6;
      case 7:
        return month7;
      case 8:
        return month8;
      case 9:
        return month9;
      case 10:
        return month10;
      case 11:
        return month11;
      case 12:
        return month12;
      default:
        throw ArgumentError();
    }
  }

  void sum(SummaryFieldForceYear summaryFieldForce) {
    month1 += summaryFieldForce.month1;
    month2 += summaryFieldForce.month2;
    month3 += summaryFieldForce.month3;
    month4 += summaryFieldForce.month4;
    month5 += summaryFieldForce.month5;
    month6 += summaryFieldForce.month6;
    month7 += summaryFieldForce.month7;
    month8 += summaryFieldForce.month8;
    month9 += summaryFieldForce.month9;
    month10 += summaryFieldForce.month10;
    month11 += summaryFieldForce.month11;
    month12 += summaryFieldForce.month12;
  }
}

class SummaryFieldForceYearRaw extends SummaryFieldForceYear {
  SummaryFieldForceYearRaw({
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required this.flag,
    required this.area,
    required this.dataFlag,
    required super.month1,
    required super.month2,
    required super.month3,
    required super.month4,
    required super.month5,
    required super.month6,
    required super.month7,
    required super.month8,
    required super.month9,
    required super.month10,
    required super.month11,
    required super.month12,
    super.typeRow,
  });

  factory SummaryFieldForceYearRaw.fromJson(Map<String, dynamic> json) {
    return SummaryFieldForceYearRaw(
      categoryParent: json['category'] as String,
      category: json['category'] as String,
      flag: json['flag'] as String,
      area: json['area'] as String,
      dataFlag: json['data'] as String,
      areaCode: json['area_code'] as String,
      jabCode: json['jab_code'] as String,
      month1: (json['jan'] as num).toDouble(),
      month2: (json['feb'] as num).toDouble(),
      month3: (json['mar'] as num).toDouble(),
      month4: (json['apr'] as num).toDouble(),
      month5: (json['may'] as num).toDouble(),
      month6: (json['jun'] as num).toDouble(),
      month7: (json['jul'] as num).toDouble(),
      month8: (json['aug'] as num).toDouble(),
      month9: (json['sep'] as num).toDouble(),
      month10: (json['oct'] as num).toDouble(),
      month11: (json['nov'] as num).toDouble(),
      month12: (json['des'] as num).toDouble(),
      typeRow: '',
    );
  }

  final String flag;
  final String area;
  final String dataFlag;
}

class SummaryFieldForceYearGrade1 extends SummaryFieldForceYear {
  SummaryFieldForceYearGrade1({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.month1,
    required super.month2,
    required super.month3,
    required super.month4,
    required super.month5,
    required super.month6,
    required super.month7,
    required super.month8,
    required super.month9,
    required super.month10,
    required super.month11,
    required super.month12,
    required this.children,
  });

  factory SummaryFieldForceYearGrade1.fromSummaryFieldForceYearRaw(
    SummaryFieldForceYearRaw raw,
  ) {
    final grade2IsEmpty = raw.flag == '' || raw.flag == 'ALL';

    if (!grade2IsEmpty) {
      return SummaryFieldForceYearGrade1(
        typeRow: 'one',
        category: raw.category,
        categoryParent: raw.categoryParent,
        areaCode: raw.areaCode,
        jabCode: raw.jabCode,
        month1: 0,
        month2: 0,
        month3: 0,
        month4: 0,
        month5: 0,
        month6: 0,
        month7: 0,
        month8: 0,
        month9: 0,
        month10: 0,
        month11: 0,
        month12: 0,
        children: [
          SummaryFieldForceYearGrade2.fromSummaryFieldForceYearRaw(raw),
        ],
      );
    } else {
      return SummaryFieldForceYearGrade1(
        typeRow: 'one',
        category: raw.category,
        categoryParent: raw.categoryParent,
        areaCode: raw.areaCode,
        jabCode: raw.jabCode,
        month1: raw.month1,
        month2: raw.month2,
        month3: raw.month3,
        month4: raw.month4,
        month5: raw.month5,
        month6: raw.month6,
        month7: raw.month7,
        month8: raw.month8,
        month9: raw.month9,
        month10: raw.month10,
        month11: raw.month11,
        month12: raw.month12,
        children: [],
      );
    }
  }

  final List<SummaryFieldForceYearGrade2> children;
}

class SummaryFieldForceYearGrade2 extends SummaryFieldForceYear {
  SummaryFieldForceYearGrade2({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.month1,
    required super.month2,
    required super.month3,
    required super.month4,
    required super.month5,
    required super.month6,
    required super.month7,
    required super.month8,
    required super.month9,
    required super.month10,
    required super.month11,
    required super.month12,
    required this.children,
  });
  factory SummaryFieldForceYearGrade2.fromSummaryFieldForceYearRaw(
    SummaryFieldForceYearRaw raw,
  ) {
    final grade3IsEmpty = raw.area == '' || raw.area == 'ALL';
    final rawFlag = raw.flag == 'PRODUCT';
    final rawCategory = raw.category == 'SALES';

    return SummaryFieldForceYearGrade2(
      typeRow: 'two',
      category: raw.flag,
      categoryParent: raw.categoryParent,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      month1: raw.month1,
      month2: raw.month2,
      month3: raw.month3,
      month4: raw.month4,
      month5: raw.month5,
      month6: raw.month6,
      month7: raw.month7,
      month8: raw.month8,
      month9: raw.month9,
      month10: raw.month10,
      month11: raw.month11,
      month12: raw.month12,
      children: [
        if (!grade3IsEmpty)
          SummaryFieldForceYearGrade3.fromSummaryFieldForceYearRaw(raw),
        if (rawFlag && rawCategory)
          SummaryFieldForceYearGrade3.fromSummaryFieldForceYearRaw(raw),
      ],
    );
  }
  final List<SummaryFieldForceYearGrade3> children;
}

class SummaryFieldForceYearGrade3 extends SummaryFieldForceYear {
  SummaryFieldForceYearGrade3({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.month1,
    required super.month2,
    required super.month3,
    required super.month4,
    required super.month5,
    required super.month6,
    required super.month7,
    required super.month8,
    required super.month9,
    required super.month10,
    required super.month11,
    required super.month12,
    required this.children,
  });
  factory SummaryFieldForceYearGrade3.fromSummaryFieldForceYearRaw(
    SummaryFieldForceYearRaw raw,
  ) {
    final grade4IsEmpty = raw.dataFlag == '' || raw.dataFlag == 'ALL';
    return SummaryFieldForceYearGrade3(
      typeRow: 'three',
      category: raw.area,
      categoryParent: raw.categoryParent,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      month1: raw.month1,
      month2: raw.month2,
      month3: raw.month3,
      month4: raw.month4,
      month5: raw.month5,
      month6: raw.month6,
      month7: raw.month7,
      month8: raw.month8,
      month9: raw.month9,
      month10: raw.month10,
      month11: raw.month11,
      month12: raw.month12,
      children: [
        if (!grade4IsEmpty)
          SummaryFieldForceYearGrade4.fromSummaryFieldForceYearRaw(raw),
      ],
    );
  }

  final List<SummaryFieldForceYearGrade4> children;
}

class SummaryFieldForceYearGrade4 extends SummaryFieldForceYear {
  SummaryFieldForceYearGrade4({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.month1,
    required super.month2,
    required super.month3,
    required super.month4,
    required super.month5,
    required super.month6,
    required super.month7,
    required super.month8,
    required super.month9,
    required super.month10,
    required super.month11,
    required super.month12,
  });

  factory SummaryFieldForceYearGrade4.fromSummaryFieldForceYearRaw(
    SummaryFieldForceYearRaw raw,
  ) {
    return SummaryFieldForceYearGrade4(
      typeRow: 'four',
      category: raw.dataFlag,
      categoryParent: raw.categoryParent,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      month1: raw.month1,
      month2: raw.month2,
      month3: raw.month3,
      month4: raw.month4,
      month5: raw.month5,
      month6: raw.month6,
      month7: raw.month7,
      month8: raw.month8,
      month9: raw.month9,
      month10: raw.month10,
      month11: raw.month11,
      month12: raw.month12,
    );
  }
}
