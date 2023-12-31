import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ept_frontend/models/comentario.dart';

class CommentsService {

  final FirebaseFirestore _db = FirebaseFirestore.instance; //Inicializo instancia de firestore

  //Get comentarios
  Future<List<Comentario>> getComentarios() async {
    List<Comentario> comentarios = [];
    QuerySnapshot coleccion;

    try{
      coleccion = await _db.collection("comentarios_publicos").orderBy("fecha", descending: true).get();
    }
    catch (e){
      return comentarios;
    }

    coleccion.docs.forEach((comentario) {
      String? autor = comentario.get("autor");
      String? contenido = comentario.get("contenido");
      CommentPuntaje? puntaje;

      try{
        String? spuntaje = comentario.get("puntaje");
        puntaje = CommentPuntaje.values.firstWhere((element) => element.toString() == spuntaje);
      }
      catch (e){
        puntaje = null;
      }

      if (autor != null && contenido != null && puntaje != null)
        {
          comentarios.add(Comentario(autor, contenido, puntaje));
        }

    });

    return comentarios;

  }

  //Guardar comentario
  Future<bool> grabaComentario(Comentario comentario) async {
    try{
      await _db.collection("comentarios_publicos").add({"autor": comentario.autor,"contenido": comentario.contenido,"puntaje": comentario.puntaje.toString(),"fecha": DateTime.now().toIso8601String()});
      return true;
    }
    catch (e) {
      return false;
    }
  }

}