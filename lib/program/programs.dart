import 'package:chatify/program/colors_code.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({super.key});
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 35,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: "Search",
            filled: true,
            prefixIcon: const Icon(Icons.search, color: Colors.blueGrey,),
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.only(left: 20, right: 20),
            fillColor: grey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none
            )
          ),
        ),
      ),
    );
  }
}