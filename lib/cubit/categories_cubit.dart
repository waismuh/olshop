import 'package:aostes/cubit/categories_state.dart';
import 'package:aostes/provider/aos_provider.dart';
import 'package:aostes/response/categories_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> with AosProvider{
  CategoriesCubit() : super(CategoriesInitial());

  void refetch() async {
    emit(CategoriesLoading());

    try {
      CategoriesResponse res = await dummy();

      emit(CategoriesFetched(res.dummy!));
    } on Exception catch (e) {
      print(e);
      emit(CategoriesInitial());
    }
  }

  void reset() {
    emit(CategoriesInitial());
  }
}
