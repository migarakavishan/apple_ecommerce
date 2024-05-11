import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  final imgPicker = ImagePicker();
  Future<File?> pickImage() async {
    XFile? pickedImage = await imgPicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return null;
    } else {
      return File(pickedImage.path);
    }
  }
}
