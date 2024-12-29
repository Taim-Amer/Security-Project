class SigninModel {
  bool? status;
  String? accessToken;
  int? expiresIn;
  User? userData;

  SigninModel({this.status, this.accessToken, this.expiresIn, this.userData});

  SigninModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    userData = json['user_data'] != null ? User.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['access_token'] = accessToken;
    data['expires_in'] = expiresIn;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.email, this.name, this.image, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
