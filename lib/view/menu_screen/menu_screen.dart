import 'package:flutter/material.dart';
import 'package:vyapar/view/menu_screen/payment.dart';
import 'package:vyapar/view/menu_screen/sales_return/sales_return.dart';
import 'package:vyapar/view/menu_screen/widgets/expandable_row.dart';
import 'package:vyapar/view/menu_screen/widgets/carousel_slider.dart';
import 'package:vyapar/view/menu_screen/widgets/cash_bank_card.dart';
import 'package:vyapar/view/menu_screen/widgets/important_card.dart';
import 'package:vyapar/view/menu_screen/widgets/other_card.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  bool _isExpandedSale = false;
  bool _isExpandedPurchase = false;
  bool _isExpandedBackup = false;
  bool _isExpandedUtilities = false;
  bool _isExpandedHelp = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.home_outlined,
          color: Colors.blue,
        ),
        title: const Text('App Title'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
        elevation: 4.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPageView(),

            const SizedBox(height: 20),
            // Container for My Business
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // The size of the shadow
                    blurRadius: 6, // The blur effect of the shadow
                    offset:
                        const Offset(0, 4), // The offset of the shadow (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Business',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      ExpandableRow(
                        icon: Icons.currency_rupee_sharp,
                        text: "Sale",
                        isExpanded: _isExpandedSale,
                        onTap: () {
                          setState(() {
                            _isExpandedSale = !_isExpandedSale;
                            // _isExpandedPurchase = false;
                          });
                        },
                        expandedContent: _isExpandedSale
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubRow(
                                    text: "Sale Invoice",
                                    trailingIcon:
                                        Icons.arrow_forward_ios_outlined,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SaleInvoiceScreen()));
                                    },
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  SubRow(
                                    text: "Payment-In",
                                    trailingIcon:
                                        Icons.arrow_forward_ios_outlined,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AllTransactionScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                   SubRow(
                                      text: "Sale Return(Credit Note)",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined,
                                          onPressed: (){
                                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SaleReturnScreen(),
                                        ),
                                      );
                                          },
                                          ),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text:
                                          "Estimate/Quotaton(Proforma Invoice)",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Sale Order",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Delivery Challan",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                ],
                              )
                            : null,
                      ),
                      ExpandableRow(
                        icon: Icons.shopping_cart_outlined,
                        text: "Purchase",
                        isExpanded: _isExpandedPurchase,
                        onTap: () {
                          setState(() {
                            _isExpandedPurchase = !_isExpandedPurchase;
                            //_isExpandedSale = false; // Close others
                          });
                        },
                        expandedContent: _isExpandedPurchase
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubRow(
                                      text: "Purchase Bills",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Payment Out",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Purchase Return (DebitNote)",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Purchase Oreder",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                ],
                              )
                            : null,
                      ),
                      SimpleRow(
                        icon: Icons.note_alt_outlined,
                        text: 'Expense',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.home_outlined,
                        text: 'My Online Store',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.note_outlined,
                        text: 'Reports',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // The size of the shadow
                    blurRadius: 6, // The blur effect of the shadow
                    offset:
                        const Offset(0, 4), // The offset of the shadow (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cash & Bank',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      SimpleRow(
                        icon: Icons.account_balance_outlined,
                        text: 'Bank Accounts',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.account_balance_wallet_outlined,
                        text: 'Cash In-Hand',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.manage_history_sharp,
                        text: ' Icons.notes',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.playlist_add_circle_outlined,
                        text: 'Loan Account',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.currency_rupee_outlined,
                        text: 'Apply Loan',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // The size of the shadow
                    blurRadius: 6, // The blur effect of the shadow
                    offset:
                        const Offset(0, 4), // The offset of the shadow (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Important Utilities',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      SimpleRow(
                        icon: Icons.sync,
                        text: 'Sync & Share',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.manage_history_sharp,
                        text: 'Manage Companies',
                        onTap: () {},
                      ),
                      ExpandableRow(
                        icon: Icons.settings_backup_restore_outlined,
                        text: "Backup/Restore",
                        isExpanded: _isExpandedBackup,
                        onTap: () {
                          setState(() {
                            _isExpandedBackup = !_isExpandedBackup;
                            //_isExpandedPurchase = false;
                          });
                        },
                        expandedContent: _isExpandedBackup
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubRow(
                                      text: "Auto Backup",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Backup to Phone",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Backup to e-mail",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Restore Backup",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                ],
                              )
                            : null,
                      ),
                      ExpandableRow(
                        icon: Icons.shopping_bag_outlined,
                        text: "Utitities",
                        isExpanded: _isExpandedUtilities,
                        onTap: () {
                          setState(() {
                            _isExpandedUtilities = !_isExpandedUtilities;
                            // _isExpandedPurchase = false; // Close others
                          });
                        },
                        expandedContent: _isExpandedUtilities
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubRow(
                                      text: "Verify my data",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Open Calculator",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Import items",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Import Parties",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Recycle Bin",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Close Financial Year",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                  SizedBox(
                                    height: screenSize.height * 0.02,
                                  ),
                                  const SubRow(
                                      text: "Messages",
                                      trailingIcon:
                                          Icons.arrow_forward_ios_outlined),
                                ],
                              )
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 2, // The size of the shadow
                    blurRadius: 6, // The blur effect of the shadow
                    offset:
                        const Offset(0, 4), // The offset of the shadow (x, y)
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Others',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      SimpleRow(
                        icon: Icons.account_balance_outlined,
                        text: 'Vyapar Premium',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.account_balance_wallet_outlined,
                        text: 'Get Desktop Billing Software',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.view_comfortable_rounded,
                        text: 'Other Products',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.phone_enabled,
                        text: 'Greeting & Offers',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.settings_outlined,
                        text: 'Settings',
                        onTap: () {},
                      ),
                      SimpleRow(
                        icon: Icons.wallet_giftcard_rounded,
                        text: 'Refer & Earn',
                        onTap: () {},
                      ),
                      ExpandableRow(
                        icon: Icons.headset_mic_outlined,
                        text: "Help & Support",
                        isExpanded: _isExpandedHelp,
                        onTap: () {
                          setState(() {
                            _isExpandedHelp = !_isExpandedHelp;
                            _isExpandedPurchase = false;
                          });
                        },
                        expandedContent: _isExpandedHelp
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SubRow(
                                    text: "Customer Care",
                                    trailingIcon:
                                        Icons.arrow_forward_ios_outlined,
                                  ),
                                  SizedBox(height: screenSize.height * 0.02),
                                  const SubRow(
                                    text: "Tutorials",
                                    trailingIcon:
                                        Icons.arrow_forward_ios_outlined,
                                  ),
                                  SizedBox(height: screenSize.height * 0.02),
                                  const SubRow(
                                    text: "Remote Vyabar Support",
                                    trailingIcon:
                                        Icons.arrow_forward_ios_outlined,
                                  ),
                                ],
                              )
                            : null,
                      ),
                      SimpleRow(
                        icon: Icons.star_border_outlined,
                        text: 'Rate This App',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
