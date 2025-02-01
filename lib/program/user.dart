import 'package:chatify/program/colors_code.dart';
import 'package:chatify/program/message_screen_code.dart';
import 'package:chatify/program/res.dart';
import 'package:chatify/screens/message_screen.dart';
import 'package:chatify/screens/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserPicture(),
      onTap: (){
        if(IsMobile.mobile.isMobile){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(),));
        } else {
          Provider.of<MessageScreenCode>(context, listen: false).addScreen(
          MessageScreen(username: "Ankush")
        );
        }
        
      },
      hoverColor: blueGreyLight.withOpacity(0.3),
     
      splashColor: grey,
      title: const Text("Ankush"),
      subtitle: const Text("online"),
    );
  }
}