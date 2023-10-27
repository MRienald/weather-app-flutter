// To parse this JSON data, do
//
//     final updateEartquakeInfo = updateEartquakeInfoFromJson(jsonString);

import 'dart:convert';

UpdateEartquakeInfo updateEartquakeInfoFromJson(String str) =>
    UpdateEartquakeInfo.fromJson(json.decode(str));

String updateEartquakeInfoToJson(UpdateEartquakeInfo data) =>
    json.encode(data.toJson());

class UpdateEartquakeInfo {
  Infogempa? infogempa;

  UpdateEartquakeInfo({
    this.infogempa,
  });

  factory UpdateEartquakeInfo.fromJson(Map<String, dynamic> json) =>
      UpdateEartquakeInfo(
        infogempa: json["Infogempa"] == null
            ? null
            : Infogempa.fromJson(json["Infogempa"]),
      );

  Map<String, dynamic> toJson() => {
        "Infogempa": infogempa?.toJson(),
      };
}

class Infogempa {
  GempaData? gempa;

  Infogempa({
    this.gempa,
  });

  factory Infogempa.fromJson(Map<String, dynamic> json) => Infogempa(
        gempa: json["gempa"] == null ? null : GempaData.fromJson(json["gempa"]),
      );

  Map<String, dynamic> toJson() => {
        "gempa": gempa?.toJson(),
      };
}

class GempaData {
  String? tanggal;
  String? jam;
  DateTime? dateTime;
  String? coordinates;
  String? lintang;
  String? bujur;
  String? magnitude;
  String? kedalaman;
  String? wilayah;
  String? potensi;
  String? dirasakan;
  String? shakemap;

  GempaData({
    this.tanggal,
    this.jam,
    this.dateTime,
    this.coordinates,
    this.lintang,
    this.bujur,
    this.magnitude,
    this.kedalaman,
    this.wilayah,
    this.potensi,
    this.dirasakan,
    this.shakemap,
  });

  factory GempaData.fromJson(Map<String, dynamic> json) => GempaData(
        tanggal: json["Tanggal"],
        jam: json["Jam"],
        dateTime:
            json["DateTime"] == null ? null : DateTime.parse(json["DateTime"]),
        coordinates: json["Coordinates"],
        lintang: json["Lintang"],
        bujur: json["Bujur"],
        magnitude: json["Magnitude"],
        kedalaman: json["Kedalaman"],
        wilayah: json["Wilayah"],
        potensi: json["Potensi"],
        dirasakan: json["Dirasakan"],
        shakemap: json["Shakemap"],
      );

  Map<String, dynamic> toJson() => {
        "Tanggal": tanggal,
        "Jam": jam,
        "DateTime": dateTime?.toIso8601String(),
        "Coordinates": coordinates,
        "Lintang": lintang,
        "Bujur": bujur,
        "Magnitude": magnitude,
        "Kedalaman": kedalaman,
        "Wilayah": wilayah,
        "Potensi": potensi,
        "Dirasakan": dirasakan,
        "Shakemap": shakemap,
      };
}
