import 'package:chat_messaging_app/components/my_button.dart';
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
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),

                  Icon(
                    Icons.message,
                    size: 80,
                    color: Colors.grey.shade800,
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  //Welcome back message
                  const Text(
                    'Welcome back you\'ve been missed',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // email textfield
                  MyTextField(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false),
                  const SizedBox(
                    height: 40,
                  ),
                  // passaword textfield
                  MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true),

                  // signin button

                  const SizedBox(
                    height: 40,
                  ),
                  MyButton(callback: () {

                  }, text: "SIGN IN"),
                  const SizedBox(height: 5,),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Not member ?'),
                      TextButton(onPressed: () {
                        
                      }, child: const Text('Register Now',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    
                    
                    ],
                    
                  ),

                  // not  a member? register now
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
