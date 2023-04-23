import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/blocs/manage_cart/manage_cart_bloc.dart';
import 'package:prodel_user/ui/widget/counter.dart';

import '../../widget/custom_alert_dialog.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_card.dart';
import '../product_details_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ManageCartBloc manageCartBloc = ManageCartBloc();
  @override
  void initState() {
    super.initState();
    manageCartBloc.add(GetAllManageCartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageCartBloc>.value(
      value: manageCartBloc,
      child: BlocConsumer<ManageCartBloc, ManageCartState>(
        listener: (context, state) {
          if (state is ManageCartFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failure',
                message: state.message,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: state is ManageCartSuccessState
                    ? state.cartItems.isNotEmpty
                        ? ListView.separated(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom: 50,
                              top: 20,
                            ),
                            shrinkWrap: true,
                            itemCount: state.cartItems.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(),
                            itemBuilder: (BuildContext context, int index) {
                              return ShopItem(
                                manageCartBloc: manageCartBloc,
                                cartItemDetails: state.cartItems[index],
                              );
                            },
                          )
                        : const Center(child: Text('No Items'))
                    : const Center(
                        child: CupertinoActivityIndicator(),
                      ),
              ),
              Material(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                  side: const BorderSide(color: Colors.black38, width: 0.5),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Price",
                              style: GoogleFonts.notoSans(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              state is ManageCartSuccessState
                                  ? "₹${state.total.toString()}"
                                  : "",
                              style: GoogleFonts.notoSans(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
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
        },
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  final dynamic cartItemDetails;
  final ManageCartBloc manageCartBloc;
  const ShopItem({
    super.key,
    required this.cartItemDetails,
    required this.manageCartBloc,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              productDetails: cartItemDetails['product'],
            ),
          ),
        );
        manageCartBloc.add(GetAllManageCartEvent());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.network(
              cartItemDetails['product']['images'][0]['url'],
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
                    cartItemDetails['product']['category']['name'],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    cartItemDetails['product']['name'],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    cartItemDetails['product']['shop']['name'],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 2.5),
                  Text(
                    '${cartItemDetails['quantity']} Qty',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            Text(
              '₹${cartItemDetails['product']['discounted_price']}',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
