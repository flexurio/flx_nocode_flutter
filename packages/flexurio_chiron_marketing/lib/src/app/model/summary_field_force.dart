abstract class SummaryFieldForce {
  SummaryFieldForce({
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
  late String? areaCode;
  late String? jabCode;
  late String? flag;
  late String? area;
  late String? dataFlag;
  Map<DateTime, double>? amounts;

  double getValueByMonth(int month) {
    return amounts?.values.toList()[month] ?? 0;
  }
}

class SummaryFieldForceRaw extends SummaryFieldForce {
  SummaryFieldForceRaw({
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

  factory SummaryFieldForceRaw.fromJson(Map<String, dynamic> json) {
    final amounts = (json['amounts'] as Map<String, dynamic>).map((key, value) {
      final keySplit = key.split('_');
      final year = int.parse(keySplit[0]);
      final month = int.parse(keySplit[1]);
      return MapEntry(DateTime(year, month), (value as num).toDouble());
    });
    return SummaryFieldForceRaw(
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

class SummaryFieldForceGrade1 extends SummaryFieldForce {
  SummaryFieldForceGrade1({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.flag,
    required super.area,
    required super.dataFlag,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
  });

  factory SummaryFieldForceGrade1.fromSummaryFieldForceRaw(
    SummaryFieldForceRaw raw,
  ) {
    final grade2IsEmpty = raw.flag == '' || raw.flag == 'ALL';

    if (!grade2IsEmpty) {
      final amounts = raw.amounts!.map((key, value) {
        value = 0;
        return MapEntry(key, value);
      });
      return SummaryFieldForceGrade1(
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
          SummaryFieldForceGrade2.fromSummaryFieldForceRaw(raw),
        ],
      );
    } else {
      final amounts = raw.amounts!.map((key, value) {
        return MapEntry(key, value);
      });
      return SummaryFieldForceGrade1(
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

  List<SummaryFieldForceGrade2> children;
}

class SummaryFieldForceGrade2 extends SummaryFieldForce {
  SummaryFieldForceGrade2({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.flag,
    required super.area,
    required super.dataFlag,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
  });
  factory SummaryFieldForceGrade2.fromSummaryFieldForceRaw(
    SummaryFieldForceRaw raw,
  ) {
    final grade3IsEmpty = raw.area == '' || raw.area == 'ALL';
    final rawFlag = raw.flag == 'PRODUCT';
    final rawCategory = raw.category == 'SALES';
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });

    return SummaryFieldForceGrade2(
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
          SummaryFieldForceGrade3.fromSummaryFieldForceRaw(raw),
        if (rawFlag && rawCategory)
          SummaryFieldForceGrade3.fromSummaryFieldForceRaw(raw),
      ],
    );
  }
  final List<SummaryFieldForceGrade3> children;
}

class SummaryFieldForceGrade3 extends SummaryFieldForce {
  SummaryFieldForceGrade3({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.flag,
    required super.area,
    required super.dataFlag,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
    required this.children,
  });
  factory SummaryFieldForceGrade3.fromSummaryFieldForceRaw(
    SummaryFieldForceRaw raw,
  ) {
    final grade4IsEmpty = raw.dataFlag == '' || raw.dataFlag == 'ALL';
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });
    return SummaryFieldForceGrade3(
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
          SummaryFieldForceGrade4.fromSummaryFieldForceRaw(raw),
      ],
    );
  }

  final List<SummaryFieldForceGrade4> children;
}

class SummaryFieldForceGrade4 extends SummaryFieldForce {
  SummaryFieldForceGrade4({
    required super.typeRow,
    required super.category,
    required super.categoryParent,
    required super.flag,
    required super.area,
    required super.dataFlag,
    required super.areaCode,
    required super.jabCode,
    required super.amounts,
  });

  factory SummaryFieldForceGrade4.fromSummaryFieldForceRaw(
    SummaryFieldForceRaw raw,
  ) {
    final amounts = raw.amounts!.map((key, value) {
      return MapEntry(key, value);
    });
    return SummaryFieldForceGrade4(
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
