import 'dart:convert';

import 'package:chatify/program/communication.dart';
import 'package:flutter/material.dart';

class MessageControl with ChangeNotifier {
  List<Map<bool, String>> messages = [];

  final MessageService _service = MessageService();

  void deleteMessage(int index) {
    messages.removeAt(index);
    notifyListeners();
  }

  void addMessage(bool isUser, String message) {
    _service.send?.send(jsonEncode({"message" : message, "send_to_id" : "401588538"}));
    messages.add({isUser : message});
    notifyListeners();
  }

  void deleteAllMessages() {
    messages.clear();
    notifyListeners();
  }

  void updateMessage(int index, String message) {
    Map<bool, String> msg = messages[index];
    bool m = msg.keys.first;
    msg[m] = message;
    notifyListeners();
  }


}