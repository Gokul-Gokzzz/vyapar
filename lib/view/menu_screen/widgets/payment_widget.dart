import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/widgets/widget.dart';
 // Custom widget for zig-zag divider

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size =
        MediaQuery.of(context).size; // Retrieve screen size for responsive UI

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE), // Light background color
      resizeToAvoidBottomInset:
          false, // Prevents the screen from resizing when the keyboard appears
      appBar: AppBar(
        backgroundColor:
            Colors.white, // White background for AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back button icon
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: const Text("Payment-In"), // Title of the screen
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined), // Settings icon
            onPressed: () {
              // Add your settings functionality here
            },
          ),
          SizedBox(
            width: size.width * .04, // Adds space after the icon
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Section for displaying receipt number, date, and firm name
                  _buildReceiptInfoSection(size),
                  SizedBox(height: size.height * .02), // Space between sections
                  // User input section (Customer Name, Billing Name, Phone Number)
                  _buildCustomerInputSection(size),
                  SizedBox(
                      height: size.height * .02), // Space before next section
                  // Section for amount and zig-zag divider
                  _buildAmountSection(size),
                ],
              ),
            ),
            // Bottom action buttons (Save & New, Save, Forward)
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  // Section displaying receipt number, date, and firm name
  Widget _buildReceiptInfoSection(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.white, // White background for the container
      ),
      child: Column(
        children: [
          const Divider(), // Divider line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumnInfo("Receipt No.", "7"), // Receipt number info
              SizedBox(
                height: size.height * .03,
                child: const VerticalDivider(color: Colors.grey),
              ),
              _buildColumnInfo("Date", "17/09/2024"), // Date info
            ],
          ),
          const Divider(),
          Row(
            children: const [
              Text("Firm Name:",
                  style: TextStyle(color: Colors.grey, fontSize: 17)),
              Text(" Xianinfotech LLP",
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              Spacer(),
              Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to create receipt info columns (e.g., Receipt No., Date)
  Widget _buildColumnInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Row(
          children: [
            Text(value,
                style: const TextStyle(color: Colors.black)),
            const Icon(Icons.keyboard_arrow_down_rounded,
                color: Colors.grey),
          ],
        ),
      ],
    );
  }

  // Section for user input fields (Customer Name, Billing Name, Phone Number)
  Widget _buildCustomerInputSection(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          _buildTextInputField(
              label: 'Customer Name *'), // Customer Name input field
          SizedBox(height: size.height * .03), // Space between inputs
          _buildTextInputField(
              label: 'Billing Name (Optional)'), // Billing Name input field
          SizedBox(height: size.height * .03), // Space between inputs
          _buildTextInputField(
              label: 'Phone Number'), // Phone Number input field
        ],
      ),
    );
  }

  // Helper method to build input fields
  Widget _buildTextInputField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: Colors.grey), // Placeholder color
        floatingLabelStyle: const TextStyle(
            color: Colors.blue), // Label color when focused
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  // Section for amount and total, with zig-zag divider
  Widget _buildAmountSection(Size size) {
    return Container(
      height: size.height * .19,
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white, // White background for amount section
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Received',
              labelStyle: TextStyle(
                  color:
                      Colors.black), // Label color for amount input
            ),
          ),
          SizedBox(
              height:
                  size.height * .03), // Space between input and total amount
          const Row(
            children: [
              Text(
                "Total Amount",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "100000",
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Zig-zag divider
          ClipPath(
            clipper: ZigzagClipper(), // Custom zigzag clipper
            child: Container(
              color: Colors.white,
              height: size.height * .03, // Height of zig-zag divider
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  // Bottom action buttons: Save & New, Save, and Forward
  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MaterialButton(
            height: 50,
            onPressed: () {
              // Add Save & New functionality
            },
            child: const Text(
              "Save & New",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(width: 16), // Space between buttons
        Expanded(
          child: MaterialButton(
            height: 50,
            color: Colors.blue,
            onPressed: () {
              // Add Save functionality
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            // Add Forward functionality
          },
          icon: const Icon(Icons.forward, color: Colors.blue),
        ),
      ],
    );
  }
}