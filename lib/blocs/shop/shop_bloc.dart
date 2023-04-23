import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';
import 'package:prodel_user/utils/iterable_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc() : super(ShopInitialState()) {
    on<ShopEvent>((event, emit) async {
      emit(ShopLoadingState());
      SupabaseClient supabaseClient = Supabase.instance.client;
      SupabaseQueryBuilder queryTable = supabaseClient.from('shops');
      SupabaseQueryBuilder subQueryTable = supabaseClient.from('service_areas');
      List<Map<String, dynamic>> shopWithServiceAreaList = [];
      Map<String, dynamic> shopWithAreaMap = {};
      try {
        if (event is GetAllShopEvent) {
          List<dynamic> temp = [];

          if (event.query != null && event.serviceAreaId != null) {
            temp = await queryTable
                .select()
                .ilike('name', '%${event.query}%')
                .eq('service_area_id', event.serviceAreaId)
                .order("name", ascending: true);
          } else if (event.query != null) {
            temp = await queryTable
                .select()
                .ilike('name', '%${event.query}%')
                .order("name", ascending: true);
          } else if (event.serviceAreaId != null) {
            temp = await queryTable
                .select()
                .eq('service_area_id', event.serviceAreaId)
                .order("name", ascending: true);
          } else {
            temp = await queryTable.select().order("name", ascending: true);
          }

          List<User> users =
              await supabaseClient.auth.admin.listUsers(perPage: 1000);

          List<Map<String, dynamic>> shops = temp.map((e) {
            Map<String, dynamic> element = e as Map<String, dynamic>;

            User? user =
                users.firstOrNull((user) => user.id == element['user_id']);

            element['status'] =
                user != null ? user.userMetadata!['status'] : '';
            element['email'] = user != null ? user.email : '';

            return element;
          }).toList();

          for (int i = 0; i < shops.length; i++) {
            Map<String, dynamic> area = await subQueryTable
                .select()
                .eq('id', shops[i]['service_area_id'])
                .single();

            shops[i]['area'] = area;
          }
          emit(ShopSuccessState(
            shops: shops,
          ));
        }
      } catch (e, s) {
        Logger().e('$e\n$s');
        emit(ShopFailureState(message: e.toString()));
      }
    });
  }
}
