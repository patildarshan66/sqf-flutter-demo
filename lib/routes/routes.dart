import 'package:flutter/material.dart';
import 'package:sqlf_demo/model/address.dart';
import 'package:sqlf_demo/view/screens/add_address_screen.dart';
import '../view/screens/bottom_navigation.dart';
import 'route_strings.dart';

class AppRoutes {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePath.addAddressRoute:
        return MaterialPageRoute(
            builder: (_) => const AddAddressScreen()
        );
      case RoutePath.editAddressRoute:
        return MaterialPageRoute(
            builder: (_) => AddAddressScreen(data: routeSettings.arguments as Address, isUpdate: true)
        );
      case RoutePath.initialRoute:
      default:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationScreen()
        );
    }
  }
}
