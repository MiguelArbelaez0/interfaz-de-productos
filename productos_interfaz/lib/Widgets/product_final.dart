import 'package:flutter/material.dart';
import 'package:productos_interfaz/Scena/UpdateItem/Wiews/update_item_screen.dart';

import '../Data/GetListItems.dart';
import 'favorite_icon.dart';
import 'package:image_network/image_network.dart';

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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 106),
                            child: FavoriteIcon(
                              iconData: Icons.favorite,
                              defaultColor: Colors.grey,
                              pressedColor: Colors.red,
                              isFavorited: true,
                            ),
                          ),
                        ],
                      ),
                      ClipOval(
                        child: ImageNetwork(
                          image: widget.datum.urlImage,
                          height: 80,
                          width: 80,
                        ),
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
                                  child: Icon(Icons.delete),
                                ),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 3),
                                width: 19,
                                height: 19,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/update",
                                        arguments: widget.datum);
                                  },
                                  child: Icon(Icons.edit),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
