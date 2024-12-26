import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study1/state/app.dart';

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
    required this.icon,
  });

  final WordPair pair;
  final bool icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    var app = context.watch<MyAppState>();
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          // ↓ Make the following change.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Canh trái
            children: [
              Text(
                pair.asLowerCase,
                style: style,
                semanticsLabel: "${pair.first} ${pair.second}",
              ),
              icon
                  ? IconButton(
                      onPressed: () {
                        app.removeFavoriteString(pair);
                      },
                      icon: Icon(Icons.delete),
                    )
                  : Container(),
            ],
          )),
    );
  }

// ...
}
