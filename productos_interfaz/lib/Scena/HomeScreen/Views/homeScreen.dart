import 'package:flutter/material.dart';
import 'package:productos_interfaz/Data/GetItem.dart';
import 'package:productos_interfaz/Widgets/confirm_delete.dart';

import '../../../Data/GetListItems.dart';
import '../../../widgets/item_selection.dart';
import '../../../widgets/listItems.dart';
import '../ViewModel/homeViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements IIGetListViewModel {
  late IGetViewModel iGetViewModel;

  GetListItems? getListItems;

  int indexSelection = 0;

  var isFirstCall = false;

  @override
  Widget build(BuildContext context) {
    iGetViewModel = IGetViewModel(this);

    if (!isFirstCall) {
      iGetViewModel.getListItem();

      isFirstCall = true;
    }
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 140,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 16),
            child: Text(
              'Lista de items',
              style: TextStyle(
                fontFamily: 'Poppins ',
                fontStyle: FontStyle.normal,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 23,
          ),
          ItemSelection(
            indexSelection: indexSelection,
            height: 56,
            width: 62,
            onSelectIndex: (indexSeletion) {
              this.indexSelection = indexSeletion;
            },
          ),
          //  SizedBox(
          //     height: 23,
          //   ),
          (getListItems != null)
              ? ListItemsWidget(
                  getListItems: getListItems!,
                  onDelete: (String id) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirmar eliminación'),
                            content: Text(
                                '¿Está seguro que desea eliminar este producto?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  iGetViewModel.getItemDelete(id);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Eliminar'),
                              ),
                            ],
                          );
                        });
                    // iGetViewModel.getItemDelete(id);
                  },
                )
              : Container(
                  color: Colors.red,
                ),
        ],
      ),
    );
  }

  @override
  void onGetItem(GetListItems getListItems) {
    // TODO: implement onGetItem

    setState(() {
      this.getListItems = getListItems;
    });
  }

  @override
  void onError(String error) {
    // TODO: implement onError
  }

  @override
  void onDeleteItem() {
    // TODO: implement onDeleteItem

    iGetViewModel.getListItem();
  }
}
