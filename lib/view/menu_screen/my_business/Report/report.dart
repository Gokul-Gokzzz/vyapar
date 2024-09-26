import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/all_transaction/all_transaction.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/cash_flow_report/cash_flow.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/day_book/day_book.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/profit_loss_report/profit_loss_reoprt.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/purchase_report/purchase_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/Transaction/sales_report/sales_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/business_status/bank_statement/bank_statement.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/business_status/discount_report/discount_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/expense_report/expense_Category_report/expense_category_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/expense_report/expense_item_report/expense_item_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/expense_report/expense_transaction_report/expense_transaction.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/loan_report/loan_statement/loan_statement.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/sale_purchase_order/sale_purchase_Transaction/sale_purchasetransaction.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/sale_purchase_order/sale_purchase_order/sale_purchase_order.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/form_no_27eq/form_no_27eq.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/gst_rate_report/gst_rate_report.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/gst_reports/gst_reports.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/tcs_receivable/tcs_receivable.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/tds_payable/tds_payable.dart';
import 'package:vyapar/view/menu_screen/my_business/Report/taxes/tds_receivable/tds_receivable.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Reports'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Action for search
            },
          ),
        ],
        backgroundColor: Colors.blue.shade50,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // First Category - Transaction
          const Text(
            'Transaction',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SaleReport(),
              ),
            );
          }),
          buildSubItem('Purchase Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PurchaseReport(),
              ),
            );
          }),
          buildSubItem('Day Book', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DayBook(),
              ),
            );
          }),
          buildSubItem('All Transactions', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllTransaction(),
              ),
            );
          }),
          buildSubItemWithIcon(
              'Bill Wise Profit', context, Icons.info_outline, () {}),
          buildSubItem('Profit & Loss', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfitAndLossReoprt(),
              ),
            );
          }),
          buildSubItem('Cashflow', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CashFlowReportReport(),
              ),
            );
          }),
          buildSubItemWithIcon(
              'Balance Sheet', context, Icons.info_outline, () {}),

          const SizedBox(height: 30),

          // Second Category - Party Reports
          const Text(
            'Party reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Party Statement', context, () {}),
          buildSubItemWithIcon(
              'Party Wise Profit & Loss',
              context,
              Icons.info_outline,
              color: Colors.yellow,
              () {}),
          buildSubItem('All Parties Report', context, () {}),
          buildSubItem('Party Report by Items', context, () {}),
          buildSubItem('Sale/Purchase by Party', context, () {}),

          const SizedBox(height: 30),

          // Third Category - GST Reports
          const Text(
            'GST repots',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST-1', context, () {}),
          buildSubItem('GST-2', context, () {}),
          buildSubItem('GSTR-3B', context, () {}),
          buildSubItem('GST Transction report', context, () {}),
          buildSubItem('GSTR-9', context, () {}),
          buildSubItem('Sale Summary by HSN', context, () {}),
          buildSubItem('SAC Report', context, () {}),

          //Forth  Category - Item/Stock Reports

          const Text(
            'Item/Stock reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Stock Summary Report', context, () {}),
          buildSubItem('Item Report by Party ', context, () {}),
          buildSubItem('Item Wise Profit & Loss', context, () {}),
          buildSubItem('Low Stock Summary Report', context, () {}),

          buildSubItem('Item Detail Report', context, () {}),
          buildSubItem('Stock Detail Report', context, () {}),
          buildSubItem('Sale/Purchase By Item Category', context, () {}),
          buildSubItem('Stock summary By Item Category', context, () {}),
          buildSubItemWithIcon(
              'Item Batch Report', context, Icons.info_outline, () {}),
          buildSubItemWithIcon(
              'Item Serial Report', context, Icons.info_outline, () {}),
          buildSubItem('Item Wise Discount', context, () {}),
          const SizedBox(height: 30),

          //Fifth  Category -  Business status

          const Text(
            'Business status',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Bank Statement', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BankStatement(),
              ),
            );
          }),
          buildSubItem('Discount Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiscountReport(),
              ),
            );
          }),

          const SizedBox(height: 30),

          //Sixth  Category -  Taxes

          const Text(
            'Taxes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('GST Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GstReportPage(),
              ),
            );
          }),
          buildSubItem('GST Rate Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GstRateReport(),
              ),
            );
          }),
          buildSubItem('Form No. 27EQ', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormNo27EQScreen(),
              ),
            );
          }),
          buildSubItem('TCS Receivable', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TcsReceivable(),
              ),
            );
          }),

          buildSubItem('TDS Payable', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TdsPayable(),
              ),
            );
          }),
          buildSubItem('TDS Receivable', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TdsReceivable(),
              ),
            );
          }),

          const SizedBox(height: 30),

          //Seventh Category -  Expense report

          const Text(
            'Expense report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Expense Transaction Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpenseTransaction(),
              ),
            );
          }),
          buildSubItem('Expense Category Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpenseCategoryReport(),
              ),
            );
          }),
          buildSubItem('Expense Item Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExpenseItemReport(),
              ),
            );
          }),

          const SizedBox(height: 30),

          //Eight Category -  Sale/Purchase Order report

          const Text(
            'Sale/Purchase Order report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Sale/Purchase Order Transaction Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalePurchaseOrderTransactionReport(),
              ),
            );
          }),
          buildSubItem('Sale/Purchase Order Item Report', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SalePurchaseOrderItemReport(),
              ),
            );
          }),

          const SizedBox(height: 30),

          //Nineth Category -  Loan report

          const Text(
            'Loan Report',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 10),
          buildSubItem('Loan Statement', context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoanStatementScreen(),
              ),
            );
          }),

          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget buildSubItem(String title, BuildContext context, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
    );
  }

  Widget buildSubItemWithIcon(
      String title, BuildContext context, IconData icon, VoidCallback onTap,
      {Color color = Colors.grey}) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(width: 5),
            Icon(icon, size: 16, color: color),
          ],
        ),
      ),
    );
  }
}
