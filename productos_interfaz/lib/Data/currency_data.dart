class ListCurrency {
  List<Data>? data;

  ListCurrency({this.data});

  ListCurrency.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? code;
  String? currency;
  String? id;
  String? moneda;

  Data({this.code, this.currency, this.id, this.moneda});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    currency = json['currency'];
    id = json['id'];
    moneda = json['moneda'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['currency'] = this.currency;
    data['id'] = this.id;
    data['moneda'] = this.moneda;
    return data;
  }
}
