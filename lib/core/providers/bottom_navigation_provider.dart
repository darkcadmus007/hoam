import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///Providers for mainscreen bottom navigation sheet, so we can change the index anywhere
class BottomNavigationProvider extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  static BottomNavigationProvider watch(BuildContext context) => context.watch();
  static BottomNavigationProvider read(BuildContext context) => context.read();
}
