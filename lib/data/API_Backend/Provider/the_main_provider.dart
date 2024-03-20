import 'package:flutter/cupertino.dart';

class MainHomePageProvider extends ChangeNotifier{
  int selectedIndex  = 2 ;

  void changeSelectedIndex (int index)
  {
    selectedIndex = index ;
    notifyListeners();
  }

}
