import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';
import 'package:ept_frontend/screens/under_construction.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const UnderConstruction(),
                    ),
                  );
                },
              ),
            ],
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
                  'Aplicación Escritorio',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const UnderConstruction(),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
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
