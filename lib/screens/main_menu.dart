import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Our Menu'),
          bottom: const TabBar(
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
          title: 'Beef Burger',
          subtitle: 'Juicy beef patty with cheese',
          price: 'R50',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Grilled Chicken',
          subtitle: 'Served with veggies',
          price: 'R75',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
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
          title: 'French Fries',
          subtitle: 'Crispy and golden fries',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Onion Rings',
          subtitle: 'Fried to perfection',
          price: 'R20',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
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
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Vegetable stuffed rolls',
          price: 'R25',
          imagePath: 'assets/images/burger.jpg',
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
                  icon: const Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Liked $title!')),
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
