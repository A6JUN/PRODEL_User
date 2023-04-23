import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';

import '../widget/counter.dart';
import '../widget/custom_progress_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic productDetails;
  const ProductDetailsScreen({super.key, required this.productDetails});

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
              itemCount: widget.productDetails['images'].length,
              itemBuilder: (context, index, pageViewIndex) =>
                  CachedNetworkImage(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: widget.productDetails['images'][index]['url'],
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
                    widget.productDetails['category']['name'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.productDetails['name'],
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '₹${widget.productDetails['price'].toString()}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '₹${widget.productDetails['discounted_price']}',
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
                    '${widget.productDetails['quantity']} / ${widget.productDetails['measurement']}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.productDetails['description'],
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
          const Divider(height: 1),
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
