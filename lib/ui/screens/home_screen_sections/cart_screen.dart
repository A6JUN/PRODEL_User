import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/product_details_screen.dart';
import 'package:prodel_user/ui/widget/counter.dart';

import '../../widget/custom_button.dart';
import '../../widget/custom_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 50,
              top: 20,
            ),
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemBuilder: (BuildContext context, int index) {
              return const ShopItem();
            },
          ),
        ),
        Material(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
            side: const BorderSide(color: Colors.black38, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: GoogleFonts.notoSans(
                          textStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "₹440",
                        style: GoogleFonts.notoSans(
                          textStyle:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    label: 'Place Order',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ShopItem extends StatelessWidget {
  const ShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1399&q=80',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    'Product Name',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    'Shop Name',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Counter(
                    size: 24,
                    onChange: (count) {},
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: Colors.black26,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }
}
