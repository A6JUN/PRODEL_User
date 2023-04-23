part of 'manage_cart_bloc.dart';

@immutable
abstract class ManageCartEvent {}

class AddManageCartEvent extends ManageCartEvent {
  final int productId, quantity;
  final String shopId;

  AddManageCartEvent({
    required this.productId,
    required this.quantity,
    required this.shopId,
  });
}

class DeleteManageCartEvent extends ManageCartEvent {
  final int itemId;

  DeleteManageCartEvent({required this.itemId});
}

class GetAllManageCartEvent extends ManageCartEvent {}
