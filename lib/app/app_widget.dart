import 'package:flutter/material.dart';

import 'config/pages/pages.dart';
import 'config/routes/routes.dart';
import 'core/theme/app_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      theme: AppThemes.light,
      initialRoute: Pages.home,
      routes: Routes.getRoutes(),
    );
  }
}
