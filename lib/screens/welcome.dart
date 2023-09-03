import 'package:ept_frontend/screens/contacts.dart';
import 'package:flutter/material.dart';
import 'package:ept_frontend/screens/login2.dart';
import 'package:flutter/services.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    Widget _gap() => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 42.0,
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
          ),
        );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido a Educar Para Trasformar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
            icon: const Icon(Icons.person),
            label: const Text(
              'Ingresar',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login2()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Secciones',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () => {
                debugPrint('Apretaste el boton de inicio'),
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contacto'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Contacts(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Descargar'),
              onTap: () => {
                //if (usuario)
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const _Bloque1(),
            _gap(),
            const _QuienesSomos(),
            _gap(),
          ],
        ),
      ),
    );
  }
}

class _Bloque1 extends StatelessWidget {
  const _Bloque1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset("assets/images/backgroundBlurred.jpeg").image,
          fit: BoxFit.cover,
        ),
      ),
      // child: BackdropFilter(
      //     filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      //     child: Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: 1000,
      //     )),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.all(80),
          child: Image(
            alignment: Alignment.topRight,
            image: Image.asset('assets/images/logo.png').image,
          ),
        ),
      ),
    );
  }
}

class _QuienesSomos extends StatelessWidget {
  const _QuienesSomos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '¿Quienes somos?',
          style: TextStyle(
            fontSize: 72,
            color: Colors.blue.shade800,
          ),
        ),
        const SizedBox(height: 100, width: 1),
        const Text(
          'Somos una institución de gestión privada de alta calidad educativa, \n'
          'ubicada en las afuera de la ciudad de Resistencia.',
          style: TextStyle(fontSize: 48),
        ),
        const Text(
          'Inspiramos, desafiamos y empoderamos a todos\n'
          'nuestros alumnos a ser miembros comprometidos\n'
          'y éticos de una comunidad global, para que se\n'
          'conviertan en agentes de cambio conscientes de\n '
          'sí mismos,seguros, innovadores y colaborativos.',
          style: TextStyle(
            //fontFamily:
            fontSize: 48,
            fontStyle: FontStyle.italic,
          ),
        )
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        scale: 1,
      ),
    );
  }
}
