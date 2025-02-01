import 'package:chatify/program/active_buttons.dart';
import 'package:chatify/program/communication.dart';
import 'package:chatify/program/message_control.dart';
import 'package:chatify/program/message_screen_code.dart';
import 'package:chatify/program/responsive.dart';
import 'package:chatify/program/side_drawer.dart';
import 'package:chatify/program/status_code.dart';
import 'package:chatify/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'program/chat_body_code.dart';

void main() async {
  final messageControl = MessageControl();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SideDrawerCode(),
        ),
        ChangeNotifierProvider(
          create: (context) => ActiveButtonsCode(),
        ),
        ChangeNotifierProvider(
          create: (context) => StatusCode(),
        ),
        ChangeNotifierProvider(
          create: (context) => MessageScreenCode(),
        ),
        ChangeNotifierProvider(
          create: (context) => messageControl,
        ),
        ChangeNotifierProvider(create: (context) => Responsive()),
        ChangeNotifierProvider(create: (context) => ChatBodyCode())
      ],
      child: const Launcher(),
    ),
  );
  MessageService().startIsolate(messageControl);
}

class Launcher extends StatelessWidget {
  const Launcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(iconTheme: const IconThemeData(color: Colors.blueGrey)),
      home: const SplashScreen(),
    );
  }
}