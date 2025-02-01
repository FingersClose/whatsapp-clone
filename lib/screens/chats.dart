import 'package:chatify/program/active_buttons.dart';
import 'package:chatify/program/chat_body_code.dart';
import 'package:chatify/program/colors_code.dart';
import 'package:chatify/program/programs.dart';
import 'package:chatify/program/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Chats extends StatelessWidget {
  const Chats({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.50,
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 250),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 1, color: grey),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "Chats",
                    
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        Provider.of<ChatBodyCode>(context, listen: false)
                            .addUser(const User());
                      },
                      icon: const Icon(
                        Icons.add_comment_outlined,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_rounded,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Input(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: [
                  Consumer<ActiveButtonsCode>(
                    builder: (context, activeButtonsCode, child) {
                      return TextButton(
                        onPressed: () {
                          activeButtonsCode.changeButtonNumber(1);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: activeButtonsCode.number == 1
                              ? lightGreenTrans
                              : grey,
                        ),
                        child: Text(
                          "All",
                          style: TextStyle(
                            color: activeButtonsCode.number == 1
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                  Consumer<ActiveButtonsCode>(
                    builder: (context, activeButtonsCode, child) {
                      return TextButton(
                        onPressed: () {
                          activeButtonsCode.changeButtonNumber(2);
                        },
                        style: TextButton.styleFrom(
                          overlayColor: Colors.grey,
                          backgroundColor: activeButtonsCode.number == 2
                              ? lightGreenTrans
                              : grey,
                        ),
                        child: Text(
                          "Unread",
                          style: TextStyle(
                            color: activeButtonsCode.number == 2
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                  Consumer<ActiveButtonsCode>(
                    builder: (context, activeButtonsCode, child) {
                      return TextButton(
                        onPressed: () {
                          activeButtonsCode.changeButtonNumber(3);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: activeButtonsCode.number == 3
                              ? lightGreenTrans
                              : grey,
                        ),
                        child: Text(
                          "Favourate",
                          style: TextStyle(
                            color: activeButtonsCode.number == 3
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                  Consumer<ActiveButtonsCode>(
                    builder: (context, activeButtonsCode, child) {
                      return TextButton(
                        onPressed: () {
                          activeButtonsCode.changeButtonNumber(4);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: activeButtonsCode.number == 4
                              ? lightGreenTrans
                              : grey,
                        ),
                        child: Text(
                          "Groups",
                          style: TextStyle(
                            color: activeButtonsCode.number == 4
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: const ChatBody(),
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Consumer<ChatBodyCode>(builder: (context, value, child) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: value.users.length,
            itemBuilder: (context, index) {
              return value.users[index];
            },
            separatorBuilder: (BuildContext context, int index) {
              return  Divider(
                color: grey,
                thickness: 1, 
                height: 1, 
              );
            },
          );
        }))
      ],
    );
  }
}
