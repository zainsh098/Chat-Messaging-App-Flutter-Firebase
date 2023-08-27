import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
 final DateTime dateTime;

  const ChatBubble({super.key, required this.message,required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: Column(
        children: [
          Text(message,style: TextStyle(fontSize: 16,color: Colors.white),),
          Text(dateTime.toString()),


        ],


      )
    );
  }
}



class ChatEmailBubble extends StatelessWidget {
  final String email;
  const ChatEmailBubble({super.key,required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 39,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Text("Email : "+email,style: TextStyle(fontSize: 10,color: Colors.black),),
    );
  }
}



