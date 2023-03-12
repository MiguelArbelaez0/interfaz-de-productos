import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImage {
  final ImagePicker _picker = ImagePicker();
  Future ImageCamare(Function onSelectImage) async {
    try {
      final XFile? xFile = await _picker.pickImage(source: ImageSource.camera);
      onSelectImage(xFile);
    } catch (e) {}
  }

  Future ImageGallery() async {
    try {
      final XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {}
  }

  void showImageDialog(BuildContext context, Function onSelectImage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(""),
          content: Text(""),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ImageCamare((xFile) {
                  onSelectImage(xFile);
                });
              },
              child: Text('Camara'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
            ),
            SizedBox(
              width: 100,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ImageGallery();
              },
              child: Text('Galeria'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
            )
          ],
        );
      },
    );
  }
}
