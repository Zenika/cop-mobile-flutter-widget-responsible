import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final IconData icon;

  final String title;

  const Item(
    this.icon,
    this.title, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final backgroundHeight = height * 0.4;
    return Column(
      children: [
        SizedBox(
          height: backgroundHeight,
          child: Center(
              child: Icon(
            icon,
            size: 100,
          )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        )
      ],
    );
  }
}
