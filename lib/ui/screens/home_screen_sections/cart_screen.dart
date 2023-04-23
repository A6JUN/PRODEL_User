import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:prodel_user/blocs/manage_cart/manage_cart_bloc.dart';
import 'package:prodel_user/blocs/manage_order/manage_order_bloc.dart';
import 'package:prodel_user/ui/widget/counter.dart';
import 'package:prodel_user/utils/value_validators.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  final ManageOrderBloc manageOrderBloc = ManageOrderBloc();

  int total = 0;
  Map<String, dynamic>? address;
  String? orderType;

  @override
  void initState() {
    super.initState();
    manageCartBloc.add(GetAllManageCartEvent());
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  final Razorpay _razorpay = Razorpay();

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    await showDialog(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: 'Payment Success',
        message: 'Thank you for the payment',
        primaryButtonLabel: 'Ok',
      ),
    );

    manageOrderBloc.add(
      CreateOrderEvent(
        type: orderType!,
        address: address,
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Logger().e(response.error);
    showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Payment Failed',
        message: response.message ?? 'Something went wrong, Please try again',
        primaryButtonLabel: 'Ok',
      ),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  void makePayment() async {
    // String orderId = await createOrder(widget.testDetails['total_price']);

    var options = {
      'key': 'rzp_test_j07YpjyCexi5xr',
      'amount': total * 100,
      'name': 'Prodel',
      // 'order_id': orderId,
      'description': 'Order',
      'prefill': {
        'contact': '9999999999',
        'email': Supabase.instance.client.auth.currentUser!.email,
      }
    };
    Logger().w(options);
    _razorpay.open(options);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ManageCartBloc>.value(
      value: manageCartBloc,
      child: BlocProvider<ManageOrderBloc>.value(
        value: manageOrderBloc,
        child: BlocConsumer<ManageOrderBloc, ManageOrderState>(
          listener: (context, orderState) {
            if (orderState is ManageOrderFailureState ||
                orderState is ManageOrderSuccessState) {
              manageCartBloc.add(GetAllManageCartEvent());
            }

            if (orderState is ManageOrderFailureState) {
              showDialog(
                context: context,
                builder: (context) => const CustomAlertDialog(
                  title: 'Failure',
                  message:
                      'Something went wrong, please check your connection and try again.',
                  primaryButtonLabel: 'Ok',
                ),
              );
            }
          },
          builder: (context, orderState) {
            return BlocConsumer<ManageCartBloc, ManageCartState>(
              listener: (context, state) {
                if (state is ManageCartFailureState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomAlertDialog(
                      title: 'Failure',
                      message: state.message,
                    ),
                  );
                } else if (state is ManageCartSuccessState) {
                  total = state.total;
                }
              },
              builder: (context, state) {
                return orderState is ManageOrderLoadingState
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : Column(
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
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ShopItem(
                                            manageCartBloc: manageCartBloc,
                                            cartItemDetails:
                                                state.cartItems[index],
                                          );
                                        },
                                      )
                                    : const Center(child: Text('No Items'))
                                : const Center(
                                    child: CupertinoActivityIndicator(),
                                  ),
                          ),
                          state is ManageCartSuccessState &&
                                  state.cartItems.isNotEmpty
                              ? Material(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1),
                                    side: const BorderSide(
                                        color: Colors.black38, width: 0.5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Total Price",
                                                style: GoogleFonts.notoSans(
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.normal,
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
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                            label: 'Place Order',
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    CustomAlertDialog(
                                                  title: 'Pickup / Delivery',
                                                  message:
                                                      'Do you want to pickup the order or get it delivered to an address?',
                                                  primaryButtonLabel: 'Deliver',
                                                  primaryOnPressed: () async {
                                                    //get address, make payment, create order, clear cart
                                                    address = await showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          const AddressForm(),
                                                    );

                                                    if (address != null) {
                                                      //
                                                      orderType = 'delivery';
                                                      Navigator.pop(context);
                                                      makePayment();
                                                    }
                                                  },
                                                  secondaryButtonLabel:
                                                      'Pickup',
                                                  secondaryOnPressed: () {
                                                    //make payment, create order, clear cart
                                                    orderType = 'pickup';
                                                    Navigator.pop(context);
                                                    makePayment();
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      );
              },
            );
          },
        ),
      ),
    );
  }
}

class AddressForm extends StatefulWidget {
  const AddressForm({
    super.key,
  });

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _addC = TextEditingController();
  final TextEditingController _pinC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Delivery Address',
      message: 'Enter the delivery address',
      content: Flexible(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _addC,
                validator: alphaNumericValidator,
                minLines: 2,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Address Line',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _pinC,
                validator: numericValidator,
                decoration: const InputDecoration(
                  hintText: 'Pin Code',
                ),
              ),
            ],
          ),
        ),
      ),
      primaryButtonLabel: 'Continue',
      primaryOnPressed: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(
            context,
            {
              'address': _addC.text.trim(),
              'pin': _pinC.text.trim(),
            },
          );
        }
      },
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
