import 'package:flutter/material.dart';
import 'package:food_app/screens/item_details.dart';
import 'package:food_app/screens/main_menu.dart';
import 'package:food_app/screens/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SignInScreen(),
      routes: {
        '/menu': (context) => const MainMenuScreen(),
        '/item_details': (context) => const ItemDetailsScreen(),
      },
    );
  }
}
