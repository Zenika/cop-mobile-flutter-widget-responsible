import 'package:flutter/material.dart';

import 'carousel_bienvenue.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: CarouselBienvenue()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FilledButton(
                    onPressed: () {},
                    child: Text("Connexion", textAlign: TextAlign.center),
                    style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(48))),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: FilledButton(
                      onPressed: () {},
                      child: Text("Aide", textAlign: TextAlign.center),
                      style: FilledButton.styleFrom(
                          minimumSize: Size.fromHeight(48))),
                ),
                FilledButton(
                    onPressed: () {},
                    child: Text("Crer un compte", textAlign: TextAlign.center),
                    style: FilledButton.styleFrom(
                        minimumSize: Size.fromHeight(48))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
