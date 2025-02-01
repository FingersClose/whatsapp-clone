import 'package:chatify/program/colors_code.dart';
import 'package:chatify/program/message_control.dart';
import 'package:chatify/program/message_screen_code.dart';
import 'package:chatify/program/times.dart';
import 'package:chatify/screens/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MessageScreen extends StatelessWidget {
  String? username;
  MessageScreen({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: ListTile(
          onTap: () {},
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          tileColor: Colors.transparent,
          selectedColor: Colors.transparent,
          splashColor: Colors.transparent,
          selectedTileColor: Colors.transparent,
          leading: UserPicture(
            onPressed: () {},
          ),
          title: Consumer<MessageScreenCode>(
            builder: (context, value, child) {
              return Text(
                username ?? value.username,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
          subtitle: Consumer<MessageScreenCode>(
            builder: (context, value, child) {
              return Text(value.subtitle);
            },
          ),
          horizontalTitleGap: 20,
          contentPadding: const EdgeInsets.only(left: 10, right: 0),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: blueGreyLight,
            thickness: 1,
            height: 0,
          ),
        ),
      ),
      body: Stack(
        children: [
          Body(),
          Positioned(
            bottom: 0, // You can adjust the bottom value to position it at the bottom
            left: 0,
            right: 0,
            child: MessageInput(), // Place MessageInput widget in the stack
          ),
        ],
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  MessageInput({super.key});
  static final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blueGreyLight.withOpacity(0.5),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: true,
              autofocus: true,
              focusNode: _focusNode,
              onSubmitted: (v) {
                if (v.isNotEmpty) {
                  Provider.of<MessageControl>(context, listen: false)
                      .addMessage(true, v);
                  _controller.text = "";
                  _focusNode.requestFocus();
                }
              },
              decoration: InputDecoration(
                hintText: "Type a message...",
                filled: true,
                fillColor: white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: () {
              String m = _controller.text;
              if (m.isNotEmpty) {
                
                Provider.of<MessageControl>(context, listen: false)
                    .addMessage(true, m);
                _controller.text = "";
                _focusNode.requestFocus();
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 243, 241, 222),
      child: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: NoScrollbarBehavior(),
              child: Consumer<MessageControl>(
                builder: (context, value, child) {
                  Future.delayed(const Duration(milliseconds: 50), () {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOut,
                      );
                    }
                  });
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) {
                      Map<bool, String> msg = value.messages[index];
                      bool side = msg.keys.first;
                      return UserSideMessage(
                        message: msg[side]!,
                        isUser: side,
                        index: index,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class UserSideMessage extends StatelessWidget {
  late String message;
  late bool isUser;
  int index;
  UserSideMessage(
      {super.key,
      required this.message,
      required this.isUser,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        constraints: const BoxConstraints(
          minWidth: 20,
          maxWidth: 50,
        ),
        child: InkWell(
          onLongPress: () {
            // Provider.of<MessageControl>(context, listen: false)
            //     .deleteMessage(index);
          },
          child: Container(
            constraints: const BoxConstraints(minWidth: 55, maxWidth: 350),
            padding: const EdgeInsets.all(5),
            margin: isUser
                ? const EdgeInsets.only(bottom: 2, top: 2, right: 20)
                : const EdgeInsets.only(bottom: 2, top: 2, left: 20),
            decoration: BoxDecoration(
                color:
                    isUser ? const Color.fromARGB(255, 191, 255, 193) : white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.grey, offset: Offset(0.0, 1)),
                ]),
            child: Stack(
              children: [
                Text(
                  message,
                ),
              ],
            ),
            // child: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Text(message, overflow: TextOverflow.clip,maxLines: 1,),
            //     ValueListenableBuilder(valueListenable: _messageOptions, builder: (context, value, child) {
            //       return value ? const Icon(Icons.arrow_circle_down_rounded, color: Colors.blueGrey,) : const SizedBox();
            //     },)
            //   ],
            // ),

            // child: Column(
            //   mainAxisSize: MainAxisSize.min,

            //   children: [
            //     Text(
            //       message,
            //       textAlign: TextAlign.start,
            //       style:
            //           const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w400),
            //     ),
            //     Text(Time().currentTime,

            //         textAlign: TextAlign.right,
            //         style: const TextStyle(
            //           fontWeight: FontWeight.w500,
            //             color: Color.fromARGB(255, 61, 61, 61), fontSize: 10, ), ),
            //   ],
            // ),),
          ),
        ));
  }
}

class NoScrollbarBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Return child without any scrollbar
  }

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Remove overscroll indicator
  }
}
