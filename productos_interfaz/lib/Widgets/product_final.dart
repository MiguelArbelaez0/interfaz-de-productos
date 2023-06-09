import 'package:flutter/material.dart';
import 'package:productos_interfaz/Scena/UpdateItem/Wiews/update_item_screen.dart';

import '../Data/GetListItems.dart';
import 'favorite_icon.dart';

class ProductFinal extends StatefulWidget {
  Datum datum;
  Function(String) onDelete;
  ProductFinal({super.key, required this.datum, required this.onDelete});

  @override
  State<ProductFinal> createState() => _ProductFinalState();
}

class _ProductFinalState extends State<ProductFinal> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 19),
              width: 159,
              height: 181,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(left: 106),
                      //   child: FavoriteIcon(
                      //     iconData: Icons.favorite,
                      //     defaultColor: Colors.grey,
                      //     pressedColor: Colors.red,
                      //     isFavorited: true,
                      //   ),
                      // ),
                    ],
                  ),
                  ClipOval(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(widget.datum.urlImage),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: 13,
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          widget.datum.name,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 13),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "${widget.datum.currency}${widget.datum.price.toString()}",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 19,
                            height: 19,
                            child: GestureDetector(
                              onTap: () {
                                widget.onDelete(widget.datum.id);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 6,
                                ),
                                child: Icon(Icons.delete),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            width: 19,
                            height: 19,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/update",
                                    arguments: widget.datum);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 6,
                                ),
                                child: Icon(Icons.edit),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
