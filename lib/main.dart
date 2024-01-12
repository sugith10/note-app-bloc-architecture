import 'package:flutter/material.dart';
import 'package:new_note/view/screen_all_notes.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AllNotesScrn(),
    );
  }
}