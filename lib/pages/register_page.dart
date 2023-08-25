import 'package:chat_messaging_app/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                    'Lets create and account for you!',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),

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

                  const SizedBox(height: 40,),

                  MyTextField(
                      controller: passwordController,
                      hintText: 'Confirm Password',
                      obscureText: true),

                  // signin button

                  const SizedBox(
                    height: 40,
                  ),
                  MyButton(callback: () {

                  }, text: "SIGN Up"),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [const Text('Already a member ?'),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));


                      }, child: const Text('Login now',
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
