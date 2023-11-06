import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ept_frontend/models/usuario.dart';

enum DownloadStatus {
  notDownloaded,
  fetchingDownload,
  downloading,
  downloaded,
}

class NewDownloadSection extends StatefulWidget {
  const NewDownloadSection({super.key});

  @override
  State<NewDownloadSection> createState() => _NewDownloadSectionState();
}

class _NewDownloadSectionState extends State<NewDownloadSection> {
  List<Widget> availableDownloads = [];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    Usuario usuario = Provider.of<Usuario>(context);
    double contextHeight = MediaQuery.of(context).size.height;
    double contextWidth = MediaQuery.of(context).size.width;

    List<Widget> widgets = [];

    if ([
      UserRoles.docente,
      UserRoles.estudiante,
      UserRoles.nodocente,
      UserRoles.padre
    ].contains(usuario.rol)) {
      widgets.add(
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
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Descargas'
        ),
      ),
      //ASPECTO ESCRITORIO
      body: contextWidth > 600
      ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widgets
          ),
          const SizedBox(
            height: 1,
            width: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                ),
                child: const Text(
                  'Aplicación Movil',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  _descargarAndroidAPP();
                },
              ),
            ],
          )
        ],
      )
      //ASPECTO MÓVIL
      : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: widgets
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    ),
                    child: const Text(
                      'Aplicación Movil',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    onPressed: () {
                      _descargarAndroidAPP();
                    },
                  ),
                ],
              )
            ]
          ),
        ],
      )
    );
  }
}

class _DownloadButton extends StatelessWidget {
  final String text;
  final DownloadStatus status;
  final Duration transitionDuration;

  const _DownloadButton({
    super.key,
    required this.status,
    required this.text,
    this.transitionDuration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    return Container();
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
