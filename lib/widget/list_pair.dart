import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study1/state/app.dart';

class ListPair extends StatelessWidget {
  const ListPair({
    super.key,
    required this.list,
  });

  final List<WordPair> list;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(
      children: [
        for (var l in list)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                appState.favorites.contains(l)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              SizedBox(width: 8), // Thêm khoảng cách giữa Icon và Text
              Text(l.toString()),
            ],
          ),
      ],
    );
  }
}
