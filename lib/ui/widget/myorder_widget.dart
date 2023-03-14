import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrder extends StatelessWidget {
  final String image, quantity, title, subtitle;
  const MyOrder({
    Key? key,
    required this.image,
    required this.quantity,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 229, 230, 227),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
              color: Color.fromARGB(255, 252, 250, 250), width: .5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  height: 100,
                  width: 80,
                ),
                Text("Qty : $quantity")
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500, fontSize: 17)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    subtitle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
