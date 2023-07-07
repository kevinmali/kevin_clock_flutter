import 'dart:math';

import 'package:flutter/material.dart';

class analog extends StatefulWidget {
  const analog({super.key});

  @override
  State<analog> createState() => _analogState();
}

class _analogState extends State<analog> {
  int h = 0;
  int m = 0;
  int s = 0;

  myClock() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        h = DateTime.now().hour % 12;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text(
          "Analog Clock",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            ...List.generate(
              60,
              (index) => Transform.rotate(
                angle: (pi * 2) * (index / 60),
                child: Divider(
                  color: (index % 5 == 0) ? Colors.red : Colors.red,
                  thickness: (index % 5 == 0) ? 7 : 2,
                  endIndent: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
            ),
            Container(
              height: 340,
              width: 340,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Stack(
                alignment: Alignment(0, -0.5),
                children: [
                  Text(
                    "${h} : ${m} : ${s}",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            Transform.rotate(
              angle: (pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (s / 60),
                child: Divider(
                  color: Colors.red,
                  thickness: 2,
                  endIndent: MediaQuery.of(context).size.width * 0.4,
                  indent: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
            ),
            Transform.rotate(
              angle: (pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (m / 60),
                child: Divider(
                  color: Colors.red,
                  thickness: 4,
                  endIndent: MediaQuery.of(context).size.width * 0.5,
                  indent: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
            ),
            Transform.rotate(
              angle: (pi / 2),
              child: Transform.rotate(
                angle: (pi * 2) * (h / 60),
                child: Divider(
                  color: Colors.red,
                  thickness: 5,
                  endIndent: MediaQuery.of(context).size.width * 0.5,
                  indent: MediaQuery.of(context).size.height * 0.06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
