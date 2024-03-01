import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chat {
  final String personName;
  final String recentChat;
  final List<Map<String, dynamic>> chatHistory;

  Chat({
    required this.personName,
    required this.recentChat,
    required this.chatHistory,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      personName: json['person_name'],
      recentChat: json['recent_sent_message'],
      chatHistory: List<Map<String, dynamic>>.from(json['chat_history']),
    );
  }
}

class ChatProvider with ChangeNotifier {
  List<Chat> _chats = [];

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    _chats = jsonList.map((json) => Chat.fromJson(json)).toList();
    notifyListeners();
  }

  List<Chat> get chats => _chats;
}
