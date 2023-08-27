

import 'package:chat_messaging_app/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatService extends ChangeNotifier{

  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;

  Future<void > sendMessage(String receiverId,String message)

  async{

    // get current userID
    final String currentUserId=_firebaseAuth.currentUser!.uid;
    final String currentUserEmail=_firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp=Timestamp.now();

    // create a new message
    
    Message newMessage=Message(

        senderId: currentUserId, senderEmail: currentUserEmail, receiverId: receiverId, message: message, timestamp: timestamp);

    // construct chat room id form current user id and receive id (sorted to ensure uniqueneess)

    List<String>ids=[currentUserId,receiverId];
    ids.sort(); // sorting ids , it will ensure the chatroom is always the same for any pair of people






     // add new message to database



  }




// Get messages



}