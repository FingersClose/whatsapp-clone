import 'package:chatify/program/colors_code.dart';
import 'package:chatify/screens/user_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

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
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: AppBar(
                  backgroundColor: Colors.white,
                  title: const Text(
                    "Status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
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
              const StatusDp(),
              Divider(
                color: grey,
                thickness: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusDp extends StatelessWidget {
  const StatusDp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          const SizedBox(
            height: 50,
            width: 50,
           
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(height: 47,child:UserPicture(),)),
          Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      size: 20,
                      color: Colors.white,
                    ),
                    style:
                        IconButton.styleFrom (backgroundColor: const Color.fromARGB(255, 0, 204, 105),padding: const EdgeInsets.all(0)),
                  )))
        ],
      ),
      title: const Text(
        "My Status",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: const Text("click to add status update"),
    );
  }
}