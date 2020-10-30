import 'package:reminders/model/task.dart';

typedef JSONConverter<S, T> = T Function(S input);

// 设备信息返回
abstract class SearchResult<T> {
  int totalCount;
  bool incompleteResults;
  List<T> items;
}

SearchResult<T> _fromJson<T>(SearchResult<T> result, Map<String, dynamic> input,
    JSONConverter<Map<String, dynamic>, T> converter) {
  result.totalCount = input["count"];
  result.incompleteResults = true;

  var items = input['rows'] as List;
  if (items != null) {
    items.forEach((it) {
      var json = it as Map<String, dynamic>;
      result.items.add(converter(json));
    });
  }

  return result;
}

class TaskResult extends SearchResult<Task> {
  static TaskResult fromJson(Map<String, dynamic> input) {
    SearchResult result = TaskResult();
    result.items = List<Task>();
    return _fromJson(result, input, Task.fromJson);
  }
}
