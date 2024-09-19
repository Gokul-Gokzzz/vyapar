import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vyapar/view/menu_screen/sales_return/credit_note/add_items.dart';

class CreditNoteScreen extends StatefulWidget {
  const CreditNoteScreen({super.key});

  @override
  _CreditNoteScreenState createState() => _CreditNoteScreenState();
}

class _CreditNoteScreenState extends State<CreditNoteScreen> {
  int returnNo = 1;
  DateTime selectedDate = DateTime.now();
  final TextEditingController _totalAmountController =
      TextEditingController(text: '₹ 10000.00'); // Controller for total amount
  final TextEditingController _notesController = TextEditingController();
  String selectedPaymentType = 'Cash';
  final List<String> paymentTypes = [
    'Cash',
    'Credit Card',
    'Bank Transfer',
    'UPI'
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Credit Note'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        labelText: 'Return No.',
                        border: OutlineInputBorder(),
                      ),
                      value: returnNo,
                      items: [1, 2, 3, 4, 5]
                          .map(
                            (int value) => DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value'),
                            ),
                          ) 
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          returnNo = newValue!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                          controller: TextEditingController(
                              text: DateFormat('dd/MM/yyyy')
                                  .format(selectedDate)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Customer Name *',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _selectDate(context),
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Invoice Date',
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.calendar_today),
                              ),
                              controller: TextEditingController(
                                  text: DateFormat('dd/MM/yyyy')
                                      .format(selectedDate)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Inv. No.',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Card(
              color: Colors.blue.shade50,
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('#1',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 8),
                        const Text('Web',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Text('₹ 10,000',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('Item Subtotal    1 x 10,000 = ₹ 10,000',
                        style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 4),
                    const Text('Discount (%): 0      ₹ 0',
                        style: TextStyle(fontSize: 16)),
                    const Text('Tax: 0%      ₹ 0',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddItemsScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle, color: Colors.blue),
                    SizedBox(width: 10),
                    Text('Add Items (Optional)',
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 100),
                Expanded(
                  child: TextField(
                    controller: _totalAmountController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                      ),
                      hintText: '₹ ',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Payment Type Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Payment Type',
                border: OutlineInputBorder(),
              ),
              value: selectedPaymentType,
              items: paymentTypes
                  .map((String type) =>
                      DropdownMenuItem<String>(value: type, child: Text(type)))
                  .toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedPaymentType = newValue!;
                });
              },
            ),
            const SizedBox(height: 16),

            // State of Supply Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'State of Supply',
                border: OutlineInputBorder(),
              ),
              value: 'Karnataka',
              items: ['Karnataka', 'Maharashtra', 'Tamil Nadu']
                  .map((String state) => DropdownMenuItem<String>(
                      value: state, child: Text(state)))
                  .toList(),
              onChanged: (newValue) {},
            ),
            const SizedBox(height: 16),

            // Notes Text Field
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Add Note',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ),

            // Save and Cancel Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle Save action
                  },
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
