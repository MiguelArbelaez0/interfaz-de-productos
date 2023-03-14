import 'dart:convert';

GetListItems getListItemsFromJson(String str) =>
    GetListItems.fromJson(json.decode(str));

String getListItemsToJson(GetListItems data) => json.encode(data.toJson());

class GetListItems {
  GetListItems({
    required this.data,
  });

  List<Datum> data;

  factory GetListItems.fromJson(Map<String, dynamic> json) => GetListItems(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.currency,
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.urlImage,
  });

  String currency;
  String description;
  String id;
  String name;
  double price;
  String urlImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        currency: json["currency"],
        description: json["description"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        urlImage: json["urlImage"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "description": description,
        "id": id,
        "name": name,
        "price": price,
        "urlImage": urlImage,
      };
}
