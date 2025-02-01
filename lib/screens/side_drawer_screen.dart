import 'package:chatify/program/colors_code.dart';
import 'package:chatify/program/side_drawer.dart';
import 'package:chatify/program/status_code.dart';
import 'package:chatify/screens/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawerScreen extends StatelessWidget {
  const SideDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Material(
          // Added Material widget here
          child: Container(
            padding: const EdgeInsets.all(5),
            constraints: const BoxConstraints(
                minWidth: 60, maxWidth: 70, minHeight: 500),
            height: constraints.maxHeight,
            color: grey,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SideDrawer(),
                Expanded(child: BottomDrawerButtons()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Consumer<StatusCode>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                print("Home");
                value.changeButtonNumber(1);
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToHome();
              },
              icon: const Icon(Icons.chat_rounded),
              style: IconButton.styleFrom(
                  backgroundColor:
                      value.number == 1 ? Colors.blueGrey.shade100 : null),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Consumer<StatusCode>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                print("Status");
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToStatus();
                value.changeButtonNumber(2);
              },
              icon: const Icon(Icons.star_border_rounded),
              style: IconButton.styleFrom(
                  backgroundColor: value.number == 2 ? blueGreyLight : null),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Consumer<StatusCode>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToChannel();
                value.changeButtonNumber(3);
              },
              icon: const Icon(Icons.change_circle_outlined),
              style: IconButton.styleFrom(
                  backgroundColor: value.number == 3 ? blueGreyLight : null),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Consumer<StatusCode>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToCommunities();
                value.changeButtonNumber(4);
              },
              icon: const Icon(Icons.group_outlined),
              style: IconButton.styleFrom(
                  backgroundColor: value.number == 4 ? blueGreyLight : null),
            );
          }),
        ),
      ],
    );
  }
}

class BottomDrawerButtons extends StatelessWidget {
  const BottomDrawerButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Consumer<StatusCode>(builder: (context, value, child) {
            return IconButton(
              onPressed: () {
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToSettings();
                value.changeButtonNumber(5);
              },
              icon: const Icon(Icons.settings),
              style: IconButton.styleFrom(
                  backgroundColor: value.number == 5 ? blueGreyLight : null),
            );
          }),
        ),
        Padding(
            padding: const EdgeInsets.all(5),
            child: Consumer<StatusCode>(builder: (context, value, child) {
            return UserPicture(
              squareSize: 30,
              onPressed: () {
                Provider.of<SideDrawerCode>(context, listen: false)
                    .changeToProfile();
                value.changeButtonNumber(6);
              },
            );
          }),)
      ],
    );
  }
}
