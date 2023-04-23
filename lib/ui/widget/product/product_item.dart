import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/custom_progress_indicator.dart';
import 'package:prodel_user/utils/truncate_string.dart';

class ProductItem extends StatelessWidget {
  final Function() onTap;
  final dynamic productDetails;
  const ProductItem({
    Key? key,
    required this.onTap,
    required this.productDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl: productDetails['images'][0]['url'],
              progressIndicatorBuilder: (context, url, progress) =>
                  const Center(
                child: CustomProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            productDetails['category']['name'],
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 2.5),
          Text(
            truncateString(productDetails['name'], 15),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '₹${productDetails['price'].toString()}',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.red[800],
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '₹${productDetails['discounted_price'].toString()}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
