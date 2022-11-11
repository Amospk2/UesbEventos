import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier{
  int indexBottomNavigationBar = 0;
  final pageController = PageController();

  changeIndex(page)
  {
    indexBottomNavigationBar = page;
    notifyListeners();
  }
}
