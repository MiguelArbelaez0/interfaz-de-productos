import 'dart:convert';

GetItemDelete getItemDeleteFromJson(String str) =>
    GetItemDelete.fromJson(json.decode(str));

String getItemDeleteToJson(GetItemDelete data) => json.encode(data.toJson());

class GetItemDelete {
  GetItemDelete({
    required this.id,
  });

  String id;

  factory GetItemDelete.fromJson(Map<String, dynamic> json) => GetItemDelete(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
