import 'package:flutter/material.dart';

class UnderConstruction extends StatelessWidget {
  const UnderConstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Oops! Esta función aún no está implementada ;(',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 50),
              Image.asset('assets/gifs/robotTyping.gif'),
            ],
          ),
        ],
      ),
    );
  }
}
