import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_user/blocs/manage_order/manage_order_bloc.dart';
import 'package:prodel_user/ui/screens/product_details_screen.dart';
import 'package:prodel_user/ui/widget/custom_button.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/label_with_text.dart';
import 'package:prodel_user/ui/widget/product/product_item.dart';

import '../../widget/custom_alert_dialog.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final ManageOrderBloc manageOrderBloc = ManageOrderBloc();
  String groupValue = 'pending';

  void getOrders() {
    manageOrderBloc.add(GetAllOrderEvent(status: groupValue));
  }

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ManageOrderBloc>.value(
        value: manageOrderBloc,
        child: BlocConsumer<ManageOrderBloc, ManageOrderState>(
          listener: (context, state) {
            if (state is ManageOrderFailureState) {
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
          builder: (context, state) {
            return Padding(
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      'packed': Text(
                        'Packed',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                      'complete': Text(
                        'Completed',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    },
                    onValueChanged: (value) {
                      groupValue = value!;
                      setState(() {});
                      getOrders();
                    },
                  ),
                  const Divider(
                    color: Colors.black54,
                    height: 20,
                  ),
                  Expanded(
                    child: state is ManageOrderSuccessState
                        ? state.orders.isNotEmpty
                            ? ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                itemBuilder: (context, index) => OrderItem(
                                  orderDetails: state.orders[index],
                                  manageOrderBloc: manageOrderBloc,
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: state.orders.length,
                              )
                            : const Center(child: Text('No Orders'))
                        : const Center(child: CupertinoActivityIndicator()),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final dynamic orderDetails;
  final ManageOrderBloc manageOrderBloc;
  const OrderItem({
    super.key,
    required this.orderDetails,
    required this.manageOrderBloc,
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
                  '#${orderDetails['id'].toString()}',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  orderDetails['status'],
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
            LabelWithText(
              label: 'Shop',
              text: orderDetails['shop']['name'],
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            LabelWithText(
              label: 'Type',
              text: orderDetails['order_type'],
            ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            Wrap(
              runSpacing: 5,
              children: List<Widget>.generate(
                orderDetails['items'].length,
                (index) => ProductListItem(
                  itemDetails: orderDetails['items'][index],
                ),
              ),
            ),
            if (orderDetails['order_type'] == 'delivery')
              const Divider(
                height: 20,
                color: Colors.black54,
              ),
            if (orderDetails['order_type'] == 'delivery')
              LabelWithText(
                label: 'Address',
                text:
                    '${orderDetails['address']}, ${orderDetails['pin'].toString()}',
              ),
            const Divider(
              height: 20,
              color: Colors.black54,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LabelWithText(
                  label: 'Total',
                  text: '₹${orderDetails['total'].toString()}',
                ),
              ],
            ),
            if (orderDetails['order_type'] == 'pickup' &&
                orderDetails['status'] == 'packed')
              const Divider(
                height: 20,
                color: Colors.black54,
              ),
            if (orderDetails['order_type'] == 'pickup' &&
                orderDetails['status'] == 'packed')
              CustomButton(
                onTap: () {
                  manageOrderBloc.add(
                    HandleOrderEvent(
                      orderId: orderDetails['id'],
                      status: 'complete',
                    ),
                  );
                },
                label: 'Picked Up',
              ),
          ],
        ),
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final dynamic itemDetails;
  const ProductListItem({
    super.key,
    required this.itemDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            itemDetails['product']['images'][0]['url'],
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemDetails['product']['name'],
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              itemDetails['quantity'].toString(),
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
                '₹${itemDetails['price'].toString()}',
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
