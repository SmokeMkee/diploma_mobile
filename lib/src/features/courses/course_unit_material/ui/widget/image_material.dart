import 'dart:convert';

import 'package:flutter/material.dart';

class ImageMaterial extends StatelessWidget {
  const ImageMaterial({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.memory(base64Decode(image)),
      ),
    );
  }
}
