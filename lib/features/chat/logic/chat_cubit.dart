import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/features/chat/model/message_model.dart';

import '../../../core/helpers/shared_pres.dart';
import '../../../main.dart';
import '../model/chat_model.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<List<ChatMessage>> {
  ChatCubit() : super([]);

  void addMessage(ChatMessage message) {
    emit(List.from(state)..add(message));
  }

  Dio dio = Dio();

  senMessage(String message, String id) async {
    try {
      String token = await SharedPres.getToken() ?? '';
      print(token);
print("${prefs!.getString('token')}");
      final Response response = await dio.post(
        "https://mazrealty-live.onrender.com/api/v1/messages/",
        data: {"text": message, "to": id},
        options: Options(headers: {
          "Authorization":
              "Bearer ${token}"
        }),
      );
      print(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future fetchMessages(String id,) async {
    print(id);

    List<Message> messages = [];
    try {
      String token = await SharedPres.getToken() ?? '';
      if (token.isNotEmpty) {
        // Make a GET request to fetch the chat data for both users
        Response response = await Dio().get(
          "https://mazrealty-live.onrender.com/api/v1/chats/$id",
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
        // Extract messages from the response
        List<dynamic> messageList = response.data['messages'];
        // Update the UI with the received messages
        messages = messageList.map((message) => Message.fromJson(message)).toList();
        print(messages.first);
      } else {
        print("Authentication token is empty or null");
      }
    } catch (error) {
      print("Error fetching messages: $error");
      // Handle errors here
    }
    return messages;
  }
  Future fetchChats() async {

    List<ChatsModel> myChats = [];
    try {
      String token = await SharedPres.getToken() ?? '';

        // Make a GET request to fetch the chat data for both users
        Response response = await Dio().get(
          "https://mazrealty-live.onrender.com/api/v1/chats",
          options: Options(headers: {"Authorization": "Bearer $token"}),
        );
      print(response.data);

      myChats = (response.data as List).map((chat) => ChatsModel.fromJson(chat)).toList();
      print("///////////");
    } catch (error) {
      print("Error fetching messages: $error");
      // Handle errors here
    }
    return myChats;
  }

}
