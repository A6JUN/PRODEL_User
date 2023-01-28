import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  final Function(int) onChange;
  const CustomBottomNavBar({
    Key? key,
    required this.index,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                onChange(0);
              },
              icon: Icon(
                Icons.home_outlined,
                size: 30,
                color: index == 0 ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onChange(1);
              },
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: index == 1 ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onChange(2);
              },
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                size: 30,
                color: index == 2 ? Colors.black : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () {
                onChange(3);
              },
              icon: Icon(
                Icons.settings_outlined,
                size: 30,
                color: index == 3 ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
