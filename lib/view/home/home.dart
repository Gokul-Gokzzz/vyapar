import 'package:flutter/material.dart';
import 'package:vyapar/view/dashboard/dashboard_screen.dart';
import 'package:vyapar/view/home/party_details.dart';
import 'package:vyapar/view/home/transaction/transaction.dart';
import 'package:vyapar/view/menu_screen/menu_screen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int _currentIndex = 0; 
  TabController? _tabController;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 245, 252),
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
        bottom: _currentIndex == 0 ? TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Transaction Details'),
            Tab(text: 'Party Details'),
          ],
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.red,
        ) : null, // Show TabBar only on the first page
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          // Page 1 with TabBar
          Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TransactionDetailsTab(), // Content for Transaction Details Tab
                    PartyDetails(),          // Content for Party Details Tab
                  ],
                ),
              ),
            ],
          ),
          // Page 2 with Dashboard content
          DashBoardScreen(), // Your Dashboard Screen
          // Page 3 with Items content
          Center(child: Text('Items Content')),
          // Page 4 with Menu content
          MenuScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'DASHBOARD'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory), label: 'ITEMS'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
        ],
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
