class ProcessPaymentModel {
  final bool? status;
  final String? message;
  final PaymentData? data;

  ProcessPaymentModel({
    this.status,
    this.message,
    this.data,
  });

  factory ProcessPaymentModel.fromJson(Map<String, dynamic> json) {
    return ProcessPaymentModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? PaymentData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class PaymentData {
  final int garageId;
  final double amount;

  PaymentData({
    required this.garageId,
    required this.amount,
  });

  factory PaymentData.fromJson(Map<String, dynamic> json) {
    return PaymentData(
      garageId: json['garage_id'] ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'garage_id': garageId,
      'amount': amount,
    };
  }
}
