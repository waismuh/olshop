import 'package:aostes/response/categories_response.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesFetched extends CategoriesState {
  final List<Dummy> dummys;
  CategoriesFetched(this.dummys);
}
