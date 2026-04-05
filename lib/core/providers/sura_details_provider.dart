import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  String suraContent = '';
  List<String> suraVerses = [];
  bool isSwitched = false;

  void toggleSwitch(bool value) {
    isSwitched = value;
    notifyListeners();
  }

  Future<void> loadFileData(int index) async {
    String content = await rootBundle.loadString(
      'assets/suras/${index + 1}.txt',
    );
    List<String> verses = content.trim().split('\n');
    suraVerses = verses;
    for (int i = 0; i < suraVerses.length; i++) {
      suraContent += '[${i + 1}] ${suraVerses[i]}';
    }

    notifyListeners();
  }
}
