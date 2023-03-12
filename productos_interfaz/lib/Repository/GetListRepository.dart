import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:productos_interfaz/Data/GetItemDelete.dart';

import '../Data/GetListItems.dart';

abstract class IUGetListrepository {
  void onGetItem(GetListItems getListItems);
  void onDeleteItem(GetItemDelete getItemDelete);
  // void onUpdateItem(GetListItems getListItems);
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

  void deleteItems() {
    Uri url = Uri.http("54.144.149.173:5000", "/deleteItem");

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        String body = response.body;
        Map<String, dynamic> map = json.decode(body);
        GetItemDelete getItemDelete = GetItemDelete.fromJson(map);
        iuGetListrepository.onDeleteItem(getItemDelete);
      } else if (response.statusCode == 400) {
        String body = response.body;
        var map = json.decode(body);
        String error = map["error"];
        iuGetListrepository.onError(error);
      }
    });
  }
}
