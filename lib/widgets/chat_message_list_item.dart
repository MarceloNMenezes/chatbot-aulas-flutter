import 'package:chatbot/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    var now = new DateTime.now();

    return Container(
      child: ListTile(
      contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 0.0),
      trailing: CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
      title: Text(chatMessage.name, textAlign: TextAlign.right),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
      dense: true,
      leading: Text('${DateFormat("H:m:s").format(now)}', style: TextStyle(fontSize: 10), textAlign: TextAlign.left),
    ),
    decoration: BoxDecoration(
      color: Colors.greenAccent.withBlue(1).withOpacity(0.3),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10.0),
        right: Radius.circular(10.0)
    )
    ),
    );
  }

    Widget _showReceivedMessage() {
    var now = new DateTime.now();

    return Container(child: ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 10.0, 0.0),
      leading: CircleAvatar(child: Text(chatMessage.name.toUpperCase()[0])),
      title: Text(chatMessage.name, textAlign: TextAlign.left),
      subtitle: Text(chatMessage.text, textAlign: TextAlign.left),
      dense: true,
      trailing: Text('${DateFormat("H:m:s").format(now)}',style: TextStyle(fontSize: 10),  textAlign: TextAlign.right),
    ),
    decoration: BoxDecoration(
      color: Colors.black.withOpacity(0.04),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10.0),
        right: Radius.circular(10.0)
    )
    ),
    
    );
    
  }
}