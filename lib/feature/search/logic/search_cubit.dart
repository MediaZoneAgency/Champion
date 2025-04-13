import 'package:bloc/bloc.dart';
import 'package:education/feature/search/data/models/search_result_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/error/error_model.dart';
import '../../coursedetails/data/models/product_model.dart';
import '../data/repo/search_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  SearchRepo searchRepo;
  List<SearchResult> searchResults = [];
  String currentCategoryId = "";
  double minPrice = 0;
  double maxPrice = 100000;
  String categoryName = "";

  final List<String> searches = [
    'white pull over',
    'T-shirt',
  ];
  Future<void> fetchSearchResults(String search) async {
    searchResults=[];
    emit(SearchLoading());
    var result = await searchRepo.getSearch(
        search: search,
        minPrice: minPrice,
        maxPrice: maxPrice,
        categoryName: categoryName);
    result.fold(
      (failure) {
        emit(SearchFailure( failure));
      },
      (response) {
        searchResults = response;
        emit(SearchSuccess());
      },
    );
  }
}
