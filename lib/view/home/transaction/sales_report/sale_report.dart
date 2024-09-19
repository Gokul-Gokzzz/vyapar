import 'package:flutter/material.dart';

class SaleReportScreen extends StatefulWidget {
  @override
  _SaleReportScreenState createState() => _SaleReportScreenState();
}

class _SaleReportScreenState extends State<SaleReportScreen> {
  String selectedFilter = 'This Month'; 

  void _showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text('Today'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'Today';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Week'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'This Week';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Month'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'This Month';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Quarter'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'This Quarter';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('This Financial Year'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'This Financial Year';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Custom'),
                onTap: () {
                  setState(() {
                    selectedFilter = 'Custom';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        title: Text(
          'Sale Report',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_on, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            // Date Filter Section
            Row(
              children: [
                GestureDetector(
                  onTap: () => _showFilterOptions(context),
                  child: Row(
                    children: [
                      Text(selectedFilter),
                     SizedBox(width: 5),
                      Icon(Icons.keyboard_arrow_down_outlined,color: Colors.blue,),
                    ],
                  ),
                ),
                SizedBox(width: 50),
                IconButton(
                  icon: Icon(Icons.calendar_today, color: Colors.blue),
                  onPressed: () {},
                ),
                Text("01/09/2024"),
                SizedBox(
                  width: 5,
                ),
                Text(" TO "),
                SizedBox(
                  width: 5,
                ),
                Text("30/09/2024"),
                Spacer(),
              ],
            ),
            Divider(),
            SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters Applied :',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_outlined, size: 20),
                  label: Text('Filters'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
           
            Wrap(
              spacing: 8.0,
              children: [
                Chip(
                  label: Text('Txns Type - Sale & Cr. Note'),
                  backgroundColor: Colors.grey[200],
                ),
                Chip(
                  label: Text('Party - All Party'),
                  backgroundColor: Colors.grey[200],
                ),
              ],
            ),
            SizedBox(height: 16),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryCard('No of Txns', '1'),
                _buildSummaryCard('Total Sale', '₹ 10.00'),
                _buildSummaryCard('Balance Due', '₹ 0.00'),
              ],
            ),
            SizedBox(height: 16),
            
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gokul',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'SALE 1',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Text(
                                    '12 SEP, 24',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Amount'),
                                  SizedBox(height: 4),
                                  Text(
                                    '₹ 10.00',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Balance'),
                                  SizedBox(height: 4),
                                  Text(
                                    '₹ 0.00',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .green, // Apply green color only to 0.00 text
                                    ),
                                  ),
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
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, {Color? color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color ?? Colors.blue[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: value == '₹ 0.00'
                    ? Colors.green
                    : Colors.black, // Apply green color conditionally
              ),
            ),
          ],
        ),
      ),
    );
  }
}
