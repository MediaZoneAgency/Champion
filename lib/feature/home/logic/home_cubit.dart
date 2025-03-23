import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:education/feature/coursedetails/data/topic_model.dart';
import 'package:education/feature/home/logic/product_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/db/cached_app.dart';
import '../../wishlist/data/models/wish_list_model.dart';
import '../data/models/category_model.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;

  List<CategoryModel> categoryModel = [];
  List<TopicModel> Topics =[];

  static HomeCubit get(context) => BlocProvider.of(context);
  Future<void> getCategory() async {
    try {
      categoryModel = CachedApp.getCachedData(CachedDataType.categories.name);
      emit(FetchCategorySuccess(categoryModel));
    } catch (e) {
      emit(FetchCategoryLoading());
      final result = await _homeRepo.getCategories();

      result.fold(
        (failure) {
          log("eeeeeeeeeeeeeeeeeeeeeee");
          emit(FetchCategoryFailure(failure.message));
        },
        (units) {
          categoryModel = units;
          CachedApp.saveData(categoryModel, CachedDataType.categories.name);

          emit(FetchCategorySuccess(units));
        },
      );
    }
  }

  Future<void> getTopic() async {
    try {
      // Attempt to load cached topics
      final cachedTopics = CachedApp.getCachedData(CachedDataType.topics.name);
      // Emit success state with cached topics if available
      emit(FetchTopicSuccess(cachedTopics));
    } catch (e) {
      // If no cached data is available, start loading
      emit(FetchTopicLoading());

      // Call the repository method to fetch topics
      final result = await _homeRepo.getTopic();

      result.fold(
            (failure) {
          log("Error fetching topics: ${failure.message}");
          emit(FetchTopicFailure(failure.message));
        },
            (topics) {
          // Save the fetched topics into the cache
              Topics = topics;
              CachedApp.saveData(topics, CachedDataType.topics.name);
          // Emit success state with the fetched topics
          emit(FetchTopicSuccess(topics));
        },
      );
    }
  }




}
