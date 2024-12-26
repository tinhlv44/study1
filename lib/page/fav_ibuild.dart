import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study1/state/app.dart';
import 'package:study1/widget/big_card.dart';

class Fav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pairs = appState.favorites;

    return Expanded(
      child: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var pair in pairs)
            BigCard(
              pair: pair,
              icon: true,
            ),
        ],
      ),
    );
  }
}
