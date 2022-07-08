import 'package:flutter/material.dart';
import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';

import 'components/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
          style: AppTextStyles.appBar,
        ),
      ),
      body: Column(
        children: const [
          Headers(
            title: 'Categorias',
            icon: Icons.category,
          ),
          Headers(
            title: 'Jogos',
            icon: Icons.videogame_asset,
          ),
        ],
      ),
    );
  }
}
