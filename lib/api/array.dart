import 'package:reminders/model/song.dart';

typedef JSONConverter<S, T> = T Function(S input);

// 酷狗网
abstract class ArrayResult<T> {
  List<T> items;
}

ArrayResult<T> _fromJson<T>(ArrayResult<T> result, List<dynamic> input,
    JSONConverter<Map<String, dynamic>, T> converter) {

  var items = input;
  if (items != null) {
    items.forEach((it) {
      var json = it as Map<String, dynamic>;
      result.items.add(converter(json));
    });
  }
  return result;
}

class SongModelResult extends ArrayResult<SongModel> {
  static SongModelResult fromJson(List<dynamic> input) {
    SongModelResult result = SongModelResult();
    result.items = List<SongModel>();
    return _fromJson(result, input, SongModel.fromJson);
  }
}
