import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prodel_user/ui/screens/product_details_screen.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/label_with_text.dart';
import 'package:prodel_user/ui/widget/product/product_item.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String groupValue = 'pending';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            CupertinoSlidingSegmentedControl<String>(
              backgroundColor: Colors.white60,
              thumbColor: Colors.yellow[200]!,
              groupValue: groupValue,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              children: {
                'pending': Text(
                  'Pending',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                'packed': Text(
                  'Packed',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                'completed': Text(
                  'Completed',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              },
              onValueChanged: (value) {
                groupValue = value!;
                setState(() {});
              },
            ),
            const Divider(
              color: Colors.black54,
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 20,
                  children: List<Widget>.generate(
                    5,
                    (index) => const OrderItem(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '#12',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'Pending',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            const LabelWithText(
              label: 'Shop',
              text: 'Shop Name',
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            const LabelWithText(
              label: 'Type',
              text: 'Delivery',
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            Wrap(
              runSpacing: 5,
              children: List<Widget>.generate(
                2,
                (index) => const ProductListItem(),
              ),
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            const LabelWithText(
              label: 'Address',
              text:
                  'Address line 1, address line 2, place, city, district,state, pin 670301',
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: LabelWithText(
                    label: 'Total',
                    text: '₹4000',
                  ),
                ),
                Expanded(
                  child: Text(
                    'Pending',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.end,
                  ),
                )
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            CustomButton(
              onTap: () {},
              label: 'Pay Now',
            ),
          ],
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  const ProductListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1399&q=80',
            width: 60,
            height: 60,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Product Name',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '5',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '₹2000',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
