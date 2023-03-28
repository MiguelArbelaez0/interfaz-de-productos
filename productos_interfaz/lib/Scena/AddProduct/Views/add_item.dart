import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Data/currency_data.dart';
import '../../../Data/item_data.dart';
import '../../../Widgets/select_image.dart';
import '../ViewModel/itemViewModel.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen>
    implements IItemViewModel {
  late ItemViewModel itemViewModel;

  bool isFirstCall = false;

  List<XFile>? _imageFileList;
  dynamic _pickImageError;
  void _setImageFileListFromFile(XFile? value) {
    _imageFileList = value == null ? null : <XFile>[value];
  }

  XFile? filename;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  String? idCurrency;

  ListCurrency? listCurrency;

  validarCampos() {
    if (name.text.isEmpty ||
        description.text.isEmpty ||
        price.text.isEmpty ||
        selectedValue == null ||
        filename == null) {
      return false;
    } else {
      return true;
    }
  }

  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final description = TextEditingController();
  // final idCurrencyC = TextEditingController();
  final price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    itemViewModel = ItemViewModel(this);
    itemViewModel.getListText();

    if (!isFirstCall) {}
    Widget sendImage = Image(
      image: AssetImage('assets/vector.png'),
    );
    if (filename == null) {
      sendImage = Image(
        image: AssetImage('assets/vector.png'),
      );
    } else {
      sendImage = Image.file(File(filename!.path));
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/onboarding_background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 47,
              ),
              Center(
                child: Text(
                  "Crear Item",
                  style: TextStyle(
                      fontFamily: 'Inter-Bold.ttf',
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.only(left: 17, right: 17),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          hintText: "Nombre*",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nombre',
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      TextFormField(
                        controller: description,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          hintText: "Descripcion*",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.description_outlined),
                          labelText: 'Descripcion',
                        ),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      Container(
                        width: 340,
                        margin: EdgeInsets.only(left: 17, right: 17),
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                          hint: Text(
                            'Select Item',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                              idCurrency = (listCurrency?.data ?? [])
                                  .firstWhere((moneda) {
                                return "${moneda.moneda} ${moneda.currency}" ==
                                    selectedValue;
                              }).id;
                            });
                          },
                        )),
                      ),
                      SizedBox(
                        height: 19,
                      ),
                      TextFormField(
                        controller: price,
                        autofocus: true,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          hintText: "Precio*",
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(Icons.price_change_outlined),
                          labelText: 'Precio',
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 131.67,
                        height: 128.33,
                        child: GestureDetector(
                          onTap: () {
                            SelectImage selectImage;
                            selectImage = SelectImage();
                            selectImage.showImageDialog(context, (xFile) {
                              setState(() {
                                filename = xFile;
                              });
                            });
                          },
                          child: Container(
                            child: sendImage,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 54,
                      ),
                      SizedBox(
                        width: 339,
                        height: 59,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ElevatedButton(
                            onPressed: () {
                              if (!validarCampos()) {
                                Fluttertoast.showToast(
                                    msg: "Por favor llenar todos los campos",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                return;
                              }
                              File file = File(filename?.path ?? "");

                              ItemData itemData = ItemData(
                                name: name.text,
                                description: description.text,
                                idCurrency: idCurrency ?? "",
                                price: double.parse(price.text),
                                imageFile: file,
                                urlImage: "",
                              );

                              itemViewModel.createItem(file, itemData);
                            },
                            child: Text(
                              'Crear Item',
                              style: TextStyle(
                                fontFamily: 'Poppins ',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 339,
                        height: 59,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "home");
                            },
                            child: Text(
                              'Lista Producto',
                              style: TextStyle(
                                fontFamily: 'Poppins ',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void onCreateItem(ItemData itemData) {
    Navigator.pushNamed(context, "home");
    Fluttertoast.showToast(
        msg: "producto creado",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void onError(String error) {
    Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void onCompleteGetListCurrency(ListCurrency listCurrency) {
    this.listCurrency = listCurrency;
    List<String> listText = [];
    listCurrency.data?.forEach((moneda) {
      String item = "${moneda.moneda} ${moneda.currency}";
      listText.add(item);
    });

    setState(() {
      items = listText;
    });
  }
}
