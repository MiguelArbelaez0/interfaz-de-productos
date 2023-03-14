import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Data/GetListItems.dart';

abstract class IUGetListrepository {
  void onGetItem(GetListItems getListItems);
  void onDeleteItem();
  //void onUpdateItem();
  void onError(String error);
}

class IGetListRepository {
  late IUGetListrepository iuGetListrepository;
  IGetListRepository(this.iuGetListrepository);

  void getlistItem() {
    Uri url = Uri.http("54.144.149.173:5000", "/getListItems");

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        String body = response.body;
        Map<String, dynamic> map = json.decode(body);
        GetListItems getlistitems = GetListItems.fromJson(map);
        iuGetListrepository.onGetItem(getlistitems);
      } else if (response.statusCode == 400) {
        String body = response.body;
        var map = json.decode(body);
        String error = map["error"];
        iuGetListrepository.onError(error);
      }
    });
  }

  void deleteItems(String id) {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    Uri url = Uri.http("54.144.149.173:5000", "/deleteItem");

    var map = {"id": id};

    final msg = jsonEncode(map);

    http.post(url, body: msg, headers: headers).then((response) {
      if (response.statusCode == 200) {
        iuGetListrepository.onDeleteItem();
      } else if (response.statusCode == 400) {
        String body = response.body;
        var map = json.decode(body);
        String error = map["error"];
        iuGetListrepository.onError(error);
      }
    });
  }
}
