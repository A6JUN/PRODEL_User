import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/widget/custom_action_button.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';
import 'package:prodel_user/values/colors.dart';

import '../widget/counter.dart';
import '../widget/custom_progress_indicator.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FlutterCarousel.builder(
              itemCount: 3,
              itemBuilder: (context, index, pageViewIndex) =>
                  CachedNetworkImage(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl:
                    'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1399&q=80',
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CustomProgressIndicator(),
                ),
              ),
              options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: true,
                viewportFraction: 1,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'The Looong Produt Title',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '₹2500',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '₹3000',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '1 KG',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vitae ipsum a arcu faucibus lobortis. In hac habitasse platea dictumst. Sed vel gravida enim. Sed sit amet lectus nunc. Sed hendrerit velit augue, vel pulvinar neque pretium in.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1),
          Material(
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Counter(
                    onChange: (count) {},
                  ),
                  CustomButton(
                    onTap: () {},
                    label: 'Add to Cart',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
