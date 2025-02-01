import 'package:chatify/program/colors_code.dart';
import 'package:chatify/program/message_screen_code.dart';
import 'package:chatify/program/res.dart';
import 'package:chatify/program/side_drawer.dart';
import 'package:chatify/screens/channels_screen.dart';
import 'package:chatify/screens/chats.dart';
import 'package:chatify/screens/profile_screen.dart';
import 'package:chatify/screens/settings.dart';
import 'package:chatify/screens/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:chatify/screens/communities_screen.dart';
import 'package:chatify/screens/side_drawer_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static IsMobile mobile = IsMobile();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (width > 600) {
      if (mobile.isMobile) {
        mobile.isMobile = false;
        print("Landscape Screen Updating");
      }
    } else {
      if (!mobile.isMobile) {
        mobile.isMobile = true;
        print("Portrait Screen Updating");
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  // Row for Main Content
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Side Drawer for Desktop
                        if (width > 600) const SideDrawerScreen(),

                        Expanded(
                          child: Consumer<SideDrawerCode>(
                            builder: (context, value, child) {
                              switch (value.currentScreen) {
                                case "home":
                                  return const Chats();
                                case "status":
                                  return const StatusScreen();
                                case "communities":
                                  return const CommunitiesScreen();
                                case "settings":
                                  return const Settings();
                                case "channel":
                                  return const ChannelScreen();
                                default:
                                  return const ProfileScreen();
                              }
                            },
                          ),
                        ),

                        // Right-Side Container for Larger Screens
                        if (width > 600)
                          Expanded(
                            child: Container(
                              constraints: const BoxConstraints(minWidth: 600),
                              color: grey,
                              child: Consumer<MessageScreenCode>(
                                builder: (context, value, child) {
                                  return value.screen ??
                                      Center(
                                        child: SvgPicture.asset(
                                          "assets/images/icon_without_screen.svg",
                                          height: 200,
                                        ),
                                      );
                                },
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  width < 600
                      ? Container(
                          height: 70,
                          constraints: BoxConstraints(
                              maxHeight: 70, minHeight: 60, maxWidth: width),
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(top: BorderSide(color: blueGreyLight.withOpacity(0.2),))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () {},
                                  child: const Icon(Icons.chat_bubble, color: Colors.black,)),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child:
                                      const Icon(Icons.change_circle_outlined, color: Colors.black,)),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: const Icon(Icons.group_outlined, color: Colors.black,)),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  child: const Icon(Icons.call, color: Colors.black,))
                            ],
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),

            // Floating Action Button for Mobile
            if (IsMobile().isMobile)
              Positioned(
                bottom: height * 0.10,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color.fromARGB(255, 37, 211, 102),
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.message_rounded),
                ),
              ),
          ],
        );
      },
    );
  }
}
