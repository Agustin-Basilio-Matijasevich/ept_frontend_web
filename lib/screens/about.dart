import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text('¿Quienes Somos?')),
      body: SingleChildScrollView(
        child: Container(
          //rdecoration: BoxDecoration(image: )
          child: Column(
            children: [
              SizedBox(
                width: 1,
                height: (contextHeight - 500) / 2,
              ),
              const Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '¿Quienes Somos?',
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width > 800
                    ? 800
                    : MediaQuery.of(context).size.width,
                child: const Text(
                  'El centro educativo EDUCAR PARA TRANSFORMAR,'
                  ' es una institución de gestión privada de alta calidad educativa,'
                  ' ubicada en las afuera de la ciudad de Resistencia.'
                  ' Inspiramos, desafiamos y empoderamos a todos nuestros alumnos'
                  ' a ser miembros comprometidos y éticos de una comunidad global.'
                  ' para que se conviertan en agentes de cambio conscientes de sí'
                  ' mismos, seguros, innovadores y colaborativos.',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String description = 'Somos una ';
}
