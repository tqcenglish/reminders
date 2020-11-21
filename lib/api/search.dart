import 'package:reminders/model/song.dart';

typedef JSONConverter<S, T> = T Function(S input);

// 设备信息返回
abstract class SearchResult<T> {
  int code;
  List<T> items;
}

SearchResult<T> _fromJson<T>(SearchResult<T> result, Map<String, dynamic> input,
    JSONConverter<Map<String, dynamic>, T> converter) {
  result.code = input["code"];
  var tracks = input['playlist']['tracks'] as List;
  if (tracks != null) {
    tracks.forEach((it) {
      var json = it as Map<String, dynamic>;
      result.items.add(converter(json));
    });
  }

  return result;
}

class SongResult extends SearchResult<Song> {
  static SongResult fromJson(Map<String, dynamic> input) {
    SearchResult result = SongResult();
    result.items = List<Song>();
    return _fromJson(result, input, Song.fromJson);
  }
}
