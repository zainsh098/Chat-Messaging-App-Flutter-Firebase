import 'package:chat_messaging_app/components/my_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),

                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey.shade800,
                ),
                SizedBox(
                  height: 40,
                ),

                //Welcome back message
                const Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                // email textfield
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                SizedBox(
                  height: 40,
                ),
                // passaword textfield
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true)

                // signin button

                // not  a member? register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
