import 'dart:convert';

FoodsModel foodsModelFromJson(String str) =>
    FoodsModel.fromJson(json.decode(str));

String foodsModelToJson(FoodsModel data) => json.encode(data.toJson());

class FoodsModel {
  final List<dynamic> foodTag;
  final List<dynamic> additive;
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final List<String> category;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;
  final int v;

  FoodsModel({
    required this.foodTag,
    required this.additive,
    required this.id,
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.code,
    required this.category,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.price,
    required this.additives,
    required this.imageUrl,
    required this.v,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        foodTag: List<dynamic>.from(json["foodTag"].map((x) => x)),
        additive: List<dynamic>.from(json["additive"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        foodTags: List<String>.from(json["foodTags"].map((x) => x)),
        foodType: List<String>.from(json["foodType"].map((x) => x)),
        code: json["code"],
        category: List<String>.from(json["category"].map((x) => x)),
        isAvailable: json["isAvailable"],
        restaurant: json["restaurant"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        description: json["description"],
        price: json["price"]?.toDouble(),
        additives: List<Additive>.from(
            json["additives"].map((x) => Additive.fromJson(x))),
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "foodTag": List<dynamic>.from(foodTag.map((x) => x)),
        "additive": List<dynamic>.from(additive.map((x) => x)),
        "_id": id,
        "title": title,
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "code": code,
        "category": List<dynamic>.from(category.map((x) => x)),
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "__v": v,
      };
}

class Additive {
  final int additiveId;
  final String title;
  final String price;
  final String id;

  Additive({
    required this.additiveId,
    required this.title,
    required this.price,
    required this.id,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        additiveId: json["id"],
        title: json["title"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": additiveId,
        "title": title,
        "price": price,
        "_id": id,
      };
}
