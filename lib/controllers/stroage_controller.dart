import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageController {
  static Future<String> uploadImage(File image, String path) async {
    final fileName = basename(image.path);
    final reference = FirebaseStorage.instance.ref('$path/$fileName');
    final uploadTask = reference.putFile(image);
    final snapshot = await uploadTask.whenComplete(
      () {},
    );
    return snapshot.ref.getDownloadURL();
  }
}
