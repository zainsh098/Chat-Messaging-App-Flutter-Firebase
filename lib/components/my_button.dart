import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const MyButton({super.key, required this.callback, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 50), backgroundColor: Colors.black),
        onPressed: callback,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ));
  }
}
