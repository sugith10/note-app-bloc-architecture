import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_note/presentation/screen/home_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () { 
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const HomeScreen()), (route) => false);
    });
    return Scaffold(
      body: Center(
        child: Image.asset('asset/img/vector-illustration-old-man-writing.png', width: double.infinity,),
      ),
    );
  }
}