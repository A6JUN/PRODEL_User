import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      appBar: AppBar(
        centerTitle: false,
        elevation: 30,
        backgroundColor: Colors.white,
        shadowColor: Colors.black26,
        title: Text(
          "Details",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Text(
              'Product Details',
            ),
          ],
        ),
      ),
    );
  }
}
