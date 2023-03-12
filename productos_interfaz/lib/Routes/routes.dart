import 'package:flutter/material.dart';

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
    }

    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
