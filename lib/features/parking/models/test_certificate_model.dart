class TestCertificateModel {
  final bool? status;
  final String? message;

  TestCertificateModel({this.status, this.message});

  factory TestCertificateModel.fromJson(Map<String, dynamic> json) {
    return TestCertificateModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }
}
