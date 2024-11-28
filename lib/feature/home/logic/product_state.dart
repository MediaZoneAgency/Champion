part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
class FetchCategoryInitial extends ProductState {}
class FetchProductSuccess extends ProductState {
  final List<ProductModel> Products;
  FetchProductSuccess(this.Products);
}
class FetchProductLoading extends ProductState {}
class FetchProductFailure extends ProductState {
  final String errorMessage;
  FetchProductFailure(this.errorMessage);
}

class FetchCategoryProductSuccess extends ProductState {
  final List<ProductModel> categoryProducts;
  FetchCategoryProductSuccess(this.categoryProducts);
}
class FetchCategoryProductLoading extends ProductState {}
class FetchCategoryProductFailure extends ProductState {
  final String errorMessage;
  FetchCategoryProductFailure(this.errorMessage);
}

