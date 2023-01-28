import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 16,
        padding: EdgeInsets.only(top: 20, bottom: 100),
        children: List.generate(
          10,
          (index) => Material(
            color: Color.fromARGB(255, 156, 187, 160),
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "assets/images/starbucks-coffee-png-19.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text("STARBUCKS",
                      style: GoogleFonts.bebasNeue(fontSize: 17)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
