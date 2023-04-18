import 'package:flutter/material.dart';

class Branding extends StatelessWidget {
  const Branding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      "assets/images/LOGO.jpg",
      fit: BoxFit.cover,
    ));
  }
}
