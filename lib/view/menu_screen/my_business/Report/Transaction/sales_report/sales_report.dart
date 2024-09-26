import 'package:flutter/material.dart';

class SaleReport extends StatelessWidget {
  const SaleReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sale Report', style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.grid_on, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date & Filter Row
              IntrinsicHeight(
                child: Row(
                  children: [
                    const Text(
                      "This Month",
                      style: TextStyle(color: Colors.black),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Colors.black),
                    ),
                    const VerticalDivider(thickness: 2, color: Colors.grey),
                    const SizedBox(width: 15),
                    const Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        SizedBox(width: 4),
                        Text(
                          '01/09/2024 TO 30/09/2024',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 12),

              // Filters Applied Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filters Applied:',
                      style: TextStyle(fontSize: 12, color: Colors.black)),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.filter_alt, size: 16),
                    label: const Text('Filters',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(8)),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // Filter Chips
              Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: const Text('Txns Type - Sale & Cr. Note',
                        style: TextStyle(fontSize: 12, color: Colors.black)),
                    onSelected: (_) {},
                  ),
                  FilterChip(
                    label: const Text('Party - All Party',
                        style: TextStyle(fontSize: 12)),
                    onSelected: (_) {},
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Statistic Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('No of Txns', '3'),
                  _buildStatCard('Total Sale', '₹ 10.00'),
                  _buildStatCard('Balance Due', '₹ 0.00', isPositive: true),
                ],
              ),
              const SizedBox(height: 12),

              // Transaction Cards
              _buildTransactionCard('Gokul', 'Amount', '₹ 10.00', 'Balance',
                  '₹ 0.00', 'SALE 1', '12 SEP, 24'),
              _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                  '₹ 10,000.00', 'SALE 2', '19 SEP, 24'),
              _buildTransactionCard('Gokul', 'Amount', '₹ 10,000.00', 'Balance',
                  '₹ 10,000.00', 'CN 1', '19 SEP, 24'),
            ],
          ),
        ),
      ),
    );
  }

  // Statistic Card Widget
  Widget _buildStatCard(String title, String value, {bool isPositive = false}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 100, // Adjust width if needed
        height: 60, // Adjust height if needed
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: isPositive ? Colors.green : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Transaction Card Widget
  Widget _buildTransactionCard(String name, String label1, String value1,
      String label2, String value2, String txnType, String date) {
    return Card(
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.black)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$label1: ',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                        Text(value1,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$label2: ',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                        Text(value2,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(txnType,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                Text(date,
                    style: const TextStyle(fontSize: 12, color: Colors.black)),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
