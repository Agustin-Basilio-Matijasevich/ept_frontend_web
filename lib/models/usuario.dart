import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Tipos de roles
enum UserRoles{
  estudiante,
  padre,
  docente,
  nodocente,
  norol,
}

class UsuarioBuilder{
  static Future<Usuario> build(User user) async {

    FirebaseFirestore db = FirebaseFirestore.instance; //Inicializo instancia de firestore

    //Variables para construir el usuario con valores default
    //Propias
    String uid = user.uid;
    String correo = user.email ?? "anonimo@anonimo.com";
    //FireStore
    UserRoles rol = UserRoles.norol;
    String nombre = "Anonimo";
    String foto = "assets/images/defaultProfilePhoto.png";

    //Obtener datos de FireStore
    DocumentSnapshot? userdata;
    try{
      userdata = await db.collection('usuarios').doc(uid).get();
    }
    catch (e)
    {
      userdata = null;
    }
    //Datos de fireStore en variable userdata

    //Si la userdata no es nula tengo que reemplazar los valores default de FireStore
    if (userdata != null)
    {
      if (userdata.get("rol") != null) {
          String srol = userdata.get("rol");
          try{
            rol = UserRoles.values.firstWhere((element) => element.toString() == srol);
          }
          catch (e){
            rol = UserRoles.norol;
          }
        }

      if (userdata.get("nombre") != null){
        nombre = userdata.get("nombre");
      }

      if (userdata.get("foto") != null){
        foto = userdata.get("foto");
      }
    }

    //Si la userdata es nula quedan los valores default

    //Al final construimos el usuario y lo retornamos
    return Usuario(uid, correo, rol, nombre, foto);

  }
}

//Clase Usuario
class Usuario {

  //Atributos del usuario
  final String uid; //Identificador Unico
  final String correo; //Correo del usuario
  final UserRoles rol; //Rol del usuario
  final String nombre; //NickName
  final String foto; //Foto de Perfil

  Usuario(this.uid,this.correo,this.rol,this.nombre,this.foto);

  @override
  String toString(){
    return 'UID: $uid, Rol: $rol, Correo: $correo, Nombre: $nombre, Foto: $foto';
  }

}
