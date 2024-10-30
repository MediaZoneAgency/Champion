import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo ;
  static HomeCubit get(context) => BlocProvider.of(context);

}
