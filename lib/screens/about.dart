import 'package:flutter/material.dart';
import 'package:ept_frontend/widgets/footer.dart';

class AboutUs extends StatelessWidget {
  AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(title: const Text('¿Quienes Somos?')),
      body: SingleChildScrollView(
        //MOVIL
        child: contextWidth < 600
        ? Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Text(
                      'Somos un centro educativo comprometido con la excelencia académica y el desarrollo integral de nuestros estudiantes. Ofrecemos niveles educativos con jornada extendida, servicios de apoyo estudiantil, enseñanza de idiomas (inglés y portugués), una amplia variedad de deportes, laboratorios de computación, física y química, servicios de transporte, enfermería y un comedor para garantizar un ambiente propicio para el aprendizaje y el crecimiento personal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontFamily:
                        color: Color(0xFF0c245e),
                        fontSize: 16,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 290,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/soccer.png",
                      width: 410,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      'Deportes',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 38, 98, 202),
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  const Text(
                    'Contamos con deportes como el Atletismo, Natación, Fútbol, Artes Marciales, Vóleibol, Danza, Básquet y Ajedréz.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600                   
                    )
                  ),
                ]
              ),
            ),
            Container(
              width: 300,
              height: 290,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "assets/images/swimming_pool.jpg",
                      width: 410,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      'Instalaciones',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 38, 98, 202),
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  const Text(
                    'Poseemos pileta de natación, canchas de fútbol, pista de atletismo, gimnasio cubierto, y laboratorios de computación y química.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ]
              ),
            ),
            Container(
              width: 300,
              height: 290,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "assets/images/english_teaching.jpg",
                      width: 410,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      'Idiomas',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 38, 98, 202),
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  const Text(
                    'Actualmente enseñamos inglés y portugués y estamos dispuestos siempre a sumar más idiomas.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600               
                    )
                  ),
                ]
              ),
            ),
            Container(
              width: 300,
              height: 290,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      "assets/images/student_support.jpg",
                      width: 410,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                    child: Text(
                      'Mas Servicios',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 38, 98, 202),
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                  const Text(
                    'Disponemos de servicios de apoyo estudiantil, servicio de micros de traslado, comedor y enfermería.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ]
              ),
            ),
            const PageFooter()
          ]
        )
        //ESCRITORIO
        : Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 180),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    //CORREGIR ESTO CON AUTO_SIZE_TEXT
                    Text(
                      'Somos un centro educativo comprometido con la excelencia académica\n'
                      'y el desarrollo integral de nuestros estudiantes. Ofrecemos niveles\n'
                      'educativos con jornada extendida, servicios de apoyo estudiantil,\n'
                      'enseñanza de idiomas (inglés y portugués), una amplia variedad\n'
                      'de deportes, laboratorios de computación, física y química,\n'
                      'servicios de transporte, enfermería y un comedor para garantizar\n'
                      'un ambiente propicio para el aprendizaje y el crecimiento personal.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        //fontFamily:
                        color: Color(0xFF0c245e),
                        fontSize: 42,
                        //fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                ),
              ),
              GridView(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 500
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                          "assets/images/soccer.png",
                          width: 460,
                          height: 240,
                          fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                            child: Text(
                            'Deportes',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 38, 98, 202)
                              ),
                            ),
                          ),
                          const Text(
                            'Contamos con deportes como el Atletismo,\n'
                            'Natación, Fútbol, Artes Marciales, Vóleibol,\n'
                            'Danza, Básquet y Ajedréz.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                          "assets/images/swimming_pool.jpg",
                          width: 460,
                          height: 240,
                          fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                            child: Text(
                            'Instalaciones',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 38, 98, 202)
                              ),
                            ),
                          ),
                          const Text(
                            'Contamos con pileta de natación, canchas de\n'
                            'fútbol, pista de atletismo, gimnasio cubierto,\n'
                            'y laboratorios de computación y química.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                          "assets/images/english_teaching.jpg",
                          width: 460,
                          height: 240,
                          fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                            child: Text(
                            'Idiomas',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 38, 98, 202)
                              ),
                            ),
                          ),
                          const Text(
                            'Enseñamos ingles y portugués\n'
                            'y estamos dispuestos siempre\n'
                            'a sumar más idiomas.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                          "assets/images/student_support.jpg",
                          width: 460,
                          height: 240,
                          fit: BoxFit.cover,
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 8),
                            child: Text(
                            'Mas Servicios',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 38, 98, 202)
                              ),
                            ),
                          ),
                          const Text(
                            'Disponemos de Servicios de apoyo\n'
                            'estudiantil, servicio de micros de\n'
                            'traslado, comedor y enfermería.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const PageFooter(),
            ],          
          )
      ),
    );
  }
}
