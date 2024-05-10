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
  final List<String> category;
  final bool isAvailable;
  final String restaurant;
  final double rating;
  final String ratingCount;
  final String description;
  final double price;
  final List<Additive> additives;
  final List<String> imageUrl;
  final String time;

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
  });

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      foodTags: List<String>.from(json['foodTags'] ?? []),
      foodType: List<String>.from(json['foodType'] ?? []),
      code: json['code'] ?? '',
      category: List<String>.from(json['category'] ?? []),
      isAvailable: json['isAvailable'] ?? false,
      restaurant: json['restaurant'] ?? '',
      rating: json['rating']?.toDouble() ?? 0.0,
      ratingCount: json['ratingCount']?.toString() ?? '0',
      description: json['description'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      additives: List<Additive>.from(
          (json['additives'] ?? []).map((x) => Additive.fromJson(x))),
      imageUrl: List<String>.from(json['imageUrl'] ?? []),
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'foodTags': foodTags,
      'foodType': foodType,
      'code': code,
      'category': category,
      'isAvailable': isAvailable,
      'restaurant': restaurant,
      'rating': rating,
      'ratingCount': ratingCount,
      'description': description,
      'price': price,
      'additives': additives.map((x) => x.toJson()).toList(),
      'imageUrl': imageUrl,
      'time': time,
    };
  }
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
        additiveId: json["id"] ?? 0,
        title: json["title"] ?? '',
        price: json["price"] ?? '',
        id: json["_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": additiveId,
        "title": title,
        "price": price,
        "_id": id,
      };
}
