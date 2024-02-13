import 'package:flutter/material.dart';

class Message{
    void showSuccessMessage(String message, BuildContext context){
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}