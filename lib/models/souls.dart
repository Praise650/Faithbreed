import 'package:flutter/foundation.dart';

class Souls {
  String? id;
  late String fullname;
  late String email;
  late String phoneNumber;
  late String address;
  late String occupation;
  late String location;
  late String timesStamp;
  late DateTime createdAt;

  Souls(this.fullname, this.email, this.phoneNumber, this.address,
      this.occupation, this.location) {
    this.createdAt = DateTime.now();
    this.timesStamp = createdAt.toString();
  }

  Souls.fromJson(Map<String, dynamic> data) {
    this.fullname = data["FullName"]!;
    this.email = data["E-mail"]!;
    this.phoneNumber = data["PhoneNumber"]!;
    this.address = data["Address"]!;
    this.occupation = data["Occupation"]!;
    this.location = data["location"] ?? "";
    this.timesStamp = data["timestamp"]!;
    this.createdAt = DateTime.fromMillisecondsSinceEpoch(
        int.parse(data["createdAt"]!.toString()));
  }

  Map<String, dynamic> toJson() {
    return {
      'FullName': this.fullname,
      'E-mail': this.email,
      'Address': this.address,
      'PhoneNumber': this.phoneNumber,
      'Occupation': this.occupation,
      'location': this.location,
      'timestamp': this.timesStamp,
      'createdAt': this.createdAt.millisecondsSinceEpoch,
    };
  }
}
