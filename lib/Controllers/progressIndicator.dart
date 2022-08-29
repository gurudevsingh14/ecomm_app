import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressIndicatorController with ChangeNotifier{
  bool? loading=false;
  startLoading(){
    loading=true;
    notifyListeners();
  }
  stopLoading(){
    loading=false;
    notifyListeners();
  }
}