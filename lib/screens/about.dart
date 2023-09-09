import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 1,
              height: (contextHeight - 500) / 2,
            ),
            const Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '¿Quienes Somos?',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String description = 'Somos una ';
}
