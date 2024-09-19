
import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/widgets/aadd_sales.dart';

class SaleInvoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White app bar color
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Sale List',
          style: TextStyle(color: Colors.black), // Title color
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_sharp, color: Colors.grey),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colors.red),
            onPressed: () {
              // PDF action
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade50, // Very light blue at the top
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade50, // Very light blue at the top
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height:
                  screenHeight * .1, // Set a normal height for the container
              width:
                  double.infinity, // Set the width to take full available width
              margin: EdgeInsets.symmetric(
                horizontal: 16.0, // Fixed margin
                vertical: 10.0, // Fixed vertical margin
              ),
              padding: EdgeInsets.all(16.0), // Fixed padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Sale',
                    style: TextStyle(
                      fontSize: 13, // Set a normal text size
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\₹5000', // Replace with dynamic amount if necessary
                    style: TextStyle(
                      fontSize: 13, // Slightly larger text for the amount
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            Spacer(), // Pushes the FAB to the bottom
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: screenHeight * 0.02), // Adjust bottom padding dynamically
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddSaleScreen()));
            },
            backgroundColor: Colors.red,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text('Add Sale',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white)), // Adjust label size
            shape: StadiumBorder(), // Stadium border shape
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}