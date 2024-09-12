// import 'package:flutter/material.dart';
// import 'package:vyapar/view/dashboard/dashboard_screen.dart';
// import 'package:vyapar/view/home.dart';
// import 'package:vyapar/view/item_screen/item_screen.dart';
// import 'package:vyapar/view/menu_screen/menu_screen.dart';

// class BottomScreen extends StatefulWidget {
//   @override
//   _BottomScreenState createState() => _BottomScreenState();
// }

// class _BottomScreenState extends State<BottomScreen> {
//   int _currentIndex = 0; // Index of the currently selected page

//   // List of pages to navigate to
//   final List<Widget> _pages = [
//     HomeScreen(), // Replace with actual pages
//     DashboardScreen(),
//     ItemScreen(),
//     MenuScreen(),
//   ];

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Icon(
//               Icons.business,
//               size: 30,
//               color: Colors.blue,
//             ), // App icon
//             SizedBox(width: 10),
//             Text('XianInfoTech', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//         actions: [
//           IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
//           IconButton(icon: Icon(Icons.settings), onPressed: () {}),
//         ],
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//       ),
//       body: _pages[_currentIndex], // Display the selected page
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: _onTabTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard), label: 'DASHBOARD'),
//           BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'ITEMS'),
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
//         ],
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.grey,
//       ),
//     );
//   }
// }
