import 'package:flutter/material.dart';
import 'package:food_app/screens/cart.dart';
import 'package:food_app/screens/foodDetails.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final List<Map<String, dynamic>> _cartItems = [];

  void _addToCart(String title, String price, String imagePath) {
    setState(() {
      _cartItems.add({'title': title, 'price': price, 'imagePath': imagePath});
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  void _showCart(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          cartItems: _cartItems,
          onRemove: _removeFromCart,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 239, 148, 11),
          title: const Text(
            'Our Menu',
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            // Cart Icon with Badge
            Stack(
              children: [
                IconButton(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => _showCart(context),
                ),
                if (_cartItems.isNotEmpty)
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${_cartItems.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
          bottom: const TabBar(
            labelColor: Color.fromARGB(255, 255, 255, 255),
            indicatorColor: Color.fromARGB(255, 255, 255, 255),
            unselectedLabelColor: Color.fromARGB(255, 0, 0, 0),
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
          subtitle: 'Perfect mix of tacos',
          price: 'R150',
          imagePath: 'assets/images/combo1.jpeg',
        ),
        _buildCard(
          context,
          title: 'Taco de carnitas',
          subtitle: 'Juicy shredded pork',
          price: 'R75',
          imagePath: 'assets/images/taco1.jpg',
        ),
        _buildCard(
          context,
          title: 'Taco de pollo',
          subtitle: 'Grilled chicken taco',
          price: 'R35',
          imagePath: 'assets/images/taco2.jpeg',
        ),
        _buildCard(
          context,
          title: 'Taco de barbacoa',
          subtitle: 'Slow-cooked beef taco',
          price: 'R45',
          imagePath: 'assets/images/taco4.png',
        ),
        _buildCard(
          context,
          title: 'Taco de birria',
          subtitle: 'Stewed beef taco',
          price: 'R55',
          imagePath: 'assets/images/taco3.jpg',
        ),
        _buildCard(
          context,
          title: 'Taco de asada',
          subtitle: 'Grilled steak taco',
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
          subtitle: 'Juicy beef patty with cheese',
          price: 'R30',
          imagePath: 'assets/images/burger.jpg',
        ),
        _buildCard(
          context,
          title: 'Onion Rings',
          subtitle: 'Crispy and golden fried onions',
          price: 'R15',
          imagePath: 'assets/images/side1.jpg',
        ),
        _buildCard(
          context,
          title: 'Spring Rolls',
          subtitle: 'Crispy rolls',
          price: 'R25',
          imagePath: 'assets/images/side2.jpeg',
        ),
        _buildCard(
          context,
          title: 'Fried Wings',
          subtitle: 'Crispy fried chicken wings',
          price: 'R45',
          imagePath: 'assets/images/side3.jpeg',
        ),
        _buildCard(
          context,
          title: 'Salad',
          subtitle: 'Fresh mixed vegetable salad',
          price: 'R20',
          imagePath: 'assets/images/side4.jpg',
        ),
        _buildCard(
          context,
          title: 'Mashed Potato',
          subtitle: 'Creamy mashed potatoes',
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
          subtitle: 'Crispy and juicy chicken bites',
          price: 'R30',
          imagePath: 'assets/images/snack1.jpeg',
        ),
        _buildCard(
          context,
          title: 'Waffles',
          subtitle: 'Fluffy waffles with syrup',
          price: 'R25',
          imagePath: 'assets/images/snack2.jpg',
        ),
        _buildCard(
          context,
          title: 'Banana Dessert',
          subtitle: 'Sweet banana with cream',
          price: 'R15',
          imagePath: 'assets/images/snack3.jpeg',
        ),
        _buildCard(
          context,
          title: 'Chips',
          subtitle: 'Crispy potato chips',
          price: 'R10',
          imagePath: 'assets/images/snack4.jpg',
        ),
        _buildCard(
          context,
          title: 'Cake',
          subtitle: 'Moist and rich flavored cake',
          price: 'R29',
          imagePath: 'assets/images/snack5.jpeg',
        ),
        _buildCard(
          context,
          title: 'Pudding',
          subtitle: 'Creamy smooth sweet dessert',
          price: 'R60',
          imagePath: 'assets/images/snack6.jpeg',
        ),
      ],
    );
  }

  // Reusable Card Widget
  Widget _buildCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String price,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
              title: title,
              subtitle: subtitle,
              price: price,
              imagePath: imagePath,
              onAddToCart: _addToCart,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
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
                          backgroundColor:
                              const Color.fromARGB(255, 253, 12, 4),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
