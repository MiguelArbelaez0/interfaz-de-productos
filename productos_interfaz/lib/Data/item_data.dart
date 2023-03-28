import 'dart:io';

class ItemData {
  late String name;
  late String description;
  late String idCurrency;
  late double price;
  late File imageFile;
  late String urlImage;

  ItemData({
    required this.name,
    required this.description,
    required this.idCurrency,
    required this.price,
    required this.imageFile,
    required this.urlImage,
  });

  ItemData.fromJson(Map<String, dynamic> json) {
    name = json["name"] ?? "";
    description = json["description"] ?? "";
    idCurrency = json["idCurrency"] ?? "";
    price = json["price"] ?? 0;
    urlImage = json["urlImage"] ?? "";
  }
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "idCurrency": idCurrency,
      "price": price,
      "urlImage": urlImage,
    };
  }
}
