import 'dart:convert';

import 'dart:io';

import 'package:http/http.dart' as http;

import '../Data/item_data.dart';

abstract class IUitemRepository {
  void onCreateItem(ItemData itemData);
  void onError(String error);
}

class ITemRepository {
  late IUitemRepository iUitemRepository;
  ITemRepository(this.iUitemRepository);

  void createItem(
    File imageFile,
    ItemData itemData,
  ) {
    Uri url = Uri.http("54.144.149.173:5000", "/addItem");
    final request = http.MultipartRequest('POST', url);

    final fileStream = http.ByteStream(Stream.castFrom(imageFile.openRead()));
    imageFile.length().then((fileLength) {
      final multipartFile = http.MultipartFile(
        'file',
        fileStream,
        fileLength,
        filename: itemData.name,
      );
      request.files.add(multipartFile);
      request.fields['name'] = itemData.name;
      request.fields['description'] = itemData.description;
      request.fields['idCurrency'] = itemData.idCurrency;
      request.fields['price'] = "${itemData.price}";
      request.send().then((response) {
        if (response.statusCode == 201) {
          iUitemRepository.onCreateItem(itemData);
        } else if (response.statusCode == 400) {
          response.stream.bytesToString().then((body) {
            var map = json.decode(body);
            String error = map["error"];
            iUitemRepository.onError(error);
            print('Image upload failed with status ${response.statusCode}');
          });
        }
      });
    });
  }
}
