import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../models/foto.dart';

class FotoItem extends StatelessWidget{

  final Foto foto;

  const FotoItem({super.key, required this.foto});


  @override
  Widget build(BuildContext context) {
    Widget image;
    if (kIsWeb && foto.bytes != null) {
      image = Image.memory(
        foto.bytes!,
        width: 60,
        fit: BoxFit.cover,
      );
    } else if (!kIsWeb) {
      image = Image.file(
        File(foto.path),
        width: 60,
        fit: BoxFit.cover,
      );
    } else {
      image = Container(
        width: 60,
        height: 60,
        color: Colors.grey[300],
        child: Icon(Icons.broken_image, color: Colors.grey[600]),
      );
    }

    return ListTile(
      leading: image,
      title: Text(foto.nombre),
      subtitle: Text(foto.description),
    );
  }

}
