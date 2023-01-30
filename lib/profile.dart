import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  String name;
   Profile({Key? key , required this.name} ) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}



