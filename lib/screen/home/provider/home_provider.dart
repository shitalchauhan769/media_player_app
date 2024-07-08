import 'package:flutter/material.dart';


import '../model/model_data.dart';
class HomeProvider with ChangeNotifier
{
  int isIndex=0;


  void chageImage(int index)
  {
    isIndex=index;
    notifyListeners();
  }



}