import 'package:flutter/material.dart';
import 'package:productos_interfaz/Widgets/product_final.dart';

import '../Data/GetListItems.dart';

class ListItemsWidget extends StatefulWidget {
  GetListItems getListItems;
  Function(String) onDelete;
  ListItemsWidget(
      {super.key, required this.getListItems, required this.onDelete});

  @override
  State<StatefulWidget> createState() => _ListItemsWidget();
}

class _ListItemsWidget extends State<ListItemsWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 350,
        child: /*ListView(
        children: getListItems(widget.getListItems.data),
      ),*/
            ListView.builder(
                itemCount: getListPar(widget.getListItems.data).length,
                itemBuilder: (BuildContext context, int index) {
                  if ((index) >=
                          getListPar(widget.getListItems.data).length - 1 &&
                      widget.getListItems.data.length % 2 != 0) {
                    return ProductFinal(
                      datum: getListPar(widget.getListItems.data)[index],
                      onDelete: (String id) {
                        widget.onDelete(id);
                      },
                    );
                  }
                  return getColumns(
                      getListPar(widget.getListItems.data)[index],
                      getListImpar(widget.getListItems.data)[index],
                      widget.onDelete);
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
    return Container(
      height: 181,
      child: Row(
        children: [
          ProductFinal(
            datum: datum0,
            onDelete: (String id) {
              onDelete(id);
            },
          ),
          SizedBox(
            width: 14,
          ),
          ProductFinal(
            datum: datum1,
            onDelete: (String id) {
              onDelete(id);
            },
          ),
        ],
      ),
    );
  }
}
