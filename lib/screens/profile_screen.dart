import 'package:chatify/program/colors_code.dart';
import 'package:chatify/screens/user_picture.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.50,
        constraints: const BoxConstraints(maxWidth: 500, minWidth: 250),
        decoration: BoxDecoration(
            border: Border(
          right: BorderSide(width: 1, color: grey),
        )),
        child: Scaffold(
          backgroundColor: grey,
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    title: const Text(
                      "Profile",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                color: grey,
                child: UserPicture(
                  squareSize: 200,
                ),
              ),
              Container(
                color: white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Name',
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 53, 55), fontSize: 15),
                      ),
                      SizedBox(height: 8), // Yahan pe gap define karo
                      Text(
                        'Ankush',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 90,
                color: grey,
                child: Text(
                    "This is not your username or PIN. This name will be visible or your whatsapp contacts."),
              ),
              Container(
                color: white,
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                  title: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                            color: Color.fromARGB(255, 5, 53, 55), fontSize: 15),
                      ),
                      SizedBox(height: 8), // Yahan pe gap define karo
                      Text(
                        'Time Time ki baat hai',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
