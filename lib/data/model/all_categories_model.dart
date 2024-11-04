import 'dart:convert';

class AllCategoriesModel {
  List<Datum> data;
  String message;

  AllCategoriesModel({
    required this.data,
    required this.message,
  });

  factory AllCategoriesModel.fromRawJson(String str) =>
      AllCategoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllCategoriesModel.fromJson(Map<String, dynamic> json) =>
      AllCategoriesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  int id;
  String name;

  Datum({
    required this.id,
    required this.name,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
