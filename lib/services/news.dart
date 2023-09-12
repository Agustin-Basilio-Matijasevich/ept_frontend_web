import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ept_frontend/models/noticia.dart';

class NewsService{

  final FirebaseFirestore _db = FirebaseFirestore.instance; //Inicializo instancia de firestore

  //Get Noticias
  Future<List<Noticia>> getNoticias() async {
    List<Noticia> noticias = [];

    QuerySnapshot coleccion;

    try{
      coleccion = await _db.collection("noticias").get();
    }
    catch (e){
      return noticias;
    }

    for (var noticia in coleccion.docs) {
      String? titulo = noticia.get("titulo");
      String? contenido = noticia.get("contenido");
      String? autor = noticia.get("autor");
      String? imagen = noticia.get("imagen");

      if (imagen != null && imagen.isEmpty)
        {
          imagen = null;
        }

      if (titulo != null && contenido != null && autor != null)
      {
        noticias.add(Noticia(titulo, contenido, autor, imagen));
      }

    }

    return noticias;

  }

}