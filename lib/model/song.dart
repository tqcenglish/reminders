class Song {
  String name;
  String id;

  Song({
    String name,
    String id,
  }) {
    this.name = name;
    this.id = id;
  }

  static Song fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    return new Song()
      ..id = input['id']
      ..name = input['name'];
  }
}
