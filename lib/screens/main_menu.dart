import 'package:flutter/material.dart';
//import 'package:food_app/widgets/bottomNav.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 238, 238),
          title: const Text(
            'Our Menu',
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 11, 11, 11),
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 255, 179, 0),
            dividerColor: Color.fromARGB(255, 255, 179, 0),
            indicatorColor: Color.fromARGB(255, 255, 179, 0),
            tabs: [
              Tab(text: 'Meals'),
              Tab(text: 'Sides'),
              Tab(text: 'Snacks'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMealsGrid(context),
            _buildSidesGrid(context),
            _buildSnacksGrid(context),
          ],
        ),
      ),
    );
  }

  // Meals Grid
  Widget _buildMealsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Two columns
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: [
        _buildCard(
          context,
          title: 'Combo',
          subtitle: 'Juicy beef patty with cheese',
          price: 'R150',
          imagePath: 'assets/images/combo1.jpeg',
        ),
        _buildCard(
          context,
          title: 'Taco de carnitas',
          subtitle: 'Served with veggies',
          price: 'R75',
          imagePath: 'assets/images/taco1.jpg',
        ),
        _buildCard(
          context,
          title: 'Taco de pollo',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R35',
          imagePath: 'assets/images/taco2.jpeg',
        ),
        _buildCard(
          context,
          title: ' Taco de barbacoa',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R45',
          imagePath: 'assets/images/taco4.png',
        ),
        _buildCard(
          context,
          title: 'Taco de birria',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R55',
          imagePath: 'assets/images/taco3.jpg',
        ),
        _buildCard(
          context,
          title: 'Taco de asada',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R65',
          imagePath: 'assets/images/taco5.jpeg',
        ),
      ],
    );
  }

  // Sides Grid
  Widget _buildSidesGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Two columns
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: [
        _buildCard(
          context,
          title: 'Beef Burger',
          subtitle: 'Crispy and golden fries',
          price: 'R30',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Onion Rings',
          subtitle: 'Fried to perfection',
          price: 'R15',
          imagePath: 'assets/images/side1.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/side2.jpeg',
        ),
        _buildCard(
          context,
          title: 'Fried Wings',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R45',
          imagePath: 'assets/images/side3.jpeg',
        ),
        _buildCard(
          context,
          title: 'Salad',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R20',
          imagePath: 'assets/images/side4.jpg',
        ),
        _buildCard(
          context,
          title: 'Mashed Potato',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R18',
          imagePath: 'assets/images/side5.jpeg',
        ),
      ],
    );
  }

  // Snacks Grid
  Widget _buildSnacksGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Two columns
      padding: const EdgeInsets.all(8.0),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: [
        _buildCard(
          context,
          title: 'Chicken Nuggets',
          subtitle: 'Crispy chicken bites',
          price: 'R30',
          imagePath: 'assets/images/snack1.jpeg',
        ),
        _buildCard(
          context,
          title: 'Waffles',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/snack2.jpg',
        ),
        _buildCard(
          context,
          title: 'Banana Desert',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R15',
          imagePath: 'assets/images/snack3.jpeg',
        ),
        _buildCard(
          context,
          title: 'Chips',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R10',
          imagePath: 'assets/images/snack4.jpg',
        ),
        _buildCard(
          context,
          title: 'Cake',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R29',
          imagePath: 'assets/images/snack5.jpeg',
        ),
        _buildCard(
          context,
          title: 'Pudding',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R60',
          imagePath: 'assets/images/snack6.jpeg',
        ),
      ],
    );
  }

  // Reusable Card Widget
  Widget _buildCard(BuildContext context,
      {required String title,
      required String subtitle,
      required String price,
      required String imagePath}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centers content vertically
          crossAxisAlignment:
              CrossAxisAlignment.center, // Centers content horizontally
          children: [
            // Circular Image
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            // Subtitle
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 8),
            // Price and Like Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border,
                      color: Color.fromARGB(255, 244, 190, 54)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Liked $title!',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(255, 207, 170, 3),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
