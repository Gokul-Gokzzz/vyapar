
// import 'package:flutter/material.dart';

// class AddTxnScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _showTransactionPopup(context);
//           },
//           child: Text('Add Txn'),
//         ),
//       ),
//     );
//   }

//   void _showTransactionPopup(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               _buildSectionHeader('Sale Transactions'),
//               _buildIconGrid([
//                 _iconWithLabel(Icons.payment, 'Payment-In'),
//                 _iconWithLabel(Icons.assignment_return, 'Sale Return'),
//                 _iconWithLabel(Icons.local_shipping, 'Delivery Challan'),
//                 _iconWithLabel(Icons.receipt, 'Estimate/Quotation'),
//                 _iconWithLabel(Icons.description, 'Proforma Invoice'),
//                 _iconWithLabel(Icons.receipt_long, 'Sale Invoice'),
//                 _iconWithLabel(Icons.add_shopping_cart, 'Sale Order'),
//               ]),
//               _buildSectionHeader('Purchase Transactions'),
//               _buildIconGrid([
//                 _iconWithLabel(Icons.shopping_cart, 'Purchase'),
//                 _iconWithLabel(Icons.payment_outlined, 'Payment-Out'),
//                 _iconWithLabel(Icons.assignment_return, 'Purchase Return'),
//                 _iconWithLabel(Icons.receipt, 'Purchase Order'),
//               ]),
//               _buildSectionHeader('Other Transactions'),
//               _buildIconGrid([
//                 _iconWithLabel(Icons.attach_money, 'Expenses'),
//                 _iconWithLabel(Icons.sync, 'P2P Transfer'),
//               ]),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           Icon(Icons.close),
//         ],
//       ),
//     );
//   }

//   Widget _buildIconGrid(List<Widget> children) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Wrap(
//         spacing: 20,
//         runSpacing: 16,
//         children: children,
//       ),
//     );
//   }

//   Widget _iconWithLabel(IconData icon, String label) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, size: 30, color: Colors.blue),
//         SizedBox(height: 8),
//         Text(label, style: TextStyle(fontSize: 12)),
//       ],
//     );
//   }
// }