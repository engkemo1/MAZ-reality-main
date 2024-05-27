import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/features/chat/logic/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/helpers/shared_pres.dart';
import '../model/chat_model.dart';
import 'chat_screen.dart';

class ListUserChat extends StatefulWidget {
  List<ChatsModel> myChats = [];

  ListUserChat({super.key, required this.myChats});

  @override
  State<ListUserChat> createState() => _ListUserChatState();
}

class _ListUserChatState extends State<ListUserChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "My Chats",
              style: TextStyle(fontSize: 25),
            )),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      var date =
                          DateTime.parse(widget.myChats[index].createdAt!);
                      return GestureDetector(
                        onTap: () async {
                          var userID = await SharedPres.getUserId();

                          await ChatCubit()
                              .fetchMessages(widget.myChats[index].receiver!.sId
                                  .toString())
                              .then((v) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ChatScreen(
                                          receiverId: widget
                                              .myChats[index].receiver!.sId
                                              .toString(),
                                          messages: v,
                                          userId: userID,
                                        )));
                          });
                        },
                        child: ListTile(
                          title:  Text(widget.myChats[index].receiver==null?"Unknown":widget.myChats[index].receiver!.name.toString()),
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                widget.myChats[index].receiver == null
                                    ? "https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
                                    : widget.myChats[index].receiver!.photo ==
                                            null
                                        ? "https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg"
                                        : widget.myChats[index].receiver!.photo
                                            .toString(),
                              )),
                          subtitle: Text(
                              widget.myChats[index].lastMessage.toString()),
                          trailing: Text("${date.hour} H"),
                        ),
                      );
                    },
                    separatorBuilder: (context, i) => Divider(),
                    itemCount: widget.myChats.length)),
          ],
        ),
      ),
    );
  }
}
