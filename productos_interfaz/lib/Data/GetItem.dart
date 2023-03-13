import 'dart:convert';

GetItem getItemFromJson(String str) => GetItem.fromJson(json.decode(str));

String getItemToJson(GetItem data) => json.encode(data.toJson());

class GetItem {
  GetItem({
    required this.data,
    required this.dataDelete,
  });

  List<Data2> data;
  List<Data2> dataDelete;

  factory GetItem.fromJson(Map<String, dynamic> json) => GetItem(
        data: List<Data2>.from(json["data"].map((x) => Data2.fromJson(x))),
        dataDelete:
            List<Data2>.from(json["dataDelete"].map((x) => Data2.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "dataDelete": List<dynamic>.from(dataDelete.map((x) => x.toJson())),
      };
}

class Data2 {
  Data2({
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
  int price;
  String urlImage;

  factory Data2.fromJson(Map<String, dynamic> json) => Data2(
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
