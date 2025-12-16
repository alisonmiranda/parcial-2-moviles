import 'dart:typed_data';

class Foto{
  final String path;
  final String nombre;
  final String description;
  final Uint8List? bytes;

  Foto({
      required this.path,
      required this.nombre,
      required this.description,
      this.bytes,
  });

}