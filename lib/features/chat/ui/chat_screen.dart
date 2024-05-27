import 'package:final_project/features/chat/logic/chat_cubit.dart';
import 'package:final_project/features/chat/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

import '../../../core/helpers/shared_pres.dart';
import '../logic/web_socket.dart';

class ChatScreen extends StatefulWidget {
  String? userId;
  final String receiverId;
  List<Message> messages = [];

  ChatScreen({
    super.key,
    this.userId,
    required this.messages,
    required this.receiverId,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  IO.Socket? socket;
  @override
  void initState() {
    socket = IO.io('https://mazrealty-live.onrender.com/',
        OptionBuilder().setTransports(['websocket']).build());
    socket!.on('getMessage', (data) {
      if (data["chatId"] == widget.messages.first.chatId) {
        widget.messages.add(Message(
          text: data["text"],
          chatId: data["chatId"],
          userId: data["userId"],
        ));
        setState(() {});
      }
      // Handle received message
      print('Received message: $data');
    });
    socket!.onConnect((_) {
      print('connected');
    });
    socket!.emit("newUser", widget.userId);
    // Listen for messages from the server
    super.initState();

  }

  void _sendMessage(String message) async {

    if (message.isNotEmpty) {
      setState(() {
        widget.messages.add(Message(
          text: message,
          userId: widget.userId,
        ));
      });
      _controller.clear();

      String token = await SharedPres.getToken() ?? '';
      if (token.isNotEmpty) {
        await Dio()
            .post(
          "https://mazrealty-live.onrender.com/api/v1/messages/",
          data: {
            "text": message,
            "to": widget.receiverId,
          },
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ),
        )
            .then((response) {

          socket!.emit('sendMessage',
              {"receiverId": widget.receiverId, "data": response.data});
            }).catchError((error) {
          print("Error sending message: $error");
          // Handle errors here
        });

      } else {
        print("Authentication token is empty or null");
      }
    }
  }

  @override
  void dispose() {
    // Disconnect from the Socket.IO server
    socket!.dispose();
    super.dispose();
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
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                bool isMe = widget.messages[index].userId == widget.userId;
                return Align(
                    alignment:
                        isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isMe ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.messages[index].text!,
                        style: TextStyle(
                            color: isMe ? Colors.white : Colors.black),
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
