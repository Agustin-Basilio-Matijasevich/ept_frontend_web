import 'package:flutter/material.dart';

class NewsBox extends StatelessWidget {
  final String title;
  final String body;
  final Image? attachmentImage;

  const NewsBox({
    super.key,
    required this.title,
    required this.body,
    this.attachmentImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
