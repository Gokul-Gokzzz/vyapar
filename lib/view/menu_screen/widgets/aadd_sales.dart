
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:vyapar/view/menu_screen/sales_return/credit_note/add_items.dart';

class AddSaleScreen extends StatefulWidget {
  AddSaleScreen({super.key});

  @override
  _AddSaleScreenState createState() => _AddSaleScreenState();
}

class _AddSaleScreenState extends State<AddSaleScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final ValueNotifier<double> _receivedAmount = ValueNotifier(0.0);
  final ValueNotifier<double> _balanceAmount = ValueNotifier(1000.0);
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);
  final String _date = DateFormat('dd/MM/yyyy').format(DateTime.now());

  void _updateAmounts(String value) {
    final double enteredAmount = double.tryParse(value) ?? 0.0;
    _receivedAmount.value = enteredAmount;
    _balanceAmount.value = 1000.0 - enteredAmount; // Example total amount
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Sale",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          ToggleSwitch(
            minWidth: 70.0,
            cornerRadius: 20.0,
            activeBgColors: [
              [Colors.green[800]!],
              [Colors.red[800]!]
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: ['Credit', 'Cash'],
            onToggle: (index) {
              print('switched to: $index');
            },
            fontSize: 14.0,
            iconSize: 24.0,
          ),
          SizedBox(width: size.width * .1),
          Icon(Icons.settings_outlined),
          SizedBox(width: size.width * .06),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: size.width * .204,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Invoice No:",
                                    style: TextStyle(
                                        color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            color: Colors.grey),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 30,
                                width: 1,
                                color: Colors.grey,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                        color: Colors.grey),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "$_date",
                                        style: TextStyle(
                                            color: Colors.grey),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Customer *',
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * .03,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                floatingLabelStyle: const TextStyle(
                                    color: Colors.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        child: MaterialButton(
                          color: Colors.white,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side:
                                const BorderSide(color: Colors.grey, width: 0),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddItemsScreen()));
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_circle, color: Colors.blue),
                                SizedBox(width: 8),
                                Text("Add Items",
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(width: 8),
                                Text("(Optional)",
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * .02),
                    GestureDetector(
                      onTap: () {
                        _isExpanded.value = !_isExpanded.value;
                      },
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _isExpanded,
                        builder: (context, isExpanded, _) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.all(8.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        onTap: () {
                                          // Expand the container when clicked
                                          _isExpanded.value = true;
                                        },
                                        decoration: InputDecoration(
                                          prefix: Text(
                                            '₹',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (isExpanded) ...[
                                  SizedBox(height: size.height * 0.02),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Received Amount",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.4,
                                        child: TextFormField(
                                          controller: _amountController,
                                          keyboardType: TextInputType.number,
                                          onChanged: (value) {
                                            _updateAmounts(value);
                                          },
                                          decoration: InputDecoration(
                                            prefix: Text(
                                              '₹',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  ValueListenableBuilder<double>(
                                    valueListenable: _balanceAmount,
                                    builder: (context, balance, _) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Balance Due",
                                              style: TextStyle(
                                                  color: Colors.green)),
                                          Text(
                                              "₹ ${balance.toStringAsFixed(2)}",
                                              style: TextStyle(
                                                  color: Colors.green)),
                                        ],
                                      );
                                    },
                                  ),
                                ]
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  height: 50,
                  shape: const RoundedRectangleBorder(),
                  onPressed: () {
                    // No save functionality as Firebase is removed
                  },
                  child: const Text(
                    "Save & New",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    // No save and navigate functionality as Firebase is removed
                  },
                  shape: const RoundedRectangleBorder(),
                  color: Colors.blue,
                  child: const Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.forward,
                    color: Colors.blue,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}