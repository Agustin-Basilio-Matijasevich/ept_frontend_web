

class Noticia {
  final String titulo;
  final String contenido;
  final String autor;
  final String? imagen;

  Noticia(this.titulo,this.contenido,this.autor,this.imagen);

  @override
  String toString() {
    return 'Autor: $autor, Titulo: $titulo, Contenido: $contenido';
  }
}