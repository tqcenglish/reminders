class ResponseMsg {
  String message;
  String status;

  static ResponseMsg fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    return new ResponseMsg()
      ..message = input['message']
      ..status = input['status'];
  }
}
