class PublicKeyModel {
  bool? status;
  String? message;
  String? publicKey;

  PublicKeyModel({this.status, this.message, this.publicKey});

  PublicKeyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    publicKey = json['publicKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['publicKey'] = publicKey;
    return data;
  }
}
