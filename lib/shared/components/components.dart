import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void snackBar(BuildContext context,String? message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.white70,
      content: Text(message!,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),),);
  print("error");
}