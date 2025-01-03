abstract class Cogs {
  Cogs({
    required this.name,
    required this.categoryId,
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
  });

  final String name;
  late String? categoryId;
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

  void sum(Cogs cogs) {
    month1 += cogs.month1;
    month2 += cogs.month2;
    month3 += cogs.month3;
    month4 += cogs.month4;
    month5 += cogs.month5;
    month6 += cogs.month6;
    month7 += cogs.month7;
    month8 += cogs.month8;
    month9 += cogs.month9;
    month10 += cogs.month10;
    month11 += cogs.month11;
    month12 += cogs.month12;
  }
}

class CogsRaw extends Cogs {
  CogsRaw({
    required super.name,
    required super.categoryId,
    required this.nameGrade2,
    required this.nameGrade3,
    required this.nameGrade4,
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

  factory CogsRaw.fromJson(Map<String, dynamic> json) {
    return CogsRaw(
      name: json['grade_1'] as String,
      nameGrade2: json['grade_2'] as String,
      nameGrade3: json['grade_3'] as String,
      nameGrade4: json['grade_4'] as String,
      categoryId: json['category_id'] as String,
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
    );
  }

  final String nameGrade2;
  final String nameGrade3;
  final String nameGrade4;
}

class CogsGrade1 extends Cogs {
  CogsGrade1({
    required super.name,
    required super.categoryId,
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

  factory CogsGrade1.fromCogsRaw(CogsRaw raw) {
    return CogsGrade1(
      name: raw.name,
      categoryId: null,
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
      children: [CogsGrade2.fromCogsRaw(raw)],
    );
  }

  final List<CogsGrade2> children;
}

class CogsGrade2 extends Cogs {
  CogsGrade2({
    required super.name,
    required super.categoryId,
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
  factory CogsGrade2.fromCogsRaw(CogsRaw raw) {
    final grade3IsEmpty = raw.nameGrade3 == '';

    return CogsGrade2(
      name: raw.nameGrade2,
      categoryId: grade3IsEmpty ? raw.categoryId : null,
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
      children: [if (!grade3IsEmpty) CogsGrade3.fromCogsRaw(raw)],
    );
  }
  final List<CogsGrade3> children;
}

class CogsGrade3 extends Cogs {
  CogsGrade3({
    required super.name,
    required super.categoryId,
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
  factory CogsGrade3.fromCogsRaw(CogsRaw raw) {
    final grade4IsEmpty = raw.nameGrade4 == '';
    return CogsGrade3(
      name: raw.nameGrade3,
      categoryId: grade4IsEmpty ? raw.categoryId : null,
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
      children: [if (!grade4IsEmpty) CogsGrade4.fromCogsRaw(raw)],
    );
  }

  final List<CogsGrade4> children;
}

class CogsGrade4 extends Cogs {
  CogsGrade4({
    required super.name,
    required super.categoryId,
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

  factory CogsGrade4.fromCogsRaw(CogsRaw raw) {
    return CogsGrade4(
      name: raw.nameGrade4,
      categoryId: raw.categoryId,
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
