class SessionKeyModel {
  bool? status;
  String? message;
  String? sessionKey;

  SessionKeyModel({this.status, this.message, this.sessionKey});

  SessionKeyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    sessionKey = json['sessionKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['sessionKey'] = sessionKey;
    return data;
  }
}
