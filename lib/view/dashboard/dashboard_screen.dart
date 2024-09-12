import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sales Overview Card
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Sale Overview (Sep)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "₹ 10.00",
                        style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Text(
                        "100% More Growth This Month",
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(height: 20),
                      // Container(
                      //   height: 200,
                      //   child: LineChart(
                      //     LineChartData(
                      //       gridData: FlGridData(show: false),
                      //       titlesData: FlTitlesData(show: false),
                      //       borderData: FlBorderData(
                      //         show: true,
                      //         border: Border.all(color: Colors.grey, width: 1),
                      //       ),
                      //       lineBarsData: [
                      //         LineChartBarData(
                      //           spots: [
                      //             FlSpot(0, 0),
                      //             FlSpot(1, 1),
                      //             FlSpot(2, 2),
                      //             FlSpot(3, 5),
                      //             FlSpot(4, 10),
                      //           ],
                      //           isCurved: true,
                      //           colors: [Colors.blue],
                      //           dotData: FlDotData(show: true),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Info Card
              Card(
                elevation: 3,
                child: ListTile(
                  leading: Icon(Icons.receipt, size: 40, color: Colors.blue),
                  title: Text("Billing on Vyapar"),
                  subtitle: Text(
                    "Adding a sale or purchase transaction takes less than a minute, easy & quick.",
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Add Sale Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add sale action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Add Sale Now"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
