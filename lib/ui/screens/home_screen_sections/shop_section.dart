import 'package:flutter/material.dart';

class ShopSection extends StatelessWidget {
  const ShopSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10,
        padding: EdgeInsets.only(top: 20, bottom: 100),
        children: List.generate(
          10,
          (index) => Container(
            color: Color.fromARGB(255, 64, 119, 0),
          ),
        ),
      ),
    );
  }
}
