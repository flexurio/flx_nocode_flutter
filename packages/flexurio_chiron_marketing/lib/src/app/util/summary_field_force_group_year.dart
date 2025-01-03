import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force_year.dart';

List<SummaryFieldForceYearGrade1> summaryFieldForceYearGroup(
  List<SummaryFieldForceYearRaw> summaryFieldForceData,
) {
  final summaryFieldForceResult = <SummaryFieldForceYearGrade1>[];
  for (final summaryFieldForce in summaryFieldForceData) {
    final key1 = summaryFieldForce.category;
    final index1 = summaryFieldForceResult
        .indexWhere((summaryFF) => summaryFF.category == key1);
    if (index1 > -1) {
      final summaryFF1 = summaryFieldForceResult[index1];
      final key2 = summaryFieldForce.flag;
      final index2 = summaryFF1.children
          .indexWhere((summaryFF) => summaryFF.category == key2);
      if (index2 > -1) {
        final summaryFF2 = summaryFF1.children[index2];
        final key3 = summaryFieldForce.area;
        final index3 = summaryFF2.children
            .indexWhere((summaryFF) => summaryFF.category == key3);
        if (index3 > -1) {
          final summaryFF3 = summaryFF2.children[index3];
          final grade4 =
              SummaryFieldForceYearGrade4.fromSummaryFieldForceYearRaw(
            summaryFieldForce,
          );

          summaryFF2.sum(grade4);
          summaryFF3.sum(grade4);
          summaryFF3.children.add(grade4);
        } else {
          final grade3 =
              SummaryFieldForceYearGrade3.fromSummaryFieldForceYearRaw(
            summaryFieldForce,
          );
          summaryFF2.sum(grade3);
          summaryFF2.children.add(grade3);
        }
      } else {
        final grade2 = SummaryFieldForceYearGrade2.fromSummaryFieldForceYearRaw(
          summaryFieldForce,
        );
        summaryFF1.children.add(grade2);
      }
    } else {
      summaryFieldForceResult.add(
        SummaryFieldForceYearGrade1.fromSummaryFieldForceYearRaw(
          summaryFieldForce,
        ),
      );
    }
  }
  return summaryFieldForceResult;
}
