abstract class SummaryFieldForceEbitda {
  SummaryFieldForceEbitda({
    required this.category,
    required this.categoryParent,
    required this.areaCode,
    required this.jabCode,
    required this.amounts,
    required this.area,
    required this.flag,
    required this.dataFlag,
    this.typeRow,
  });

  String? typeRow;
  final String category;
  final String categoryParent;
  late String? flag;
  late String? area;
  late String? dataFlag;
  late String? areaCode;
  late String? jabCode;
  Map<DateTime, double>? amounts;

  double getValueByMonth(int month) {
    return amounts?.values.toList()[month] ?? 0;
  }
}

class SummaryFieldForceEbitdaRaw extends SummaryFieldForceEbitda {
  SummaryFieldForceEbitdaRaw({
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.flag,
    required super.area,
    required super.dataFlag,
    required super.amounts,
    super.typeRow,
  });

  factory SummaryFieldForceEbitdaRaw.fromJson(Map<String, dynamic> json) {
    final amounts = (json['amounts'] as Map<String, dynamic>).map((key, value) {
      final keySplit = key.split('_');
      final year = int.parse(keySplit[0]);
      final month = int.parse(keySplit[1]);
      return MapEntry(DateTime(year, month), (value as num).toDouble());
    });

    return SummaryFieldForceEbitdaRaw(
      areaCode: json['area_code'] as String,
      jabCode: json['jab_code'] as String,
      categoryParent: json['category'] as String,
      category: json['category'] as String,
      flag: json['flag'] as String,
      area: json['area'] as String,
      dataFlag: json['data'] as String,
      amounts: amounts,
      typeRow: '',
    );
  }
}

class SummaryFieldForceEbitdaGrade1 extends SummaryFieldForceEbitda {
  SummaryFieldForceEbitdaGrade1({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
    required super.area,
    required super.flag,
    required super.dataFlag,
  });

  factory SummaryFieldForceEbitdaGrade1.fromSummaryFieldForceEbitdaRaw(
    SummaryFieldForceEbitdaRaw raw,
  ) {
    final grade2IsEmpty = raw.flag == '' || raw.flag == 'ALL';
    if (!grade2IsEmpty) {
      final amounts = raw.amounts!.map((key, value) {
        value = 0;
        return MapEntry(key, value);
      });
      return SummaryFieldForceEbitdaGrade1(
        typeRow: 'one',
        category: raw.category,
        categoryParent: raw.categoryParent,
        flag: raw.flag,
        area: raw.area,
        dataFlag: raw.dataFlag,
        areaCode: raw.areaCode,
        jabCode: raw.jabCode,
        amounts: amounts,
        children: [
          SummaryFieldForceEbitdaGrade2.fromSummaryFieldForceEbitdaRaw(raw),
        ],
      );
    } else {
      final amounts = raw.amounts!.map((key, value) {
        return MapEntry(key, value);
      });
      return SummaryFieldForceEbitdaGrade1(
        typeRow: 'one',
        category: raw.category,
        categoryParent: raw.categoryParent,
        flag: raw.flag,
        area: raw.area,
        dataFlag: raw.dataFlag,
        areaCode: raw.areaCode,
        jabCode: raw.jabCode,
        amounts: amounts,
        children: [],
      );
    }
  }

  final List<SummaryFieldForceEbitdaGrade2> children;
}

class SummaryFieldForceEbitdaGrade2 extends SummaryFieldForceEbitda {
  SummaryFieldForceEbitdaGrade2({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
    required super.area,
    required super.flag,
    required super.dataFlag,
  });
  factory SummaryFieldForceEbitdaGrade2.fromSummaryFieldForceEbitdaRaw(
    SummaryFieldForceEbitdaRaw raw,
  ) {
    final grade3IsEmpty = raw.area == '' || raw.area == 'ALL';
    final rawFlag = raw.flag == 'PRODUCT';
    final rawCategory = raw.category == 'SALES';
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });

    return SummaryFieldForceEbitdaGrade2(
      typeRow: 'two',
      category: raw.flag!,
      categoryParent: raw.categoryParent,
      flag: raw.flag,
      area: raw.area,
      dataFlag: raw.dataFlag,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      amounts: amounts,
      children: [
        if (!grade3IsEmpty)
          SummaryFieldForceEbitdaGrade3.fromSummaryFieldForceEbitdaRaw(raw),
        if (rawFlag && rawCategory)
          SummaryFieldForceEbitdaGrade3.fromSummaryFieldForceEbitdaRaw(raw),
      ],
    );
  }
  List<SummaryFieldForceEbitdaGrade3> children;
}

class SummaryFieldForceEbitdaGrade3 extends SummaryFieldForceEbitda {
  SummaryFieldForceEbitdaGrade3({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
    required super.area,
    required super.flag,
    required super.dataFlag,
  });
  factory SummaryFieldForceEbitdaGrade3.fromSummaryFieldForceEbitdaRaw(
    SummaryFieldForceEbitdaRaw raw,
  ) {
    final grade4IsEmpty = raw.dataFlag == '' || raw.dataFlag == 'ALL';
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });
    return SummaryFieldForceEbitdaGrade3(
      typeRow: 'three',
      category: raw.area!,
      categoryParent: raw.categoryParent,
      flag: raw.flag,
      area: raw.area,
      dataFlag: raw.dataFlag,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      amounts: amounts,
      children: [
        if (!grade4IsEmpty)
          SummaryFieldForceEbitdaGrade4.fromSummaryFieldForceEbitdaRaw(raw),
      ],
    );
  }

  final List<SummaryFieldForceEbitdaGrade4> children;
}

class SummaryFieldForceEbitdaGrade4 extends SummaryFieldForceEbitda {
  SummaryFieldForceEbitdaGrade4({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required super.area,
    required super.flag,
    required super.dataFlag,
  });

  factory SummaryFieldForceEbitdaGrade4.fromSummaryFieldForceEbitdaRaw(
    SummaryFieldForceEbitdaRaw raw,
  ) {
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });
    return SummaryFieldForceEbitdaGrade4(
      typeRow: 'four',
      category: raw.dataFlag!,
      categoryParent: raw.categoryParent,
      flag: raw.flag,
      area: raw.area,
      dataFlag: raw.dataFlag,
      areaCode: raw.areaCode,
      jabCode: raw.jabCode,
      amounts: amounts,
    );
  }
}
