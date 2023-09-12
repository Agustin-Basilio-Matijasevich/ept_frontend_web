import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Educative_Levels extends StatelessWidget {
  Educative_Levels({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    Color myColor = Color(0xfff04222);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
        title: Text(
          'Niveles educativos',
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Nivel Inicial',
                    style: TextStyle(
                      fontSize: 24,
                      color: myColor,
                    ),
                  ),
                  ImageSlideshow(
                    isLoop: true,
                    autoPlayInterval: 3000,
                    initialPage: 0,
                    width: 350,
                    height: 200,
                    children: [
                      Image.asset(
                        'assets/images/niveles/inicial01.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/inicial02.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/inicial03.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Nivel Primario',
                    style: TextStyle(
                      fontSize: 24,
                      color: myColor,
                    ),
                  ),
                  ImageSlideshow(
                    isLoop: true,
                    autoPlayInterval: 3000,
                    initialPage: 0,
                    width: 350,
                    height: 200,
                    children: [
                      Image.asset(
                        'assets/images/niveles/primario01.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/primario02.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/primario03.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Nivel Secundario',
                    style: TextStyle(
                      fontSize: 24,
                      color: myColor,
                    ),
                  ),
                  ImageSlideshow(
                    isLoop: true,
                    autoPlayInterval: 3000,
                    initialPage: 0,
                    width: 350,
                    height: 200,
                    children: [
                      Image.asset(
                        'assets/images/niveles/secundario01.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/secundario02.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/niveles/secundario03.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
