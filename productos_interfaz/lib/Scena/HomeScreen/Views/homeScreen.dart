import 'package:flutter/material.dart';

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
    iGetViewModel.getListItem();
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
              ? ListItemsWidget(getListItems!)
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
}
