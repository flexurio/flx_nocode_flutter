import 'package:flexurio_chiron_presence/src/app/model/presence.dart';

Map<String, Map<int, Presence>> presenceGroupByUser(List<Presence> presences) {
  final data = <String, Map<int, Presence>>{};
  for (final presence in presences) {
    final userKey = '${presence.userName} (${presence.userId})';
    final date = presence.inDateTime?.day;
    if (data.containsKey(userKey) && date != null) {
      data[userKey]?[date] = presence;
    } else {
      data[userKey] = {};
      if (date != null) {
        data[userKey]?[date] = presence;
      }
    }
  }
  return data;
}
