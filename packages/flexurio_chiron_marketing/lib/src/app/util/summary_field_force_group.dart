import 'package:flexurio_chiron_marketing/src/app/model/summary_field_force.dart';

List<SummaryFieldForceRaw> summaryFieldForceFlagAll = [];
List<SummaryFieldForceGrade1> summaryFieldForceGroup(
  List<SummaryFieldForceRaw> summaryFieldForceData,
) {
  final summaryFieldForceResult = <SummaryFieldForceGrade1>[];
  summaryFieldForceFlagAll = [];
  for (final summaryFieldForce in summaryFieldForceData) {
    final key1 = summaryFieldForce.category;
    final index1 = summaryFieldForceResult
        .indexWhere((summaryFf) => summaryFf.category == key1);
    if (summaryFieldForce.flag == 'ALL') {
      summaryFieldForceFlagAll.add(summaryFieldForce);
    }
    if (index1 > -1) {
      final summaryFf1 = summaryFieldForceResult[index1];
      final key2 = summaryFieldForce.flag;
      if (key2 == 'ALL') {
        summaryFieldForceFlagAll.add(summaryFieldForce);
      } else {
        final index2 = summaryFf1.children
            .indexWhere((summaryFf) => summaryFf.category == key2);
        if (index2 > -1) {
          final summaryFf2 = summaryFf1.children[index2];
          final key3 = summaryFieldForce.area;
          final index3 = summaryFf2.children
              .indexWhere((summaryFf) => summaryFf.category == key3);
          if (index3 > -1) {
            final summaryFf3 = summaryFf2.children[index3];
            final grade4 = SummaryFieldForceGrade4.fromSummaryFieldForceRaw(
              summaryFieldForce,
            );
            summaryFf3.children.add(grade4);
            if (key1 == 'STOCK' && key2 == 'PRODUCT') {}
            for (final month in grade4.amounts!.keys) {
              final amount = summaryFf3.amounts![month]!;
              summaryFf3.amounts![month] = amount + grade4.amounts![month]!;
            }
          } else {
            final grade3 = SummaryFieldForceGrade3.fromSummaryFieldForceRaw(
              summaryFieldForce,
            );
            summaryFf2.children.add(grade3);
          }
        } else {
          final grade2 = SummaryFieldForceGrade2.fromSummaryFieldForceRaw(
            summaryFieldForce,
          );
          // if (summaryFieldForce.category != 'SALES' &&
          //     summaryFieldForce.flag != 'ALL') {
          //   for (final month in grade2.amounts!.keys) {
          //     grade2.amounts![month] = 0;
          //   }
          // }

          summaryFf1.children.add(grade2);
          summaryFf1.children = List.from(summaryFf1.children)
            ..sort(
              (a, b) => a.category.compareTo(b.category),
            );
        }
      }
    } else {
      summaryFieldForceResult.add(
        SummaryFieldForceGrade1.fromSummaryFieldForceRaw(
          summaryFieldForce,
        ),
      );
    }
  }

  // for (final summaryFieldForce in summaryFieldForceResult) {
  //   final key1 = summaryFieldForce.category;
  //   final index1 = summaryFieldForceResult
  //       .indexWhere((summaryFf) => summaryFf.category == key1);
  //   if (index1 > -1) {
  //     final sub2 = summaryFieldForceResult[index1].children;
  //     for (final summaryFieldForce2 in sub2) {
  //       final key2 = summaryFieldForce2.category;
  //       final index2 =
  //           sub2.indexWhere((summaryFf) => summaryFf.category == key2);
  //       if (index2 > -1) {
  //         final sub3 = sub2[index2].children;
  //         final totalSub2 = sub2[index2];
  //         totalSub2.amounts?.map((key, value) => MapEntry(key, 0));
  //         for (final summaryFieldForce3 in sub3) {
  //           for (final month in summaryFieldForce3.amounts!.keys) {
  //             final amount = summaryFieldForce3.amounts![month];
  //             if (summaryFieldForce3.category ==
  //                 '9.0 SUBMISSION LBB MARKETING') {
  //               totalSub2.amounts![month] = totalSub2.amounts![month]! + 0;
  //             } else if (summaryFieldForce3.category ==
  //                 '9.1 REALIZATION LBB MARKETING') {
  //               totalSub2.amounts![month] = totalSub2.amounts![month]! + 0;
  //             } else {
  //               totalSub2.amounts![month] =
  //                   totalSub2.amounts![month]! + amount!;
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  // }
  // for (final summaryFieldForce in summaryFieldForceResult) {
  //   final key1 = summaryFieldForce.category;
  //   if (key1 == 'MTD' || key1 == 'YTD') {
  //     final index1 = summaryFieldForceResult
  //         .indexWhere((summaryFf) => summaryFf.category == key1);
  //     if (index1 > -1) {
  //       final sub2 = summaryFieldForceResult[index1].children;
  //       summaryFieldForce.amounts?.map((key, value) => MapEntry(key, 0));
  //       for (final summaryFieldForce2 in sub2) {
  //         for (final month in summaryFieldForce2.amounts!.keys) {
  //           final amount = summaryFieldForce2.amounts![month];
  //           summaryFieldForce.amounts![month] =
  //               summaryFieldForce.amounts![month]! + amount!;
  //         }
  //       }
  //     }
  //   }
  // }
  return summaryFieldForceResult;
}
