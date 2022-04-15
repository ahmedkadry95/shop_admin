import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shop_admin/base_controller.dart';

class HomeController extends BaseController {
  File? _photo;
  final ImagePicker _picker = ImagePicker();

  uploadImage() async {
    //pick file
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      var imageName = basename(pickedFile.path);
      print('_photo');
      print(_photo);
      // upload image to fire storage
      var storageRef = FirebaseStorage.instance.ref('banner/$imageName');
      await storageRef.putFile(_photo!);
      Future<String>? imageUrl = storageRef.getDownloadURL();
      print('imageUrl $imageUrl');
    } else {
      print('No image selected.');
    }
  }
}
