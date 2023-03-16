import 'package:flutter/material.dart';

import 'package:productos_interfaz/Widgets/product_final.dart';

import '../Data/GetListItems.dart';

class ListItemsWidget extends StatefulWidget {
  GetListItems getListItems;
  int indexSelection;
  Function(String) onDelete;

  ListItemsWidget(
      {super.key,
      required this.getListItems,
      required this.onDelete,
      required this.indexSelection});

  @override
  State<StatefulWidget> createState() => _ListItemsWidget();
}

class _ListItemsWidget extends State<ListItemsWidget> {
  late List<Datum> selectionItems;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.indexSelection == 0) {
      selectionItems = widget.getListItems.data;
    } else if (widget.indexSelection == 1) {
      selectionItems = widget.getListItems.dataDelete;
    }
    return Container(
        // height: MediaQuery.of(context).size.height,
        height: 300,
        // width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: getListPar(selectionItems).length,
            itemBuilder: (BuildContext context, int index) {
              if ((index) >= getListPar(selectionItems).length - 1 &&
                  selectionItems.length % 2 != 0) {
                return ProductFinal(
                  datum: getListPar(selectionItems)[index],
                  onDelete: (String id) {
                    widget.onDelete(id);
                  },
                );
              }
              return getColumns(getListPar(selectionItems)[index],
                  getListImpar(selectionItems)[index], widget.onDelete);
            }));
  }

  List<Datum> getListPar(List<Datum> listDatum) {
    var index = 0;
    List<Datum> list = [];
    listDatum.forEach((element) {
      if ((index % 2) == 0) {
        list.add(element);
      }
      index++;
    });
    return list;
  }

  List<Datum> getListImpar(List<Datum> listDatum) {
    var index = 0;
    List<Datum> list = [];
    listDatum.forEach((element) {
      if ((index % 2) != 0) {
        list.add(element);
      }
      index++;
    });
    return list;
  }

  List<Widget> getListItems(List<Datum> listDatum, Function(String) onDelete) {
    List<Widget> listColums = [];
    for (int i = 0; i < listDatum.length; i += 2) {
      if ((i + 1) > listDatum.length - 1) {
        var widget = ProductFinal(
          datum: listDatum[i],
          onDelete: (String id) {
            onDelete(id);
          },
        );

        listColums.add(widget);
      } else {
        var widget = Container(
            child: Column(
          children: [
            getColumns(listDatum[i], listDatum[i + 1], onDelete),
            SizedBox(
              height: 15,
            )
          ],
        ));
        listColums.add(widget);
      }
    }

    return listColums;
  }

  Widget getColumns(Datum datum0, Datum datum1, Function(String) onDelete) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 27),
          child: ProductFinal(
            datum: datum0,
            onDelete: (String id) {
              onDelete(id);
            },
          ),
        ),
        SizedBox(
          width: 14,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 27),
          child: ProductFinal(
            datum: datum1,
            onDelete: (String id) {
              onDelete(id);
            },
          ),
        ),
      ],
    );
  }
}
