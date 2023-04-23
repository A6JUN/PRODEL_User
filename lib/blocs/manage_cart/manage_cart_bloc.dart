import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'manage_cart_event.dart';
part 'manage_cart_state.dart';

class ManageCartBloc extends Bloc<ManageCartEvent, ManageCartState> {
  ManageCartBloc() : super(ManageCartInitialState()) {
    on<ManageCartEvent>((event, emit) async {
      emit(ManageCartLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('carts');
      try {
        if (event is GetAllManageCartEvent) {
          List<dynamic> temp = await queryTable.select().eq(
                'user_id',
                supabaseClient.auth.currentUser!.id,
              );

          List<Map<String, dynamic>> cartItems =
              temp.map((e) => e as Map<String, dynamic>).toList();

          int total = 0;

          for (int i = 0; i < cartItems.length; i++) {
            cartItems[i]['product'] = (await supabaseClient.rpc(
              'get_products',
              params: {
                'search_product_id': cartItems[i]['product_id'],
              },
            ))[0];
            total += (cartItems[i]['product']['discounted_price'] *
                cartItems[i]['quantity']) as int;
          }

          Logger().w(cartItems);

          emit(ManageCartSuccessState(
            cartItems: cartItems,
            total: total,
          ));
        } else if (event is AddManageCartEvent) {
          await queryTable
              .delete()
              .eq('user_id', supabaseClient.auth.currentUser!.id)
              .neq('shop_id', event.shopId);

          await queryTable
              .delete()
              .eq('user_id', supabaseClient.auth.currentUser!.id)
              .eq('product_id', event.productId);

          await queryTable.upsert({
            'user_id': supabaseClient.auth.currentUser!.id,
            'product_id': event.productId,
            'quantity': event.quantity,
            'shop_id': event.shopId,
          });
          add(GetAllManageCartEvent());
        } else if (event is DeleteManageCartEvent) {
          await queryTable.delete().eq('id', event.itemId);
          add(GetAllManageCartEvent());
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ManageCartFailureState(message: e.toString()));
      }
    });
  }
}
