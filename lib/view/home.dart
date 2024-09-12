import 'package:flutter/material.dart';
import 'package:vyapar/view/dashboard/dashboard_screen.dart';
import 'package:vyapar/view/item_screen/item_screen.dart';
import 'package:vyapar/view/menu_screen/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Index of the currently selected page

  // List of pages to navigate to
  final List<Widget> _pages = [
    HomePage(), // Replace with actual pages
    DashBoardScreen(),
    ItemScreen(),
    MenuScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.business,
              size: 30,
              color: Colors.blue,
            ), // App icon
            SizedBox(width: 10),
            Text('XianInfoTech', style: TextStyle(fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'DASHBOARD'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'ITEMS'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Dummy pages for demonstration
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Transaction Details"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                child: Text("Party Details"),
              ),
            ],
          ),
        ),
        // Quick Links Section
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  quickLinkItem(Icons.flash_on, '60% OFF'),
                  quickLinkItem(Icons.add, 'Add Txn'),
                  quickLinkItem(Icons.note, 'Sale Report'),
                  quickLinkItem(Icons.more_horiz, 'Show All'),
                ],
              ),
            ),
          ),
        ),
        // Sales Card
        Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Leading Section with Name, Sale, Total and Balance
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gokul",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Chip(
                      label: Text("SALE"),
                      backgroundColor: Colors.green[100],
                      labelStyle: TextStyle(fontSize: 10),
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total'),
                            Text('₹ 10.00'),
                          ],
                        ),
                        SizedBox(width: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance'),
                            Text('₹ 0.00'),
                          ],
                        ),
                        Icon(
                          Icons.print_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.turn_right,
                          size: 30,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.more_vert_outlined,
                          size: 30,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                // Trailing Section with Date and ID
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('#1', style: TextStyle(color: Colors.grey)),
                    Text('12 Sep, 24', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ),
        // Add New Sale Button
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text("Add New Sale"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: Size(double.infinity, 50), // Full width button
            ),
          ),
        ),
      ],
    );
  }

  Widget quickLinkItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6), // Padding around the icon
          decoration: BoxDecoration(
            color: Colors.blue[100], // Background color for the icon
            borderRadius: BorderRadius.circular(
                8), // Rounded corners for the square background
          ),
          child:
              Icon(icon, size: 30, color: Colors.blue), // Icon size and color
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
