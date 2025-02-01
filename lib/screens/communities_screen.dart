import 'package:chatify/program/colors_code.dart';
import 'package:flutter/material.dart';

class CommunitiesScreen extends StatelessWidget {
  const CommunitiesScreen({super.key});

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
                      "Communities",
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25 ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}

