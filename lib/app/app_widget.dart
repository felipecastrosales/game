import 'package:flutter/material.dart';

import 'core/theme/app_themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game App',
      theme: AppThemes.light,
      home: Container(),
    );
  }
}
