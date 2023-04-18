import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prodel_user/blocs/product_category/product_category_bloc.dart';
import 'package:prodel_user/values/colors.dart';

import 'custom_alert_dialog.dart';

class CategorySelector extends StatefulWidget {
  final Function(int) onSelect;
  final int? selectedCategory;
  const CategorySelector({
    super.key,
    required this.onSelect,
    this.selectedCategory = 0,
  });

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final ProductCategoryBloc productCategoryBloc = ProductCategoryBloc();

  int selectedId = 0;

  @override
  void initState() {
    productCategoryBloc.add(GetAllProductCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCategoryBloc>.value(
      value: productCategoryBloc,
      child: BlocConsumer<ProductCategoryBloc, ProductCategoryState>(
        listener: (context, state) {
          if (state is ProductCategoryFailureState) {
            showDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                title: 'Failed!',
                message: state.message,
                primaryButtonLabel: 'Retry',
                primaryOnPressed: () {
                  productCategoryBloc.add(GetAllProductCategoryEvent());
                  Navigator.pop(context);
                },
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductCategorySuccessState) {
            return Row(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(20),
                  color: selectedId == 0
                      ? primaryColor.withOpacity(0.1)
                      : Colors.grey[200],
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      selectedId = 0;
                      setState(() {});
                      widget.onSelect(0);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Text(
                        'All Categories',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: selectedId == 0
                                ? primaryColor
                                : Colors.grey[800]),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List<Widget>.generate(
                      state.productCategories.length,
                      (index) => Material(
                        borderRadius: BorderRadius.circular(20),
                        color:
                            selectedId == state.productCategories[index]['id']
                                ? primaryColor.withOpacity(0.1)
                                : Colors.grey[200],
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            selectedId = state.productCategories[index]['id'];
                            setState(() {});
                            widget
                                .onSelect(state.productCategories[index]['id']);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Text(
                              state.productCategories[index]['name'],
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: selectedId ==
                                              state.productCategories[index]
                                                  ['id']
                                          ? primaryColor
                                          : Colors.grey[800]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ProductCategoryFailureState) {
            return const SizedBox();
          } else {
            return LinearProgressIndicator(
              color: primaryColor,
              backgroundColor: primaryColor.withOpacity(0.1),
            );
          }
        },
      ),
    );
  }
}
