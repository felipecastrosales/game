import 'package:flutter/material.dart';
import 'package:game/app/core/text/text.dart';
import 'package:game/app/utils/constants.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                    Constants.loremIpsum,
                    style: AppTextStyles.gameDetails,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
