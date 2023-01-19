import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/cart_section.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/profile_section.dart';
import 'package:prodel_user/ui/screens/home_screen_sections/settings_section.dart';

import '../widget/custom_bottom_nav_bar.dart';
import 'home_screen_sections/shop_section.dart';

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
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Text(
          "PRODEL",
          style: GoogleFonts.bungeeHairline(
            textStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          ShopSection(),
          ProfileSection(),
          CartSection(),
          SettingsSection(),
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
