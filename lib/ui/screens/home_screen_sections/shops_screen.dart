import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prodel_user/blocs/shop/shop_bloc.dart';
import 'package:prodel_user/ui/screens/products_screen.dart';
import 'package:prodel_user/ui/widget/custom_alert_dialog.dart';
import 'package:prodel_user/ui/widget/custom_card.dart';
import 'package:prodel_user/ui/widget/custom_search.dart';
import 'package:prodel_user/ui/widget/service_area_selector.dart';

class ShopsScreen extends StatefulWidget {
  const ShopsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShopsScreen> createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  final ShopBloc shopBloc = ShopBloc();

  String? query;
  int? selectedServiceArea;

  void getProducts() {
    shopBloc.add(
      GetAllShopEvent(
        query: query,
        serviceAreaId: selectedServiceArea == 0 ? null : selectedServiceArea,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ShopBloc>.value(
        value: shopBloc,
        child: BlocConsumer<ShopBloc, ShopState>(
          listener: (context, state) {
            if (state is ShopFailureState) {
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
                      textStyle:
                          Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ServiceAreaSelector(
                          onSelect: (id) {
                            selectedServiceArea = id;
                            setState(() {});
                            getProducts();
                          },
                          label: 'Service Area',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomSearch(
                    onSearch: (search) {
                      query = search;
                      getProducts();
                    },
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
                    child: state is ShopSuccessState
                        ? state.shops.isNotEmpty
                            ? ListView.separated(
                                itemCount: state.shops.length,
                                itemBuilder: (context, index) => ShopItem(
                                  shopDetails: state.shops[index],
                                ),
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                              )
                            : const Center(
                                child: Text('No shops found'),
                              )
                        : const Center(
                            child: CupertinoActivityIndicator(),
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  final dynamic shopDetails;
  const ShopItem({
    super.key,
    required this.shopDetails,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductsScreen(shopDetails: shopDetails),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Row(
          children: [
            Image.network(
              shopDetails['image_url'],
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
                    shopDetails['name'],
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    shopDetails['address_line'],
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    shopDetails['place'] +
                        ' ' +
                        shopDetails['city'] +
                        ' ' +
                        shopDetails['pin'].toString(),
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
