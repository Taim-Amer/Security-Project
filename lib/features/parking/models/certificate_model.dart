class CertificateModel {
  final String? certificate;

  CertificateModel({this.certificate});

  factory CertificateModel.fromJson(Map<String, dynamic> json) {
    return CertificateModel(certificate: json['certificate']);
  }

  Map<String, dynamic> toJson() {
    return {'certificate': certificate};
  }
}
