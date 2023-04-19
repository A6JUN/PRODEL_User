import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/cart_screen.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/orders_screen.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/settings_screen.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/shops_screen.dart';

import '../widget/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      vsync: this,
    );
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.yellow,
        shadowColor: Colors.black26,
        title: Text(
          "PRODEL",
          style: GoogleFonts.bungeeHairline(
            textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ShopsScreen(),
          OrdersScreen(),
          CartScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        index: tabController.index,
        onChange: (index) {
          tabController.animateTo(index);
        },
      ),
    );
  }
}
