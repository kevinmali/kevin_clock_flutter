import 'dart:math';

import 'package:clockapp/analog.dart';
import 'package:clockapp/roundclock.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    color: Colors.black,
    routes: {
      '/': (ctx) => clockapp(),
      'round': (ctx) => roundwatch(),
      'analog': (ctx) => analog(),
    },
  ));
}

class clockapp extends StatefulWidget {
  State<clockapp> createState() => _clockappState();
}

class _clockappState extends State<clockapp> {
  int h = 0;
  int m = 0;
  int s = 0;

  myClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour;
        m = DateTime.now().minute;
        s = DateTime.now().second;
      });
      myClock();
    });
  }

  @override
  void initState() {
    super.initState();
    myClock();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        // toolbarHeight: 25,
        elevation: 0,
        centerTitle: true,
        title: Text("Strck watch"),
      ),
      floatingActionButton: IconButton(
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed("round");
        },
        icon: Icon(Icons.arrow_forward_ios),
      ),
      body: Center(
        child: Container(
          height: 150,
          width: 250,
          color: Colors.red,
          // decoration: BoxDecoration(
          //
          //   image: DecorationImage(
          //     image:
          //         AssetImage("assets/images/Screenshot 2023-07-04 163339.png"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                "${h} : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              Text(
                "${m} : ",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              Text(
                "${s} ",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
