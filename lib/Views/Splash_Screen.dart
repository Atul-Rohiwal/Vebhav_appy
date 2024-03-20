import 'package:flutter/material.dart';
import 'package:untitled2/Views/Login.dart';
import 'package:get/get.dart';


import 'dart:async';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
     setTimer();
  }

  void setTimer() {
    // Set a timer for 3 seconds
    Timer(Duration(seconds: 3), () {
      Get.to(()=> Login());
    });
  } @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: Align(alignment: Alignment.topLeft,
              child: Image.asset("Assets/Images/app_logo.jpeg")
          ),
        ),
      ),
    );
  }
}
