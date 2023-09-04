import 'package:flutter/material.dart';
import 'package:ept_frontend/custom_fonts.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatelessWidget {
  Contacts({super.key});

  final String whatsappUrl = 'https://wa.me/5493625171960';
  final String instagramUrl = 'https://www.instagram.com/educarparatra/';
  final double iconSize = 60;

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
                icon: const Icon(CustomFonts.whatsapp, color: Colors.green),
                iconSize: iconSize,
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
                icon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => const RadialGradient(
                    center: Alignment.topCenter,
                    radius: 1,
                    colors: [Colors.pink, Colors.yellow],
                  ).createShader(bounds),
                  child: const Icon(CustomFonts.instagram),
                ),
                iconSize: iconSize,
                onPressed: () {
                  _launchURL(instagramUrl);
                },
              ),
            ],
          ),
          const SizedBox(
            width: 1,
            height: 50,
          ),
          const SizedBox(
            // decoration: BoxDecoration(
            //   border: DottedBorder
            // ),
            width: 600,
            height: 450,
            child: HtmlWidget(
              '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1719.9785887066685!2d-59.02091957721865!3d-27.44573126706828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sar!4v1693773405065!5m2!1ses-419!2sar" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>',
            ),
          ),

          // <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1719.9785887066685!2d-59.02091957721865!3d-27.44573126706828!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sar!4v1693773405065!5m2!1ses-419!2sar" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        ],
      ),
    );
  }
}
