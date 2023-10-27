// To parse this JSON data, do
//
//     final listUpdateEartquakeInfo = listUpdateEartquakeInfoFromJson(jsonString);

import 'dart:convert';

ListUpdateEartquakeInfo listUpdateEartquakeInfoFromJson(String str) =>
    ListUpdateEartquakeInfo.fromJson(json.decode(str));

String listUpdateEartquakeInfoToJson(ListUpdateEartquakeInfo data) =>
    json.encode(data.toJson());

class ListUpdateEartquakeInfo {
  Infogempa? infogempa;

  ListUpdateEartquakeInfo({
    this.infogempa,
  });

  factory ListUpdateEartquakeInfo.fromJson(Map<String, dynamic> json) =>
      ListUpdateEartquakeInfo(
        infogempa: json["Infogempa"] == null
            ? null
            : Infogempa.fromJson(json["Infogempa"]),
      );

  Map<String, dynamic> toJson() => {
        "Infogempa": infogempa?.toJson(),
      };
}

class Infogempa {
  List<Gempa>? gempa;

  Infogempa({
    this.gempa,
  });

  factory Infogempa.fromJson(Map<String, dynamic> json) => Infogempa(
        gempa: json["gempa"] == null
            ? []
            : List<Gempa>.from(json["gempa"]!.map((x) => Gempa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gempa": gempa == null
            ? []
            : List<dynamic>.from(gempa!.map((x) => x.toJson())),
      };
}

class Gempa {
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

  Gempa({
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
  });

  factory Gempa.fromJson(Map<String, dynamic> json) => Gempa(
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
      };
}
