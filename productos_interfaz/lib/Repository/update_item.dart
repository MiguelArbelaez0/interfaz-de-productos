import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productos_interfaz/Data/item_data.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

abstract class IUUpdateItemrepository {
  void onUpdateItem(ItemData itemData);
  void onError(String error);
  void onCompleteLoadImage(XFile fileName);
  
}

class IUpdateRepository {
  late IUUpdateItemrepository iuUpdateItemrepository;
  IUpdateRepository(this.iuUpdateItemrepository);

  void getImageFile(String urlImage) {
    Uri url = Uri.parse(urlImage);

    http.get(url).then((response) {
      if(response.statusCode == 200) {
        getTemporaryDirectory().then((directory) {
          final path = '${directory.path}/filename.png';
          File(path).writeAsBytesSync(response.bodyBytes);
          XFile xFile = XFile(path);
          iuUpdateItemrepository.onCompleteLoadImage(xFile);

        });
      } else {
        iuUpdateItemrepository.onError("no fue posible guardar la imagen");
      }
    }).catchError((er){
      iuUpdateItemrepository.onError(er.toString());
    });
  }
  void updateItem(
    File imageFile,
    ItemData itemData,
  ) {
    Uri url = Uri.http("44.215.48.103:5000", "/updateItem");
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
          iuUpdateItemrepository.onUpdateItem(itemData);
        } else if (response.statusCode == 400) {
          response.stream.bytesToString().then((body) {
            var map = json.decode(body);
            String error = map["error"];
            iuUpdateItemrepository.onError(error);
            print('Image upload failed with status ${response.statusCode}');
          });
        }
      });
    });
  }
}
