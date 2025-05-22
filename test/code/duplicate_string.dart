// // Dart script to check for duplicate literal strings in a Dart file
//
// import 'dart:io';
// import 'package:collection/collection.dart';
//
// void main() {
//   const filePath =
//       '../../packages/flexurio_chiron_sales_order/lib/src/app/view/page/sales_order/widget/sales_order_delivery_order_button.dart';
//
//   final file = File(filePath);
//
//   if (!file.existsSync()) {
//     print('File not found: \$filePath');
//     return;
//   }
//
//   final content = file.readAsStringSync();
//
//   // Extract all string literals
//   final regex = RegExp(r'"(.*?)"');
//   final matches =
//       regex.allMatches(content).map((match) => match.group(0)!).toList();
//
//   // Count occurrences of each string
//   final occurrences = groupBy(matches, (String str) => str)
//       .map((key, value) => MapEntry(key, value.length))
//       .entries
//       .where((entry) => entry.value > 1);
//
//   if (occurrences.isEmpty) {
//     print('No duplicate literal strings found in \$filePath.');
//   } else {
//     print('Duplicate literal strings found in \$filePath:');
//     for (final entry in occurrences) {
//       print('String: \${entry.key} - Count: \${entry.value}');
//     }
//     print('\nSuggestion: Replace repeated strings with variables or methods.');
//   }
// }
