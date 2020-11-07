import 'package:reminders/model/song_group.dart';

typedef JSONConverter<S, T> = T Function(S input);

// 酷狗网
abstract class SearchResult<T> {
  int status;
  List<T> items;
}

SearchResult<T> _fromJson<T>(SearchResult<T> result, Map<String, dynamic> input,
    JSONConverter<Map<String, dynamic>, T> converter) {
  result.status = input["status"];

  var items = input['special_db'] as List;
  if (items != null) {
    items.forEach((it) {
      var json = it as Map<String, dynamic>;
      result.items.add(converter(json));
    });
  }

  return result;
}

class SongGroupModelResult extends SearchResult<SongGroupModel> {
  static SongGroupModelResult fromJson(Map<String, dynamic> input) {
    SongGroupModelResult result = SongGroupModelResult();
    result.items = List<SongGroupModel>();
    return _fromJson(result, input, SongGroupModel.fromJson);
  }
}

