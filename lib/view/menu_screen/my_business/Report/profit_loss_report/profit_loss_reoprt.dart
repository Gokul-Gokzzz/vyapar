import 'package:flutter/material.dart';

class ProfitAndLossReoprt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profit And Loss Report', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_on, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Filter Row
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text(
                      "This Month",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    ),
                    VerticalDivider(thickness: 2, color: Colors.grey),
                    SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Gross Profit', 'RS 10.00', isPositive: true),
                  _buildStatCard('Net Profit', '₹ 10.00', isPositive: true),
                ],
              ),
              SizedBox(height: 12),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the box
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // How much the shadow spreads
                      blurRadius: 6, // Blurring of the shadow
                      offset: Offset(0, 3), // Changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header row for Particulars and Amount
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Particulars',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Amount',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Divider(),

                      // List of Particulars and Amounts
                      _buildParticularRow('Sale (+)', '₹ 10,010.00',
                          isPositive: true),
                      _buildParticularRow('Sale FA (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow(
                          'Cr. Note/Sale Return (-)', '₹ 10,000.00',
                          isPositive: false),
                      _buildParticularRow('Purchase (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Purchase FA (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow(
                          'Dr. Note/Purchase Return (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('Payment Out Discount (+)', '₹ 0.00',
                          isPositive: true),

                      SizedBox(height: 10),
                      Divider(),
                      // Stocks Section
                      Text(
                        'Stocks',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Opening Stock (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Closing Stock (+)', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('Opening FA Stock (-)', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Closing FA Stock (+)', '₹ 0.00',
                          isPositive: true),

                      //Direct Expense

                      SizedBox(height: 10),

                      Divider(),
                      Text(
                        'Direct Expenses (-)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Direct Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Payment In Discount', '₹ 0.00',
                          isPositive: false),

                      //Tax Payable

                      SizedBox(height: 10),

                      Divider(),
                      Text(
                        'Tax Payable (-)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('GST Payable', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('TCS Payable', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('TDS Payable', '₹ 0.00',
                          isPositive: false),

                      //Tax Receivable

                      SizedBox(height: 10),

                      Divider(),
                      Text(
                        'Tax Receivable (+)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('GST Receivable', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('TCS Receivable', '₹ 0.00',
                          isPositive: true),
                      _buildParticularRow('TDS Receivable', '₹ 0.00',
                          isPositive: true),
                      SizedBox(height: 10),

                      // Divider(),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(color: Colors.green[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Gross Profit ',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              ' ₹ 10.00',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                      //other income
                      SizedBox(height: 10),

                      // Divider(),
                      Text(
                        'Other Income (+)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Income', '₹ 0.00',
                          isPositive: true),
                      //indirect expense
                      SizedBox(height: 10),

                      Divider(),
                      Text(
                        'InDirect Expenses (-)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),

                      _buildParticularRow('Other Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Loan interest Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow(
                          'Loan Processing Fee Expense', '₹ 0.00',
                          isPositive: false),
                      _buildParticularRow('Charge on Loan Expense', '₹ 0.00',
                          isPositive: false),

                      Container(
                        height: 60,
                        decoration: BoxDecoration(color: Colors.green[100]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Net Profit ',
                              style: TextStyle(color: Colors.green),
                            ),
                            Text(
                              ' ₹ 10.00',
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Statistic Card Widget
  Widget _buildStatCard(String title, String value, {bool isPositive = false}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 160, // Adjust width if needed
        height: 60, // Adjust height if needed
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              // textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: isPositive ? Colors.green : Colors.black,
              ),
              // textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Transaction Card Widget
  Widget _buildTransactionCard(String name, String label1, String value1,
      String label2, String value2, String txnType, String date) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
                SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$label1: ',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        Text(value1,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$label2: ',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                        Text(value2,
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
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
                Text(txnType,
                    style: TextStyle(fontSize: 12, color: Colors.black)),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.black)),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParticularRow(String title, String amount,
      {bool isPositive = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12,
              color: isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
