import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/ui/screens/products_screen.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/custom_search.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Explore shops",
              style: GoogleFonts.jost(
                textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomSearch(
              onSearch: (search) {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) => const ShopItem(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
            ),
          ),
        ],
      ),
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
            builder: (context) => const ProductsScreen(),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1528698827591-e19ccd7bc23d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
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
                    'Shop Name',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Address Line,',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Place, City, 678789',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
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
