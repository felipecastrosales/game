import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'core/theme/app_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      theme: AppThemes.light,
      routes: AppRoutes.getRoutes(),
      home: Container(),
    );
  }
}
