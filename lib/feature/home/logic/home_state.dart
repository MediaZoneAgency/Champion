part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class FetchCategoryInitial extends HomeState {}
class FetchCategorySuccess extends HomeState {
  final List<CategoryModel> categories;
  FetchCategorySuccess(this.categories);
}



class FetchCategoryLoading extends HomeState {}

class FetchCategoryFailure extends HomeState {
  final String errorMessage;
  FetchCategoryFailure(this.errorMessage);
}

class FetchTopicInitial extends HomeState {}
class FetchTopicSuccess extends HomeState {
  final List<TopicModel> Topics;
  FetchTopicSuccess(this.Topics);
}



class FetchTopicLoading extends HomeState {}

class FetchTopicFailure extends HomeState {
  final String errorMessage;
  FetchTopicFailure(this.errorMessage);
}