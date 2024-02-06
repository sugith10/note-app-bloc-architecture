import 'package:flutter/material.dart';
import 'package:new_note/presentation/screen/home_screen.dart';
import 'package:new_note/presentation/screen/splash_screen/splash_screen.dart';
import 'package:new_note/presentation/theme/vintage_teme.dart';

main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme : vintageTheme,
      home: const SplashPage(),
      
    );
  }
}