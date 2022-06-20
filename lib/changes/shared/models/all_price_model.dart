// To parse this JSON data, do
//
//     final allPriceModel = allPriceModelFromJson(jsonString);

import 'dart:convert';

AllPriceModel allPriceModelFromJson(String str) =>
    AllPriceModel.fromJson(json.decode(str));

String allPriceModelToJson(AllPriceModel data) => json.encode(data.toJson());

class AllPriceModel {
  AllPriceModel({
    this.price,
  });

  Price? price;

  factory AllPriceModel.fromJson(Map<String, dynamic> json) => AllPriceModel(
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "price": price?.toJson(),
      };
}

class Price {
  Price({
    this.id,
    this.postprice,
    this.applyprice,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? postprice;
  String? applyprice;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        id: json["id"],
        postprice: json["postprice"],
        applyprice: json["applyprice"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "postprice": postprice,
        "applyprice": applyprice,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
