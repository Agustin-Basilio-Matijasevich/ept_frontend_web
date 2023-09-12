import 'package:flutter/material.dart';

import '../models/noticia.dart';
import '../services/news.dart';

class NewsSection extends StatelessWidget {
  const NewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Noticia> a = await NewsService().getNoticias();
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: contextWidth,
          height: contextHeight,
          child: Container(
            width: contextWidth > 800 ? 800 : contextWidth,
            child: FutureBuilder(
              future: NewsService().getNoticias(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!snapshot.hasData) {
                  return const Center(
                    child: Center(
                      child: Text('Aun no hay noticias'),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'ERROR',
                    ),
                  );
                } else {
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: snapshot.data!.map((element) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
                          decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            children: [
                              // Titulo
                              Text(
                                element.titulo,
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              // Cuerpo
                              Text(
                                softWrap: true,
                                element.contenido,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              SizedBox(height: 10),
                              SizedBox(
                                width: contextWidth,
                                child: Text(
                                  element.autor,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
