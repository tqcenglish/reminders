class ResponseMsg {
  String specialDB;
  String status;

  static ResponseMsg fromJson(Map<String, dynamic> input) {
    if (input == null) return null;
    return new ResponseMsg()
      ..specialDB = input['special_db']
      ..status = input['status'];
  }
}
