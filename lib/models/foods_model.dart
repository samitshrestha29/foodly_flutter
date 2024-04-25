import 'dart:convert';

List<FoodsModel> foodsModelFromJson(String str) =>
    List<FoodsModel>.from(json.decode(str).map((x) => FoodsModel.fromJson(x)));

String foodsModelToJson(List<FoodsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FoodsModel {
  final String id;
  final String title;
  final List<String> foodTags;
  final List<String> foodType;
  final String code;
  final dynamic category;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;
  final String time;
  final List<dynamic> foodTag;
  final List<dynamic> additive;

  FoodsModel({
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
    required this.time,
    required this.foodTag,
    required this.additive,
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) => FoodsModel(
        id: json["_id"] ?? "",
        title: json["title"] ?? "",
        foodTags: (json["foodTags"] as List<dynamic>?)
                ?.map((tag) => tag.toString())
                .toList() ??
            [],
        foodType: (json["foodType"] as List<dynamic>?)
                ?.map((type) => type.toString())
                .toList() ??
            [],
        code: json["code"] ?? "",
        category: json["category"] ?? "",
        isAvailable: json["isAvailable"] ?? false,
        restaurant: json["restaurant"] ?? "",
        rating: json["rating"]?.toDouble() ?? 0.0,
        ratingCount: json["ratingCount"]?.toString() ?? "0",
        description: json["description"]?.toString() ?? "",
        price: json["price"]?.toDouble() ?? 0.0,
        additives: (json["additives"] as List<dynamic>?)
                ?.map((additive) => Additive.fromJson(additive))
                .toList() ??
            [],
        imageUrl: (json["imageUrl"] as List<dynamic>?)
                ?.map((url) => url.toString())
                .toList() ??
            [],
        time: json["time"]?.toString() ?? "",
        foodTag: (json["foodTag"] as List<dynamic>?)
                ?.map((tag) => tag.toString())
                .toList() ??
            [],
        additive: (json["additive"] as List<dynamic>?)
                ?.map((additive) => additive.toString())
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "foodTags": List<dynamic>.from(foodTags.map((x) => x)),
        "foodType": List<dynamic>.from(foodType.map((x) => x)),
        "code": code,
        "category": category,
        "isAvailable": isAvailable,
        "restaurant": restaurant,
        "rating": rating,
        "ratingCount": ratingCount,
        "description": description,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "imageUrl": List<dynamic>.from(imageUrl.map((x) => x)),
        "time": time,
        "foodTag": List<dynamic>.from(foodTag.map((x) => x)),
        "additive": List<dynamic>.from(additive.map((x) => x)),
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
