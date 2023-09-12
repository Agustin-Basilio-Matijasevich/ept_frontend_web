

enum CommentPuntaje{
  unaestrella,
  dosestrellas,
  tresestrellas,
  cuatroestrellas,
  cincoestrellas,
}

class Comentario {

  //Atributos del comentario
  final String autor;
  final String contenido;
  final CommentPuntaje puntaje;

  Comentario(this.autor,this.contenido,this.puntaje);

  @override
  String toString(){
    return 'Autor: $autor, Contenido: $contenido, Puntaje: $puntaje';
  }

}