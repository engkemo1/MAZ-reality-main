import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String text;
  final bool isMe;

  ChatMessage(this.text, {this.isMe = false});

  @override
  List<Object?> get props => [text, isMe];
}
