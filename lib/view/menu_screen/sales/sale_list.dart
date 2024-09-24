import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar/utils/colors.dart';
import 'package:vyapar/view/menu_screen/sales/add_sale/add_sales.dart';

class SaleListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen height using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;

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
            icon: Icon(Icons.search_sharp, color: Colorconst.cGrey),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.picture_as_pdf, color: Colorconst.cRed),
            onPressed: () {
              // PDF action
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue.shade100,
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade50,
              Colors.lightBlue.shade50,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // How wide the shadow spreads
                      blurRadius: 5, // How blurry the shadow is
                      offset: Offset(0, 3), // Offset of the shadow (x, y)
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center vertically
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text(
                        "Total Sale",
                        style: TextStyle(color: Colorconst.cGrey),
                      ),
                      Text(
                        "₹5000.00",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // ListTile Section
              Container(
                height: screenHeight * .17,
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth * .01, vertical: screenWidth * .01),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // Shadow offset
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .01,
                      vertical: screenWidth * .01),
                  title: Row(
                    children: [
                      Text(
                        'Arun',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * .01,
                      ),
                      Container(
                        height: 25,
                        width: 40,
                        decoration: BoxDecoration(
                            // color: Colorconst.cCream,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "UNPAID",
                            style: TextStyle(color: Colors.orange, fontSize: 7),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * .23,
                      ),
                      Text(
                        'Sale #1',
                        style: TextStyle(color: Colorconst.cGrey, fontSize: 10),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹5000.00',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM, yy').format(DateTime.now()),
                            style: TextStyle(
                              color:
                                  Colorconst.cGrey, // Replace with your color
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * .04,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Balance: ₹5000.00',
                            style: TextStyle(
                                color: Colorconst.cGrey, fontSize: 10),
                          ),
                          SizedBox(
                            width: screenWidth * .19,
                          ),
                          Icon(Icons.print, size: 15, color: Colorconst.cGrey),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.share_rounded,
                              size: 15, color: Colorconst.cGrey),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.more_vert,
                              size: 15, color: Colorconst.cGrey),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddSaleInvoiceScreen()));
            },
            backgroundColor: Colorconst.cRed,
            icon: Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add Sale',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
