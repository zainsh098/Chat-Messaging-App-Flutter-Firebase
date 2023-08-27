import 'package:chat_messaging_app/components/chat_bubble.dart';
import 'package:chat_messaging_app/components/my_text_field.dart';
import 'package:chat_messaging_app/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  final receiverUserEmail;
  final receiverUserId;
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;















  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUserId, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),

          //user input
          _buildMessageInput(),
        ],
      ),
    );
  }

  //buildding message list

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          widget.receiverUserId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error' + snapshot.error.toString());
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading');
        }

        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  //build message item

  Widget _buildMessageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    // align the messags of receriver to right and other left
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            ChatEmailBubble(email: data['senderEmail']),
            SizedBox(
              height: 6,
            ),
            ChatBubble(message: data['message'],dateTime: DateTime.now())
          ],
        ),
      ),
    );
  }

  // build message Input.

  Widget _buildMessageInput() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _messageController,

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue),

                ),
                fillColor: Colors.grey.shade100,
                filled: true,


                border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)


                )

              ),
              enabled: true,

            ),
          ),




        ),
        IconButton(
          onPressed: sendMessage,
          icon: Icon(Icons.send),
        ),











      ],
    );
  }
}
