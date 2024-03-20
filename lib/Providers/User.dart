import 'package:flutter/material.dart';


class User extends ChangeNotifier{
  String email = "";
  String password = "";
  String name = "";
   void signup(String emailtxt, String passwordtxt, String nametxt){
     email = emailtxt;
     password = passwordtxt;
     name = nametxt;
     notifyListeners();
   }
}