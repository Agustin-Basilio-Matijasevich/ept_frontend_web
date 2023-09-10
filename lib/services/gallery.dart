

import 'package:ept_frontend/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';

class GaleriaIMGService{

  final FirebaseStorage _db = FirebaseStorage.instance;
  final Reference folder = FirebaseStorage.instance.ref(DefaultStorageOption.rootfolder);

  Future<List<Reference>> getGalleryReferences() async {
    try{
      final ListResult result = await folder.child("galeria").listAll();
      return result.items;
    }catch(e){
      return [];
    }
  }

  Future<String?> getObjectURL(Reference ref) async {
    try{
      final String url = await folder.child(ref.fullPath).getDownloadURL();
      return url;
    }catch(e){
      return null;
    }
  }

  Future<List<String>> getGalleryIMGS() async {
    final List<Reference> refs = await getGalleryReferences();
    List<String> imagenes = [];

    if (refs.isEmpty)
      {
        return imagenes;
      }
    else
      {
        for (var ref in refs) {
          final String? url = await getObjectURL(ref);
          if (url != null)
            {
              imagenes.add(url);
            }
        }

        return imagenes;
      }
  }
}
