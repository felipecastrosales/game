import 'package:flutter/material.dart';
import 'package:game/app/core/text/app_text_styles.dart';
import 'package:game/app/widgets/custom_divider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details Page',
          style: AppTextStyles.appBar,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 500,
            child: Placeholder(),
          ),
          const SizedBox(height: 16),
          const CustomDivider(2),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Text(
                  'Title',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.gameTitle,
                ),
                const SizedBox(height: 8),
                Text(
                  'Category',
                  style: AppTextStyles.gameDetails,
                ),
                const SizedBox(height: 16),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: AppTextStyles.gameDetails,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
