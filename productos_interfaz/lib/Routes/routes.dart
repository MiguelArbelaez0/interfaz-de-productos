import 'package:flutter/material.dart';
import 'package:productos_interfaz/Scena/UpdateItem/Wiews/update_item_screen.dart';

import '../Scena/AddProduct/Views/add_item.dart';
import '../Scena/HomeScreen/Views/homeScreen.dart';

class RoutesApp {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => AddItemScreen());
      case "/add":
        return MaterialPageRoute(builder: (_) => AddItemScreen());
      case "home":
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case "update":
        return MaterialPageRoute(builder: (_) => UpdateItemScreen());
    }

    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
