import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  List<Image> images = [
    Image.network('https://i.imgur.com/KX9y4aS.jpeg'),
    Image.network('https://i.imgur.com/fStNDa9.jpeg'),
    Image.network('https://i.imgur.com/oV2RFkL.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              height: (contextHeight > 400) ? (contextHeight - 400) / 2 : 0,
              width: contextWidth,
              child: const Text(
                'Galeria del colegio',
                style: TextStyle(
                  fontFamily: '',
                  fontSize: 72,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_GalleryWidget(images: images)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [_Gap()],
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryWidget extends StatelessWidget {
  final List<Image> images;

  const _GalleryWidget({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    return Container(
      height: contextHeight < 400 ? contextHeight : 400,
      width: contextWidth < 800 ? contextWidth : 800,
      child: CarouselSlider.builder(
        itemCount: images.length,
        options: CarouselOptions(
          height: contextHeight < 400 ? contextHeight : 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          child: Image(
            image: images[itemIndex].image,
          ),
        ),
      ),
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap({super.key});

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: contextWidth,
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade600),
        width: contextWidth,
        height: 5,
      ),
    );
  }
}
