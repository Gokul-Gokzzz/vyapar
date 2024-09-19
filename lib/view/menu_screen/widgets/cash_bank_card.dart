import 'package:flutter/material.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  _CustomPageViewState createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: screenSize.height * 0.32,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  // First Page
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFD97291), // light pink at the left
                          Color.fromARGB(255, 141, 38, 76), // dark pink at the right
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'BIG BUMPER SALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: screenSize.width * .02,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 4.0), // decreased padding
                                decoration: ShapeDecoration(
                                  color: Colors.green[100], // background color
                                  shape: const StadiumBorder(), // Stadium border for shape
                                ),
                                child: const Text(
                                  'HURRY UP!', // heading with "Hurry up" in green
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14, // decreased font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: screenSize.height * .05),
                          const Text(
                            'Now, become a Premium Vyapari and get\nexclusive benefits at up to 60% off.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: screenSize.height * .04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your button action here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: const Text(
                                  'Buy Now',
                                  style: TextStyle(
                                    color: Color(0xFF0033A0), // Replace with your color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Second Page
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(33, 30, 46, 1), // dark grey shades
                          Color.fromRGBO(35, 28, 49, 1),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    color: Colors.orange, // orange background for icon
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Icons.cake_sharp, // crown-like icon
                                      color: Colors.white,
                                    ),
                                    Text(
                                      ' PREMIUM ',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenSize.height * .06),
                          const Text(
                            'Become a premium Vyapari and get exclusive\naccess to most important reports, features, settings\nand grow your business.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the dots
          children: List.generate(2, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 8), // Space between dots
              width: 20, // Width of the stadium shape
              height: 4, // Height of the stadium shape
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? const Color(0xFF0033A0) // Active dot color
                    : Colors.grey[400], // Inactive dot color
                borderRadius: BorderRadius.circular(12), // Makes the shape more like a stadium
              ),
            );
          }),
        ),
      ],
    );
  }
}