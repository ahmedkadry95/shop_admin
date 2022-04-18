import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shop_admin/app/home/model/product_model.dart';
import 'package:shop_admin/base_controller.dart';
import 'package:shop_admin/enums/screen_state.dart';
import 'package:shop_admin/locator.dart';
import 'package:shop_admin/services/navigation_service.dart';
import 'package:uuid/uuid.dart';

class HomeController extends BaseController {
  File? _photo;
  final ImagePicker _picker = ImagePicker();
  var uuid = const Uuid();
  var navigation = locator<NavigationService>();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  CollectionReference exclusiveOffer =
      FirebaseFirestore.instance.collection('exclusive_offer');
  String? imageUrl;
  String? randomId;

  createRandomId() {
    randomId = uuid.v4();
    print(randomId);
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController measurementUnitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController storageController = TextEditingController();

  ProductModel productModel = ProductModel();

  uploadBanner() async {
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

  pickExclusiveOfferImage(context) async {
    //pick file
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      var imageName = basename(pickedFile.path);
      var bannerRef =
          FirebaseStorage.instance.ref('exclusive_offer/$imageName');
      await bannerRef.putFile(_photo!);
      imageUrl = await bannerRef.getDownloadURL();
      print('imageUrl : ${imageUrl}');
      AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        showCloseIcon: true,
        title: 'Succes',
        desc: 'image add ',
        btnOkOnPress: () {},
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: (type) {},
      ).show();
    }
  }

  addProduct({
    required String title,
    required String description,
    required String category,
    required String measurementUnit,
    required double price,
    required double quantity,
    required double storage,
  }) async {
    exclusiveOffer
        .doc(randomId)
        .set(
          productModel.toJson(
            title: title,
            description: description,
            image: imageUrl.toString(),
            measurementUnit: measurementUnit,
            price: price,
            quantity: quantity,
            storage: storage,
            category: category,
            id: randomId,
          ),
        )
        .then((value) async {
      await clearTextFields();
      print("Product Added");
    }).catchError((error) => print("Failed to add user: $error"));
  }

  clearTextFields() {
    titleController.clear();
    descriptionController.clear();
    categoryController.clear();
    measurementUnitController.clear();
    priceController.clear();
    quantityController.clear();
    storageController.clear();
    setState(ViewState.idel);
  }
}
