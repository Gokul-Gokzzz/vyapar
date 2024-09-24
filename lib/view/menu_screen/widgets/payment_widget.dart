import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/widgets/widget.dart';
// Custom widget for zig-zag divider

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Payment-In"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          SizedBox(
            width: size.width * .04,
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
                  _buildReceiptInfoSection(size),
                  SizedBox(height: size.height * .02),
                  _buildCustomerInputSection(size),
                  SizedBox(height: size.height * .02),
                  _buildAmountSection(size),
                ],
              ),
            ),
            _buildBottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildReceiptInfoSection(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildColumnInfo("Receipt No.", "7"),
              SizedBox(
                height: size.height * .03,
                child: const VerticalDivider(color: Colors.grey),
              ),
              _buildColumnInfo("Date", "17/09/2024"),
            ],
          ),
          const Divider(),
          const Row(
            children: [
              Text("Firm Name:",
                  style: TextStyle(color: Colors.grey, fontSize: 17)),
              Text(" Xianinfotech LLP",
                  style: TextStyle(color: Colors.black, fontSize: 17)),
              Spacer(),
              Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColumnInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        Row(
          children: [
            Text(value, style: const TextStyle(color: Colors.black)),
            const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomerInputSection(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          _buildTextInputField(label: 'Customer Name *'),
          SizedBox(height: size.height * .03),
          _buildTextInputField(label: 'Billing Name (Optional)'),
          SizedBox(height: size.height * .03),
          _buildTextInputField(label: 'Phone Number'),
        ],
      ),
    );
  }

  Widget _buildTextInputField({required String label}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: const TextStyle(color: Colors.blue),
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

  Widget _buildAmountSection(Size size) {
    return Container(
      height: size.height * .19,
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Received',
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: size.height * .03),
          const Row(
            children: [
              Text(
                "Total Amount",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "100000",
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Zig-zag divider
          ClipPath(
            clipper: ZigzagClipper(),
            child: Container(
              color: Colors.white,
              height: size.height * .03,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MaterialButton(
            height: 50,
            onPressed: () {},
            child: const Text(
              "Save & New",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: MaterialButton(
            height: 50,
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.forward, color: Colors.blue),
        ),
      ],
    );
  }
}
