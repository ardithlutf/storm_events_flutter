import 'package:flutter/material.dart';
import 'package:stormeventslima/screens/category/category.dart';

import 'package:stormeventslima/screens/dashboard/dashboard.dart';
import 'package:stormeventslima/screens/fitur_details/fitur_details.dart';
import 'package:stormeventslima/widgets/events/builder/builder_example.dart';
import 'package:stormeventslima/widgets/events/index.dart';
import 'constants.dart';
import 'data/models/design_pattern_category.dart';
import 'data/models/fitur.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
      case categoryRoute:
        var category = settings.arguments as DesignPatternCategory;
        return MaterialPageRoute(
          builder: (_) => Category(
            category: category,
          ),
        );

//       Creational
      case FiturRoutes.historyRoute:
        return _buildFiturDetailsPageRoute(
          settings,
          BuilderExample(),
        );

      // Structural
      case FiturRoutes.cityRoute:
        return _buildFiturDetailsPageRoute(
          settings,
          ProxyExample(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
    }
  }

  static MaterialPageRoute _buildFiturDetailsPageRoute(
    RouteSettings settings,
    Widget example,
  ) {
    var designPattern = settings.arguments as Fitur;
    return MaterialPageRoute(
      builder: (_) => FiturDetails(
        designPattern: designPattern,
        example: example,
      ),
    );
  }
}

class FiturRoutes {
  static const String historyRoute = '/history';
  static const String cityRoute = '/city';
}
