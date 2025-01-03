import 'package:flexurio_chiron_accounting/src/app/model/cogs.dart';

List<CogsGrade1> cogsGroup(List<CogsRaw> cogsData) {
  final cogsResult = <CogsGrade1>[];
  for (final cogs in cogsData) {
    final key1 = cogs.name;
    final index1 = cogsResult.indexWhere((cogs) => cogs.name == key1);
    if (index1 > -1) {
      final cogs1 = cogsResult[index1];
      final key2 = cogs.nameGrade2;
      final index2 = cogs1.children.indexWhere((cogs) => cogs.name == key2);
      if (index2 > -1) {
        final cogs2 = cogs1.children[index2];
        final key3 = cogs.nameGrade3;
        final index3 = cogs2.children.indexWhere((cogs) => cogs.name == key3);
        if (index3 > -1) {
          final cogs3 = cogs2.children[index3];
          final grade4 = CogsGrade4.fromCogsRaw(cogs);

          if (grade4.name != '') {
            cogs1.sum(grade4);
            cogs2.sum(grade4);
            cogs3.sum(grade4);
            cogs3.children.add(grade4);
          } else {
            cogs3.categoryId = grade4.categoryId;
            cogs3.children.remove(grade4);
          }
        } else {
          final grade3 = CogsGrade3.fromCogsRaw(cogs);
          cogs1.sum(grade3);
          cogs2.sum(grade3);
          cogs2.children.add(grade3);
        }
      } else {
        final grade2 = CogsGrade2.fromCogsRaw(cogs);
        cogs1.sum(grade2);
        cogs1.children.add(grade2);
      }
    } else {
      cogsResult.add(CogsGrade1.fromCogsRaw(cogs));
    }
  }
  return cogsResult;
}
