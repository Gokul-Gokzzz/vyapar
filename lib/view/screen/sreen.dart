// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vyapar/controller/home_controller/home_controller.dart';
// import 'package:vyapar/database/database.dart';
// import 'package:vyapar/view/menu_screen/sales/add_item/add_item.dart';
// import 'package:vyapar/view/menu_screen/sales/add_sale/add_sales.dart';
// import 'package:vyapar/view/menu_screen/sales/sale_list.dart';

// class Screen extends StatelessWidget {
// // final Repository repository = Repository();
//   @override
//   Widget build(BuildContext context) {
//     final HomeController _controller = Get.put(HomeController());
//     return Obx(() {
//       int index = _controller.screenIndex.value;
//       if (index == 0) {
//         return SaleListScreen();
//       } else if (index == 1) {
//         return AddSaleInvoiceScreen();
//       } else if (index == 2) {
//         return AddItemSaleScreen();
//       } else {
//         return Center(child: Text("No Widget found"));
//       }
//       ;
//     });
//   }
// }
