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
          CarouselBienvenue(),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: FilledButton(
              onPressed: () {},
              child: Text("Connexion", textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: FilledButton(
              onPressed: () {},
              child: Text("Aide", textAlign: TextAlign.center),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 32,
            child: FilledButton(
              onPressed: () {},
              child: Text("Créer un compte", textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }
}
