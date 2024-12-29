class ReverseParkingModel {
  bool? status;
  String? message;
  Reservation? reservation;

  ReverseParkingModel({this.status, this.message, this.reservation});

  ReverseParkingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    reservation = json['reservation'] != null
        ? Reservation.fromJson(json['reservation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (reservation != null) {
      data['reservation'] = reservation!.toJson();
    }
    return data;
  }
}

class Reservation {
  int? garageId;
  String? date;

  Reservation({this.garageId, this.date});

  Reservation.fromJson(Map<String, dynamic> json) {
    garageId = json['garage_id'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['garage_id'] = garageId;
    data['date'] = date;
    return data;
  }
}
