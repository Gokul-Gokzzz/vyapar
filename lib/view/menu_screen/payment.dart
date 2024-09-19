import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/widgets/payment_widget.dart';
// Ensure this import points to the correct path for PaymentScreen

class AllTransactionScreen extends StatelessWidget {
  const AllTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; // Fetch screen size to manage responsiveness

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: const Text(
          "All Transactions",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.picture_as_pdf,
              color: Colors.red,
            ),
            onPressed: () {
              // Implement PDF export functionality here
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.file_copy_rounded,
              color: Colors.green,
            ),
            onPressed: () {
              // Implement file copy functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Firm Name",
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(width: size.width * .03),
                const Flexible(
                  child: Text(
                    "All Firms",
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow
                        .ellipsis, // Prevent overflow if text is too long
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "This month",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: size.width * .03),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
                SizedBox(
                    height: size.height * .04, child: const VerticalDivider()),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: Colors.blue,
                ),
                SizedBox(width: size.width * .03),
                const Flexible(
                  child: Text(
                    "01/09/2024 to 30/09/2024",
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow
                        .ellipsis, // Prevent overflow in the date range
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "Payment-In",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: size.width * .075),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text(
                  "Party Name",
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(width: size.width * .03),
                const Flexible(
                  child: Text(
                    "All parties",
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow
                        .ellipsis, // Prevent overflow for party name
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PaymentScreen()), // Ensure PaymentScreen is correctly defined
          );
        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add_circle_outlined, color: Colors.white),
        label: const Text(
          "Add Payment-In",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}