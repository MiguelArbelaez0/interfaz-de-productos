import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Data/currency_data.dart';

abstract class IListRepository {
  void onCompleteGetListCurrency(ListCurrency listCurrency);
  void onShowError(String error);
}

class ListRepository {
  IListRepository iListRepository;
  ListRepository(this.iListRepository);

  void getListCurrency() {
    Uri url = Uri.http("44.215.48.103:5000", "/getListCurrency");

    http.get(url).then((response) {
      if (response.statusCode == 200) {
        String body = response.body;
        Map<String, dynamic> map = json.decode(body);
        ListCurrency listCurrency = ListCurrency.fromJson(map);
        iListRepository.onCompleteGetListCurrency(listCurrency);
      } else if (response.statusCode == 400) {
        String body = response.body;

        var map = json.decode(body);
        String error = map["error"];

        iListRepository.onShowError(error);
      }
    });
  }
}
