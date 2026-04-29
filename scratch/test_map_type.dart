
void main() {
  Map<String, dynamic> original = {"a": 1};
  var mapped = original.map((key, value) => MapEntry(key, value));
  
  print('Type of mapped: ${mapped.runtimeType}');
  print('mapped is Map<String, dynamic>: ${mapped is Map<String, dynamic>}');
  
  List<dynamic> list = [original];
  var mappedList = list.map((e) => e is Map ? e.map((k, v) => MapEntry(k, v)) : e).toList();
  
  print('Type of first element: ${mappedList[0].runtimeType}');
  print('first element is Map<String, dynamic>: ${mappedList[0] is Map<String, dynamic>}');
}
