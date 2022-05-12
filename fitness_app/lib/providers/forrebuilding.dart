import 'package:fitness_app/data/exerciseItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rebuildd with ChangeNotifier {
  void notifyForRebuild() {
    notifyListeners();
  }

  void nothing() {}
}
