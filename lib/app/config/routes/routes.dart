import 'package:flutter/cupertino.dart';
import 'package:game/app/config/pages/pages.dart';
import 'package:game/app/pages/details/details_page.dart';
import 'package:game/app/pages/home/home_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Pages.home: (context) => const HomePage(),
      Pages.details: (context) => const DetailsPage(),
    };
  }
}
