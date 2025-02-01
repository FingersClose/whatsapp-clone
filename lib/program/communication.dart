import 'dart:convert';
import 'dart:isolate';
import 'dart:io';

import 'package:chatify/program/message_control.dart';

class MessageService {
  static WebSocket? socket;
  static SendPort? isolate;
  static SendPort? mainSendPort;

  SendPort? get send => mainSendPort;

  static final MessageService _service = MessageService._private();
  MessageService._private();

  factory MessageService() {
    return _service;
  }

  Future<void> _connectToWebsocket() async {
    try {
      socket ??= await WebSocket.connect("ws://127.0.0.1:4040");
      socket?.listen((message) {
        print("connecting Message: ${message.toString()}");
        isolate?.send(message);
      });
    } catch (e) {
      print("WebSocket connection error: $e");
    }
  }

  void anotherIsolate(SendPort send) {
    isolate ??= send;
    ReceivePort receivePort = ReceivePort();
    _connectToWebsocket();
    send.send(receivePort.sendPort);
    receivePort.listen((message) {
      socket?.add(message);
    });
  }

  Future<void> startIsolate(MessageControl control) async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(anotherIsolate, receivePort.sendPort);
  
  SendPort? sendPort;
  receivePort.listen((message) {
    if (sendPort == null) {
      // First message is the SendPort
      sendPort = message as SendPort;
      mainSendPort ??= sendPort;
    } else {
      Map<String, dynamic> jsonMessage = jsonDecode(message);
      control.addMessage(false, jsonMessage["message"]);
      print("Incoming Message: $message");
    }
  });
}

}
