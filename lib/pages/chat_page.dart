import 'package:flutter/material.dart';



class ChatPage extends StatefulWidget {


  final receiverUserEmail;
  final receiverUserId;
  const ChatPage({super.key,required this.receiverUserEmail,required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        
        
      ),



    )  ;
  }
}
