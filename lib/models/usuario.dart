import 'package:firebase_auth/firebase_auth.dart';

enum UserRoles{
  estudiante,
  padre,
  docente,
  nodocente,
  norol,
}

class Usuario {

  //Atributos del usuario
  final String uid; //Identificador Unico
  final UserRoles rol; //Rol del usuario
  final String correo; //Correo del usuario
  final String nombre; //NickName
  final String foto; //Foto de Perfil

  //Constructor recibe usuario del Tipo Firebase y construye el objeto usuario personalizado
  Usuario (User user)
    : uid = user.uid, //Identificador unico de usuario Nunca puede ser nulo
      rol = UserRoles.norol, //Hasta que veamos como guardarlo y obtenerlo
      correo = user.email ?? "anonimo@anonimo.com", //Correo, si no tiene va valor default
      nombre = user.displayName ?? "Anonimo", //Nombre de usuario, si no tiene va valor default
      foto = user.photoURL ?? "assets/images/defaultProfilePhoto.png"; //Foto de perfil, si no tiene va valor default
  //Fin del Constructor

  @override
  String toString(){
    return 'UID: $uid, Rol: $rol, Correo: $correo, Nombre: $nombre, Foto: $foto';
  }

}
