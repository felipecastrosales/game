import 'package:flutter/material.dart';
import 'package:game/app/core/colors/app_colors.dart';
import 'package:game/app/core/text/app_text_styles.dart';
import 'package:game/app/widgets/custom_divider.dart';

import 'components/category_tile.dart';
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
        children: [
          const Headers(
            title: 'Categorias',
            icon: Icons.category,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.only(left: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return CategoryTile(
                  name: 'Game $index',
                  isSelected: true,
                  onTap: () {},
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: CustomDivider(2),
          ),
          const Headers(
            title: 'Jogos',
            icon: Icons.videogame_asset,
          ),
        ],
      ),
    );
  }
}
