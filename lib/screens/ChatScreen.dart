import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/ChatProvider.dart';
import 'package:whatsapp/widgets/ChatBox.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> chats = [];

  @override
  void initState() {
     Provider.of<ChatProvider>(context, listen: false).loadJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    chats = Provider.of<ChatProvider>(context).chats;

    return Container(
      child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return ChatBox(
                personName: chats[index].personName,
                recentChat:  chats[index].recentChat);
          }),
    );
  }
}
