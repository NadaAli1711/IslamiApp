import 'package:flutter/cupertino.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void addMostRecentSura(int suraIndex) {
    if (mostRecentList.length >= 3) mostRecentList.removeLast();
    if (mostRecentList.contains(suraIndex)) mostRecentList.remove(suraIndex);
    mostRecentList.insert(0, suraIndex);
    notifyListeners();
  }
}
