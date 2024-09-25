import 'package:flutter/material.dart';

class CashFlowReportReport extends StatefulWidget {
  @override
  _CashFlowReportReportState createState() => _CashFlowReportReportState();
}

class _CashFlowReportReportState extends State<CashFlowReportReport>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isMoneyIn = true; // To track which tab is selected

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        isMoneyIn = _tabController.index == 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cashflow Report', style: TextStyle(fontSize: 16)),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Money In'),
            Tab(text: 'Money Out'),
          ],
        ),
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
                      style: TextStyle(color: Colors.black),
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

              // Filters Applied Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Filters Applied:',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  OutlinedButton.icon(
                    icon: Icon(Icons.filter_alt, size: 16),
                    label: Text('Filters',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(padding: EdgeInsets.all(8)),
                  ),
                ],
              ),
              SizedBox(height: 4),

              // Filter Chips
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: Text('0 Value Txn - Show',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    label: Text('Opening/Closing Cash - Consider',
                        style: TextStyle(fontSize: 12)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              SizedBox(height: 12),

              // Statistic Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Closing Cash', '₹ 11.00', isPositive: true),
                  Text('=', style: TextStyle(color: Colors.black)),
                  _buildStatCard('Opening Cash', '₹ 0.00'),
                  Text('+', style: TextStyle(color: Colors.black)),
                  _buildStatCard('Money In', '₹ 11.00', isPositive: true),
                  Text('-', style: TextStyle(color: Colors.black)),
                  _buildStatCard('Money Out', '₹ 0.00'),
                ],
              ),
              SizedBox(height: 17),

              // Money In / Money Out Tabs Content
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // TabBarView that switches between "Money In" and "Money Out"
                    Container(
                      height: 200,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          _buildTransactionList(isMoneyIn: true),
                          _buildTransactionList(isMoneyIn: false),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),

                    // Total Money In/Out Row
                    Container(
                      decoration: BoxDecoration(
                        color: isMoneyIn ? Colors.green[50] : Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            isMoneyIn ? 'Total Money In' : 'Total Money Out',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isMoneyIn ? Colors.green : Colors.red,
                            ),
                          ),
                          Text(
                            isMoneyIn ? '+ ₹ 11.00' : '- ₹ 0.00',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isMoneyIn ? Colors.green : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
        width: 60,
        height: 70,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: isPositive ? Colors.green : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Transaction List Widget
  Widget _buildTransactionList({required bool isMoneyIn}) {
    return Column(
      children: [
        // Headers for the columns
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name & Date',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)),
              Text('Txn Type',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)),
              Text(isMoneyIn ? 'Money In' : 'Money Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black)),
            ],
          ),
        ),
        Divider(),

        // Transaction Details
        _buildTransactionCard(
          'Gokul',
          isMoneyIn ? 'Sale' : 'Purchase',
          isMoneyIn ? '₹ 10.00' : '₹ 0.00',
          '12 SEPT, 24',
        ),
        Divider(),
        _buildTransactionCard(
          'Gokul',
          isMoneyIn ? 'Payment-in' : 'Payment-out',
          isMoneyIn ? '₹ 1.00' : '₹ 0.00',
          '19 SEPT, 24',
        ),
        Divider(),
      ],
    );
  }

  // Transaction Card Widget
  Widget _buildTransactionCard(
      String name, String txnType, String amount, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 12, color: Colors.black)),
                Text(date, style: TextStyle(fontSize: 12, color: Colors.black)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(txnType,
                style: TextStyle(fontSize: 12, color: Colors.black)),
          ),
          Expanded(
            flex: 2,
            child: Text(amount,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 12, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
