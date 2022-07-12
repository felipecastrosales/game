import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String text;

  const CategoryItem(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(text),
      ),
    );
  }
}
