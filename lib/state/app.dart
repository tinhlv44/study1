import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var listPair = <WordPair>[];
  void getNext() {
    current = WordPair.random();
    listPair.add(current);
    notifyListeners();
  }

  // ↓ Add the code below.
  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeFavorite(int index) {
    favorites.removeAt(index);
    notifyListeners();
  }

  void removeFavoriteString(WordPair fav) {
    favorites.remove(fav);
    notifyListeners();
  }
}
