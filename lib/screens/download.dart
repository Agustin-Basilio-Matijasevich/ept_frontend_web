import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ept_frontend/models/usuario.dart';


class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descargas'),
      ),
      body: contextWidth > 600 ?
      //ESCRITORIO 
      SafeArea(
        top: true,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/mobile_download.png',
                      width: 115,
                      height: 60,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  ),
                  child: const Text(
                    'Aplicación Móvil',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    _descargarAndroidAPP();
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/desktop_download.png',
                      width: 115,
                      height: 60,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                  ),
                  child: const Text(
                    'Aplicación Escritorio',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  onPressed: () {
                    _descargarWindowsAPP();
                  },
                ),
              ],
            ),
          ],
        ),
      )
      //MOVIL
      : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/desktop_download.png',
                          width: 115,
                          height: 60,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    ),
                      child: const Text(
                        'Aplicación Escritorio',
                      style: TextStyle(
                      fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      _descargarWindowsAPP();
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/mobile_download.png',
                          width: 115,
                          height: 60,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    ),
                      child: const Text(
                        'Aplicación Móvil',
                      style: TextStyle(
                      fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      _descargarAndroidAPP();
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      )
    );
  }
}

Future<void> _descargarWindowsAPP() async {
  if (!await launchUrl(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/ept-prod-424d6.appspot.com/o/instaladores%2Fwindows%2FEPT%20INSTALLER.zip?alt=media&token=7ee9d3ad-de0a-4dba-a348-833d8fc96036&_gl=1*6w551w*_ga*MTM1NDc2MjA5Mi4xNjkyMzE2ODcx*_ga_CW55HF8NVT*MTY5ODYwNTI0Ni43NC4xLjE2OTg2MDUzMzcuMzguMC4w'))) {
    throw Exception('Could not launch Descargar Windows APP');
  }
}

Future<void> _descargarAndroidAPP() async {
  if (!await launchUrl(Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/ept-prod-424d6.appspot.com/o/instaladores%2Fandroid%2FEPT_INSTALLER.zip?alt=media&token=7a8b34c2-49b5-4386-82eb-1392a9852bd2&_gl=1*w39jmq*_ga*MTM1NDc2MjA5Mi4xNjkyMzE2ODcx*_ga_CW55HF8NVT*MTY5ODcwNDk2Ny43Ni4xLjE2OTg3MDUyNzEuMjguMC4w'))) {
    throw Exception('Could not launch Descargar Android APP');
  }
}
