import 'package:flutter/material.dart';
import 'package:vyapar/view/home/transaction/sales_report/sale_report.dart';

class TransactionDetailsTab extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      name: "Gokul",
      total: "₹ 10.00",
      balance: "₹ 0.00",
      date: "12 Sep, 24",
      id: "#1",
    ),
    Transaction(
      name: "Gokul",
      total: "₹ 10.00",
      balance: "₹ 0.00",
      date: "12 Sep, 24",
      id: "#2",
    ),
    Transaction(
      name: "Gokul",
      total: "₹ 10.00",
      balance: "₹ 0.00",
      date: "12 Sep, 24",
      id: "#3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: const Color.fromARGB(255, 235, 245, 252),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showTransactionPopup(context);
                          },
                          child: quickLinkItem(Icons.add, 'Add Txn'),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SaleReportScreen()),
                              );
                            },
                            child: quickLinkItem(Icons.note, 'Sale Report')),
                        quickLinkItem(Icons.settings, 'Txn Settings'),
                        GestureDetector(
                            onTap: () {
                            showShowMorePopup(context);
                          },
                          child: quickLinkItem(Icons.more_horiz, 'Show All')),
                      ],
                    ),
                  ),
                ),
              ),
              // Transactions List
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Card(
  margin: const EdgeInsets.all(8.0),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Reduced padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Align items centrally
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.name,
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 2), // Reduced height
            Chip(
              label: Text("SALE"),
              backgroundColor: Colors.green[100],
              labelStyle: TextStyle(fontSize: 10),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
            ),
            SizedBox(height: 4), // Reduced height
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total'),
                    Text(transaction.total),
                  ],
                ),
                SizedBox(width: 20), // Reduced width
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance'),
                    Text(transaction.balance),
                  ],
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(transaction.id, style: TextStyle(color: Colors.grey)),
            Text(transaction.date, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10), // Reduced height
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWithLabel(Icons.print_outlined, ''),
                SizedBox(width: 6), // Reduced width
                iconWithLabel(Icons.turn_right, ''),
                SizedBox(width: 6), // Reduced width
                iconWithLabel(Icons.more_vert_outlined, ''),
              ],
            ),
          ],
        ),
      ],
    ),
  ),
);

                  },
                ),
              ),
            ],
          ),
          // Add New Sale Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  _showTransactionPopup(context);
                },
                icon: Icon(Icons.add, size: 20),
                label: Text(
                  "Add New Sale",
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Colors.red, width: 2),
                  minimumSize: Size(160, 40),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showTransactionPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); 
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                buildSectionHeader('Sale Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.payment, 'Payment-In'),
                  iconWithLabel(Icons.assignment_return, 'Sale Return'),
                  iconWithLabel(Icons.local_shipping, 'Delivery Challan'),
                  iconWithLabel(Icons.receipt, 'Estimate/Quotation'),
                  iconWithLabel(Icons.description, 'Proforma Invoice'),
                  iconWithLabel(Icons.receipt_long, 'Sale Invoice'),
                  iconWithLabel(Icons.add_shopping_cart, 'Sale Order'),
                ]),
                Divider(),
                buildSectionHeader('Purchase Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.shopping_cart, 'Purchase'),
                  iconWithLabel(Icons.payment_outlined, 'Payment-Out'),
                  iconWithLabel(Icons.assignment_return, 'Purchase Return'),
                  iconWithLabel(Icons.receipt, 'Purchase Order'),
                ]),
                Divider(),
                buildSectionHeader('Other Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.attach_money, 'Expenses'),
                  iconWithLabel(Icons.sync, 'P2P Transfer'),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  void showShowMorePopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(); 
                      },
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                buildSectionHeader('Sale Transactions'),
                buildIconGrid([
                  iconWithLabel(Icons.comment_bank, 'Bank Account'),
                  iconWithLabel(Icons.book, 'Day Book'),
                  iconWithLabel(Icons.receipt_rounded, 'All Txns Report'),
                  iconWithLabel(Icons.monetization_on_outlined, 'Profit & Loss'),
                  iconWithLabel(Icons.document_scanner, 'Balance Sheet'),
                  iconWithLabel(Icons.receipt_long, 'Billwise PnL'),
                  iconWithLabel(Icons.print_outlined, 'Print Settings'),
                  iconWithLabel(Icons.sms, 'Txn SMS Settings'),
                ]),
               
              ],
            ),
          ),
        );
      },
    );
  }


  Widget buildIconGrid(List<Widget> children) {
    return GridView.count(
      crossAxisCount: 3, 
      shrinkWrap: true, 
      physics:
          NeverScrollableScrollPhysics(), 
      crossAxisSpacing: 20,
      mainAxisSpacing: 16,
      children: children,
    );
  }

  Widget iconWithLabel(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class Transaction {
  final String name;
  final String total;
  final String balance;
  final String date;
  final String id;

  Transaction({
    required this.name,
    required this.total,
    required this.balance,
    required this.date,
    required this.id,
  });
}

Widget quickLinkItem(IconData icon, String label) {
  return Column(
    children: [
      Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 30, color: Colors.white),
      ),
      SizedBox(height: 8),
      Text(label),
    ],
  );
}

Widget iconWithLabel(IconData icon, String label) {
  return Column(
    children: [
      Icon(icon, size: 20, color: Colors.grey),
      SizedBox(height: 4),
      Text(label, style: TextStyle(fontSize: 10)),
    ],
  );
}
