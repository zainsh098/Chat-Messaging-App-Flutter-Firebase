import 'package:chat_messaging_app/pages/login_page.dart';
import 'package:chat_messaging_app/pages/register_page.dart';
import 'package:chat_messaging_app/services/auth/login_or_signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat Messaging App ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginOrRegister(),
    );
  }
}

