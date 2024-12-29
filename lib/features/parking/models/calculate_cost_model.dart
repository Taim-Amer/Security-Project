class CalculateCostModel {
  bool? status;
  String? message;
  CostData? data;

  CalculateCostModel({this.status, this.message, this.data});

  CalculateCostModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CostData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CostData {
  int? garageId;
  int? hours;
  double? hourlyRate;
  double? totalCost;

  CostData({this.garageId, this.hours, this.hourlyRate, this.totalCost});

  CostData.fromJson(Map<String, dynamic> json) {
    garageId = json['garage_id'];
    hours = json['hours'];
    hourlyRate = json['hourly_rate']?.toDouble();
    totalCost = json['total_cost']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['garage_id'] = garageId;
    data['hours'] = hours;
    data['hourly_rate'] = hourlyRate;
    data['total_cost'] = totalCost;
    return data;
  }
}
