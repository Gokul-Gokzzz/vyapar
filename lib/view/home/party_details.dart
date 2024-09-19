import 'package:flutter/material.dart';

class PartyDetails extends StatelessWidget {
  const PartyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 245, 252),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Quick Links Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildQuickLinkButton('Import Party', Icons.person),
                  _buildQuickLinkButton('Party Statement', Icons.receipt),
                  _buildQuickLinkButton('Party Settings', Icons.settings),
                  _buildQuickLinkButton('Show All', Icons.arrow_forward),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Party Information Section
            Column(
              children: [
                _buildPartyInfo('Gokul', '12 Sep, 24', '₹ 0'),
                SizedBox(height: 12,),
                _buildPartyInfo('Gokul', '12 Sep, 24', '₹ 0'),
                SizedBox(height: 12,),
                _buildPartyInfo('Gokul', '12 Sep, 24', '₹ 0'),
                SizedBox(height: 12,),
                _buildPartyInfo('Gokul', '12 Sep, 24', '₹ 0'),
              ],
            ),
            SizedBox(height: 20),
            // Add New Party Button
            ElevatedButton.icon(
              onPressed: () {
                // Add your onPressed code here!
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                side: BorderSide(color: Colors.red, width: 2), // Border color
                minimumSize: Size(160, 40), // Button size
              ),
              icon: Icon(Icons.person_add),
              label: Text('Add New Party'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPartyInfo(String name, String date, String amount) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date),
        trailing: Text(
          amount,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickLinkButton(String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
