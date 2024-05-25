import 'package:final_project/features/chat/logic/chat_cubit.dart';
import 'package:final_project/features/chat/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../../core/helpers/shared_pres.dart';
import '../logic/web_socket.dart';

class ChatScreen extends StatefulWidget {
  String? userId;
  final String receiverId;
  List<Message> messages = [];

  ChatScreen({super.key,
    this.userId,
    required this.messages,
    required this.receiverId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();


  listenMessageEvent(VoidCallback setState) {
    WebSocketManager.instance.webSocketReceiver("", (data) {
      widget.messages.add(Message.fromJson(data));
      setState();
    });
  }

  @override
  void initState() {
    WebSocketManager.instance.initializeSocketConnection();

    //Listen chat channel
    listenMessageEvent(() {
      setState(() {});
    });
    super.initState();
    // Initialize SocketIO
    // Connect to server
    // Fetch messages when the screen is initialized
    ChatCubit().fetchMessages(widget.receiverId).then((onValue){
      setState(() {
        widget.messages=onValue;
      });
    });
  }

  @override
  void dispose() {
    // Disconnect socket when the screen is disposed
    super.dispose();
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      // Retrieve the token from prefs
      String token = await SharedPres.getToken() ?? '';
      if (token.isNotEmpty) {
        // Send message to the server with the correct authorization headers
        await Dio().post(
          "https://mazrealty-live.onrender.com/api/v1/messages/",
          data: {
            "text": message,
            "to": "662aa962cf52dc2cdceec751",
          },
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        ).then((response) {
          setState(() {
            widget.messages.add(Message(
              text: message,
              userId: widget.userId,
            ));
          });
          print("Message sent: $message");
          print("Response: ${response.data}");
          // Optionally, you can process the response here
        }).catchError((error) {
          print("Error sending message: $error");
          // Handle errors here
        });

        // Add sent message to the local message list


        // Clear the message input field
        _controller.clear();
      } else {
        print("Authentication token is empty or null");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:   widget.messages.length,
              itemBuilder: (context, index) {
                bool isMe = widget.messages[index].userId == widget.userId;
                return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.messages[index].text!,
                        style: TextStyle(color: isMe ? Colors.white : Colors.black),
                      ),
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}