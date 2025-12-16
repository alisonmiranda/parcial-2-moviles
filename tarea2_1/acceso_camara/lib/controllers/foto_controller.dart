import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/foto.dart';
import '../providers/foto_provider.dart';


class FotoController{
  final FotoProvider provider;
  final ImagePicker picker = ImagePicker();

  FotoController(this.provider);

  //metofo para tomar la foto
  Future<void> tomarFoto(BuildContext context) async{
    final XFile? foto = await picker.pickImage(source: ImageSource.camera);


    //si la foto no es null
    if(foto != null){
      final bytes = await foto.readAsBytes();
      provider.agregarFoto(
        Foto(
          path: foto.path,
          nombre: "Foto: ${provider.fotos.length + 1}", //voy atrer nombre automatico segun la foto que se agreggue
          description: "Foto guardada...",
          bytes: bytes,
        ),
      );
      
      //notificacion local
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Foto guardada de forma correcta"),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }


}