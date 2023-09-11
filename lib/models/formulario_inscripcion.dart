

enum NivelEducativo{
  inicial,
  primario,
  secundario,
}

class FormInscripcion {
  final String apellido_alumno;
  final String apellido_tutor;
  final String nombre_alumno;
  final String nombre_tutor;
  final String email_tutor;
  final int anio_lectivo;
  final int dni_alumno;
  final int dni_tutor;
  final DateTime fecha_nacimiento_alumno;
  final NivelEducativo nivel;

  FormInscripcion(this.apellido_alumno,this.apellido_tutor,this.nombre_alumno,this.nombre_tutor,this.email_tutor,this.anio_lectivo,this.dni_alumno,this.dni_tutor,this.fecha_nacimiento_alumno,this.nivel);

}