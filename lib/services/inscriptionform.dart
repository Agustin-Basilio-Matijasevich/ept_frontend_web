

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ept_frontend/models/formulario_inscripcion.dart';

class InscriptionFormService{
  final FirebaseFirestore _db = FirebaseFirestore.instance; //Inicializo instancia de firestore

  Future<bool> grabaFormularioInscripcion(FormInscripcion formulario) async {
    try{
      await _db.collection("formularios_inscripcion").add({
          "apellido_alumno": formulario.apellido_alumno,
          "apellido_tutor": formulario.apellido_tutor,
          "año_lectivo": formulario.anio_lectivo,
          "dni_alumno": formulario.dni_alumno,
          "dni_tutor": formulario.dni_tutor,
          "email_tutor": formulario.email_tutor,
          "fecha_nacimiento_alumno": formulario.fecha_nacimiento_alumno.toIso8601String(),
          "nivel": formulario.nivel.toString(),
          "nombre_alumno": formulario.nombre_alumno,
          "nombre_tutor": formulario.nombre_tutor,});
      return true;
    }
    catch (e) {
      return false;
    }
  }
}