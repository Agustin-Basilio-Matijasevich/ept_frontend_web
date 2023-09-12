import 'package:ept_frontend/models/usuario.dart';
import 'package:ept_frontend/screens/welcome.dart';
import 'package:ept_frontend/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async
{
  WidgetsFlutterBinding.ensureInitialized(); //Esperamos la inicializacion de los widgets
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform); //Esperamos a establecer la conexion con firebase
  runApp(const MyApp()); //Ejecutamos la aplicacion
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // Widget inicial de la aplicacion
  @override
  Widget build(BuildContext context)
  {
    // La aplicacion se construye siendo hija del stream que escucha el estado del usuario de esa manera tenemos en el contexto de la aplicacion disponible la data de usuario invocando al provider
    return StreamProvider<Usuario?>.value(
      value: AuthService().usuario,
      initialData: null,
      child: MaterialApp(
        title: 'Educar Para Transformar',
        debugShowCheckedModeBanner: false,
        //scrollBehavior: ScrollBehavior(),
        home: Welcome(),
        navigatorKey: navigatorKey,
      ),
    );
  }
}
