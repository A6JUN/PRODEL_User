import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prodel_user/ui/widget/custom_progress_indicator.dart';

class ProductItem extends StatelessWidget {
  final Function() onTap;
  const ProductItem({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                imageUrl:
                    'https://pprklkrcyqnhjrukxuhq.supabase.co/storage/v1/object/public/docs/images/1681801472917amg%20petronas%202022.jpg',
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(
                  child: CustomProgressIndicator(),
                ),
              ),
            ),
            const Divider(),
            Text(
              'Product name',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  '₹1000',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '₹600',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Clothing',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Sold out',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
