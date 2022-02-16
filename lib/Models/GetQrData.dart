// To parse this JSON data, do
//
//     final getQrData = getQrDataFromJson(jsonString);

import 'dart:convert';

GetQrData getQrDataFromJson(String str) => GetQrData.fromJson(json.decode(str));

String getQrDataToJson(GetQrData data) => json.encode(data.toJson());

class GetQrData {
  GetQrData({
  required  this.batchcode,
    required   this.book,
    required  this.date,
    required  this.time,
    required  this.stdid,
  });

  String batchcode;
  String book;
  String date;
  String time;
  List<String> stdid;

  factory GetQrData.fromJson(Map<String, dynamic> json) => GetQrData(
    batchcode: json["batchcode"],
    book: json["book"],
    date: json["date"],
    time: json["time"],
    stdid: List<String>.from(json["stdid"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "batchcode": batchcode,
    "book": book,
    "date": date,
    "time": time,
    "stdid": List<dynamic>.from(stdid.map((x) => x)),
  };
}
