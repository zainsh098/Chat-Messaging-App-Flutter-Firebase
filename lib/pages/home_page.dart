import 'package:chat_messaging_app/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void signOut()
  {

    final authService=Provider.of<AuthService>(context,listen: false);
    authService.signOut();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage'),
      actions: [

        IconButton(onPressed: () {

          signOut();


          
        }, icon: Icon(Icons.logout_sharp,size: 25,)),
        SizedBox(width: 10,),
        ],
      
      ),
      
      
    );
  }
}
