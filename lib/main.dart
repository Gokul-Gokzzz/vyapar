import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vyapar/controller/home_controller/home_controller.dart';
import 'package:vyapar/view/dashboard/dashboard_screen.dart';
import 'package:vyapar/view/home/home.dart';
import 'package:vyapar/view/item/item.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/apply_loan/apply_loan.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/bank_account/add_bank_account.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/bank_account/bank_account.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/cash_in_hand/cash_in_hand.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/cheques/cheques.dart';
import 'package:vyapar/view/menu_screen/cash_&_bank/loan_account/loan_account.dart';
import 'package:vyapar/view/menu_screen/menu_screen.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/report.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/add_sale/add_sales.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/delivery_challan/delivery_challan.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/estimate_details/estimate_quotation.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/estimate_details/estimate_details.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/sale_list.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/sales_order/sale-order.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/sales_return/credit_note.dart';

void main() {
  // final Repository repository = Repository() ;
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home:
              // HomeScreen()
              // ReportScreen()
              //  SaleOrderScreen(),
              // AddBankAccount(),
              // Cheques(),
              // LoanAccountPage(),
              // ApplyLoanPage(),
              // CashInHand(),
              // BankAccountsPage(),
              // DashBoardScreen(),
              ItemPage(),
          // MenuScreen(),
        );
      },
    );
  }
}
