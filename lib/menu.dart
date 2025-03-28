import 'package:flutter/material.dart';
import 'package:nightlyfe/rewards.dart';
import 'package:nightlyfe/assets/widgets/drinkWidget.dart';
import 'package:nightlyfe/services/point_handler.dart';
import 'assets/functionals/pointsDisplay.dart';
import 'assets/functionals/drink_details.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String? selectedBase;

  final List<Map<String, String>> categories = [
    {'name': 'Vodka', 'image': 'lib/assets/images/drinks/vodka.png'},
    {'name': 'Gin', 'image': 'lib/assets/images/drinks/gin.png'},
    {'name': 'Tequila', 'image': 'lib/assets/images/drinks/tequila.png'},
    {'name': 'Whiskey', 'image': 'lib/assets/images/drinks/jack.png'},
    {'name': 'Rum', 'image': 'lib/assets/images/drinks/rum.png'},
    {'name': 'Boring', 'image': 'lib/assets/images/drinks/water.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF292929),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4a0404),
        title: const Text(
          "Menu",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 33,
            fontFamily: 'BebasNeue',
          ),
        ),
        actions: const [
          PointsDisplay(), // DISPLAY POINTS IN MENU
        ],
      ),
      body: selectedBase == null ? _buildCategories() : _buildDrinks(),
    );
  }

  // CATEGORY WIDGET
  Widget _buildCategories() {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: categories.map((category) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedBase = category['name']!.toLowerCase();
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Stack(
                  children: [
                    Image.asset(
                      category['image']!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 15,
                      left: 15,
                      child: Text(
                        category['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BebasNeue',
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // DRINKS WIDGET WITH STICKY BUTTON
  Widget _buildDrinks() {
    List<Map<String, dynamic>> filteredDrinks =
    drinks.where((drink) => drink['base'] == selectedBase).toList();

    return Stack(
      children: [
        Column(
          children: [
            // SCROLLABLE DRINK LIST
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 100), // Space for button
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BACK TO MENU BUTTON
                    Row(
                      children: [
                        FloatingActionButton(
                          mini: true,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            setState(() {
                              selectedBase = null;
                            });
                          },
                          child: const Icon(Icons.arrow_back, color: Colors.black),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBase = null;
                            });
                          },
                          child: const Text(
                            'Back to Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BebasNeue',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // DRINK LIST
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredDrinks.length,
                      itemBuilder: (context, index) {
                        var drink = filteredDrinks[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black54, // Background color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DrinkWidget(
                              base: drink['base'],
                              image: drink['image'],
                              name: drink['name'],
                              traits: List<String>.from(drink['traits']),
                              description: drink['description'],
                              recipe: drink['recipe'],
                              points: drink['points'],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        // FLOATING SOUSAMI BUTTON
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rewards()),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'lib/assets/images/home/sousami-logo.png',
                  width: 67,
                  height: 67,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
