part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProductsEvent extends ProductEvent {
  final String? query;
  final int? categoryId;
  final String shopId;

  GetAllProductsEvent({
    this.query,
    this.categoryId,
    required this.shopId,
  });
}
