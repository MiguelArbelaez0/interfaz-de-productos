import 'package:flutter/material.dart';
import 'package:productos_interfaz/Data/GetListItems.dart';
import 'package:productos_interfaz/Scena/UpdateItem/Wiews/update_item_screen.dart';

import '../Scena/AddProduct/Views/add_item.dart';
import '../Scena/HomeScreen/Views/homeScreen.dart';

class RoutesApp {
  static Datum? datum;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (args is Datum) {
      datum = args;
    }
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => AddItemScreen());
      case "/add":
        return MaterialPageRoute(builder: (_) => AddItemScreen());
      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "/update":
        return MaterialPageRoute(
          builder: (_) => UpdateItemScreen(
            datum: datum ??
                Datum(
                    currency: "",
                    description: "",
                    id: "",
                    name: "",
                    price: 0,
                    urlImage: ""),
          ),
        );
    }

    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
