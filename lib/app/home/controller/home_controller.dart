import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/locator.dart';
import 'package:shop_admin/routs/routs_names.dart';
import 'package:shop_admin/services/navigation_service.dart';

class HomeController extends BaseController {
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  var navigation = locator<NavigationService>();

  uploadImage() async {
    //pick file
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      var imageName = basename(pickedFile.path);
      print('_photo');
      print(_photo);
      // upload image to fire storage
      var bannerRef = FirebaseStorage.instance.ref('banner/$imageName');
      await bannerRef.putFile(_photo!);
      Future<String>? imageUrl = bannerRef.getDownloadURL();
      print('imageUrl $imageUrl');
    } else {
      print('No image selected.');
    }
  }

  s() async {
    await FirebaseAuth.instance.signOut();
    navigation.navigateTo(RouteName.splash);
  }

  getBanner() async {
    var ref = await FirebaseStorage.instance.ref('banner/').list();
    ref.items.forEach((element) async {
      var url = await element.getDownloadURL();
      print(url);
      print('========================');
    });
  }
}
