import 'package:flutter/material.dart';
import 'package:wordsplay_demo/game.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LandingPage> {
  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 60, 44, 76),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/wordplay1.png',
            fit: BoxFit.scaleDown,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                "WordPlay",
                style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      //press karne pe navigate karne ke liye
                      builder: (context) => const GamePage(),
                    ),
                  );
                },
                color: Colors.red,
                child: const Text(
                  "START!",
                  style: TextStyle(
                    fontSize: 43.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
