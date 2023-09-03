import 'package:flutter/material.dart';
import 'package:ept_frontend/custom_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  Contacts({super.key});

  final String whatsappUrl = 'https://wa.me/5493625171960';
  final String instagramUrl = 'https://www.instagram.com/educarparatra/';

  _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('No se pudo abrir la página: ${uri.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: '+54 362 5171960',
                icon: const Icon(CustomFonts.whatsapp),
                onPressed: () {
                  _launchURL(whatsappUrl);
                },
              ),
              const SizedBox(
                height: 1,
                width: 50,
              ),
              IconButton(
                tooltip: '@educarparatra',
                icon: const Icon(CustomFonts.instagram),
                onPressed: () {
                  _launchURL(instagramUrl);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
