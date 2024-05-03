import 'package:flutter/material.dart';
import 'package:test_tic/Core/Routes/routes.dart';
import 'package:test_tic/Feauters/Add_client/view/add_clinet.dart';
import 'package:test_tic/Feauters/home/view/home_View.dart';

class AppRouting {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case Routes.addClient:
        return MaterialPageRoute(
          builder: (context) => const AddClient(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Text("No Route defined for ${routeSettings.name}"),
            );
          },
        );
    }
  }
}
