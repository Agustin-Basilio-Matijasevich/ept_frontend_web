import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ept_frontend/services/gallery.dart';

class Gallery extends StatelessWidget {
  Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    List<Image> imagenes;

    void cargarImagenes() async {
      List<String> urls = await GaleriaIMGService().getGalleryIMGS();
      print(urls);
      imagenes = urls
          .map(
            (element) => Image.network(element),
          )
          .toList();
    }

    cargarImagenes();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Galeria de imagenes'),
      ),
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
              children: [
                FutureBuilder(
                    future: GaleriaIMGService().getGalleryIMGS(),
                    initialData: [CircularProgressIndicator()],
                    builder: (context, snapshot) {
                      return Container(
                          height: contextHeight < 400 ? contextHeight : 400,
                          width: contextWidth < 800 ? contextWidth : 800,
                          child: CarouselSlider.builder(
                              itemCount: snapshot.data?.length,
                              options: CarouselOptions(
                                height:
                                    contextHeight < 400 ? contextHeight : 400,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.3,
                                scrollDirection: Axis.horizontal,
                              ),
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (snapshot.hasError) {
                                  return Center(
                                    child: Text('Error: ${snapshot.error}'),
                                  );
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Center(
                                    child: Text('No se encontraron imágenes.'),
                                  );
                                } else {
                                  // Mostrar la lista de imágenes
                                  int itemCount = snapshot.data!.length;

                                  return Container(
                                    child: Image.network(
                                        snapshot.data![itemIndex] as String),
                                  );
                                }
                              }));
                    }),
              ],
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

    () async {};

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
