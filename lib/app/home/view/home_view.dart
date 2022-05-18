import 'package:flutter/material.dart';
import 'package:shop_admin/app/home/controller/home_controller.dart';
import 'package:shop_admin/base_view.dart';

import '../../../utils/colors.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              body: Center(
                child: controller.pages[controller.currentIndex],
              ),
              bottomNavigationBar: Material(
                elevation: 60,
                clipBehavior: Clip.hardEdge,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  unselectedItemColor: Colors.black,
                  selectedItemColor: mainColor,
                  showUnselectedLabels: false,
                  currentIndex: controller.currentIndex,
                  selectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  onTap: (index) {
                    controller.changeNavBarIndex(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded),
                      label: 'Shop',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.manage_search_rounded),
                      label: 'Explore',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// class HomeView extends StatelessWidget {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<HomeController>(
//       onModelReady: (controller) async {
//         // controller.createRandomId();
//       },
//       builder: (context, controller, child) {
//         return Scaffold(
//           backgroundColor: backgroundColor,
//           // body: Stack(
//           //   children: [
//           //     backgroundMask(),
//           //     ListView(
//           //       padding: const EdgeInsets.symmetric(horizontal: 25),
//           //       children: [
//           //         heightSpace(40),
//           //         centerLogo(),
//           //         heightSpace(20),
//           //         Card(
//           //           elevation: 10,
//           //           child: Column(
//           //             children: [
//           //               heightSpace(15),
//           //               blackTitle2('add banner'),
//           //               heightSpace(20),
//           //               button('add').onTap(() {
//           //                 controller.uploadBanner();
//           //               }),
//           //               heightSpace(15),
//           //             ],
//           //           ),
//           //         ),
//           //         heightSpace(30),
//           //         Card(
//           //           elevation: 10,
//           //           child: Padding(
//           //             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//           //             child: Column(
//           //               children: [
//           //                 heightSpace(15),
//           //                 blackTitle2('add Product'),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.titleController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add  title',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.descriptionController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add  description',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.categoryController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add  category',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.measurementUnitController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add  measurement Unit',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.priceController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add price',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.quantityController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add quantity',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 TextFormField(
//           //                   controller: controller.storageController,
//           //                   decoration: const InputDecoration(
//           //                     hintText: 'add storage',
//           //                   ),
//           //                 ),
//           //                 heightSpace(20),
//           //                 Row(
//           //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //                   children: [
//           //                     button('pick image').onTap(
//           //                       () {
//           //                         controller.pickProductImage(context);
//           //                       },
//           //                     ),
//           //                     button('add ').onTap(() {
//           //                       controller.addProduct(
//           //                         title: controller.titleController.text,
//           //                         description:
//           //                             controller.descriptionController.text,
//           //                         category: controller.categoryController.text,
//           //                         measurementUnit:
//           //                             controller.measurementUnitController.text,
//           //                         price: double.parse(
//           //                             controller.priceController.text),
//           //                         quantity: double.parse(
//           //                             controller.quantityController.text),
//           //                         storage: double.parse(
//           //                             controller.quantityController.text),
//           //                         context: context,
//           //                       );
//           //                     }),
//           //                   ],
//           //                 ),
//           //                 heightSpace(15),
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ],
//           //     )
//           //   ],
//           // ),
//           body: Center(
//             child: controller.pages[controller.currentIndex],
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             unselectedItemColor: Colors.black,
//             selectedItemColor: mainColor,
//             showUnselectedLabels: false,
//             currentIndex: controller.currentIndex,
//             selectedLabelStyle:
//                 const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//             onTap: (index) {
//               controller.changeNavBarIndex(index);
//             },
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home_rounded),
//                 label: 'Shop',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.manage_search_rounded),
//                 label: 'Explore',
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
