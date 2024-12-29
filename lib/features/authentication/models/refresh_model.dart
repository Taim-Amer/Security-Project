class RefreshModel {
  bool? status;
  String? accessToken;
  int? expiresIn;

  RefreshModel({this.status, this.accessToken, this.expiresIn});

  RefreshModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
