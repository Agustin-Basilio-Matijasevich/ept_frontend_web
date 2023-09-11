import 'package:comment_box/comment/test.dart';
import 'package:ept_frontend/screens/about.dart';
import 'package:ept_frontend/screens/comment_section.dart';
import 'package:ept_frontend/screens/contacts.dart';
import 'package:ept_frontend/screens/download.dart';
import 'package:ept_frontend/screens/enrolment.dart';
import 'package:ept_frontend/screens/photo_gallery.dart';
import 'package:ept_frontend/screens/test_screen.dart';
import 'package:ept_frontend/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:ept_frontend/screens/login.dart';
import 'package:ept_frontend/screens/Educative_Levels.dart';
import '../widgets/login_button.dart';
//import 'package:flutter/services.dart';

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
        backgroundColor: Colors.lightBlue.shade300,
        foregroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          LoginButton(),
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
              leading: const Icon(Icons.question_mark),
              title: const Text('¿Quienes somos?'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => AboutUs(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Niveles Educativos'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Educative_Levels(),
                  ),
                ),
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
              leading: const Icon(Icons.comment),
              title: const Text('Comentarios'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const CommentSection(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Descargar'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const DownloadSection(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.browse_gallery),
              title: const Text('Galería'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Gallery(),
                  ),
                ),
              },
            ),
            ListTile(
              leading: const Icon(Icons.article_outlined),
              title: const Text('Inscripción'),
              onTap: () => {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => EnrolmentForm(),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset("assets/images/backgroundWhiteBlur.jpeg")
                      .image,
                  fit: BoxFit.cover,
                  alignment: AlignmentDirectional.bottomCenter,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  _Logo(),
                  _CompanyDescription(),
                ],
              ),
            ),
            const PageFooter(),
          ],
        ),
      ),
    );
  }
}

class _CompanyDescription extends StatelessWidget {
  const _CompanyDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Inspiramos, desafiamos y empoderamos a todos\n'
      'nuestros alumnos a ser miembros comprometidos\n'
      'y éticos de una comunidad global, para que se\n'
      'conviertan en agentes de cambio conscientes de\n '
      'sí mismos,seguros, innovadores y colaborativos.',
      style: TextStyle(
        //fontFamily:
        color: Color(0xFF0c245e),
        fontSize: 40,
        //fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
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
