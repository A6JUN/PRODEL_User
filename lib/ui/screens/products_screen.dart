import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_user/blocs/product/product_bloc.dart';
import 'package:prodel_user/ui/screens/product_details_screen.dart';
import 'package:prodel_user/ui/widget/category_selector.dart';
import 'package:prodel_user/ui/widget/custom_search.dart';
import 'package:prodel_user/ui/widget/product/product_item.dart';

import '../widget/custom_alert_dialog.dart';

class ProductsScreen extends StatefulWidget {
  final dynamic shopDetails;
  const ProductsScreen({
    Key? key,
    required this.shopDetails,
  }) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductBloc productBloc = ProductBloc();
  String? query;
  int? selectedCategoryId;

  void getProducts() {
    productBloc.add(
      GetAllProductsEvent(
        shopId: widget.shopDetails['user_id'],
        query: query,
        categoryId: selectedCategoryId != 0 ? selectedCategoryId : null,
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black38),
        title: Text(
          widget.shopDetails['name'],
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        elevation: 1,
      ),
      body: BlocProvider<ProductBloc>.value(
        value: productBloc,
        child: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductFailureState) {
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CategorySelector(
                      onSelect: (id) {
                        selectedCategoryId = id;
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
                      child: state is ProductSuccessState
                          ? state.products.isNotEmpty
                              ? GridView.count(
                                  childAspectRatio: 1 / 1.30,
                                  crossAxisCount: 2,
                                  shrinkWrap: true,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                  children: List<Widget>.generate(
                                    state.products.length,
                                    (index) => ProductItem(
                                      productDetails: state.products[index],
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetailsScreen(
                                            productDetails:
                                                state.products[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: Text('No Products Found'),
                                )
                          : const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                    ),
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
