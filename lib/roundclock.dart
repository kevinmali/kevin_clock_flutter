import 'package:flutter/material.dart';

class roundwatch extends StatefulWidget {
  const roundwatch({super.key});

  @override
  State<roundwatch> createState() => _roundwatchState();
}

class _roundwatchState extends State<roundwatch> {
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
      backgroundColor: Colors.orange,
      appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 2,
          title: Text(
            " Round Clock ",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true),
      floatingActionButton: IconButton(
        color: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed("analog");
        },
        icon: Icon(Icons.arrow_forward_ios),
      ),
      body: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 8,
              child: CircularProgressIndicator(
                color: Colors.blue,
                strokeWidth: 5,
                value: s.toDouble() / 60,
              ),
            ),
            Transform.scale(
              scale: 6,
              child: CircularProgressIndicator(
                color: Colors.yellow,
                strokeWidth: 6,
                value: m.toDouble() / 60,
              ),
            ),
            Transform.scale(
              scale: 4,
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 7,
                value: h.toDouble() / 12,
              ),
            ),
            Text(
              "${h} :${m} :${s}",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
