import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/error/error_model.dart';
import '../../wishlist/data/models/wish_list_model.dart';
import '../data/models/edit_profile_model.dart';
import '../data/models/edit_profile_response.dart';
import '../data/models/profile_model.dart';

import '../data/repo/profile_repo.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileRepo profileRepo;
  ProfileModel? profileUser;
  bool isObscureText1 = true;
  bool isObscureText2 = true;
  String selectedCountry = "Select Country";
  void obscureText1() {
    isObscureText1 = !isObscureText1;
    emit(ObscureText1());
  }

  void obscureText2() {
    isObscureText2 = !isObscureText2;
    emit(ObscureText2());
  }
  void updateSelectedCountry(String country) {
    selectedCountry = country;
    emit(CountrySelected(country));
  }
  Future<void> getProfile() async {
    emit(ProfileLoading());
    final result = await profileRepo.fetchProfile();
    {
      result.fold(
            (failure) {

          profileUser = null;
          emit(ProfileFailure(failure.message));
          log('yarab nekhlas');
        },
            (profileApi) {
              log('thannnks god');

          profileUser = profileApi;
          emit(ProfileSuccess());
        },
      );
    }
  }
  Future<void> deletUserAccount() async {
    emit(DeleteAccountLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await profileRepo.deletAccount();
      response.fold(
              (error){ emit(DeleteAccountFailure(error));
          },
              (profileData) {
            emit(DeleteAccountSuccess('Account deleted successfully'));
          });
      return;
    }else{
      emit(DeleteAccountFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }

  Future<void> editProfile(EditProfileModel editProfileModel) async {
    emit(EditProfileLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await profileRepo.featchProfileNew(editProfile: editProfileModel);
      response.fold(
              (l) => emit(EditProfileFailure( l )),
              (r)  {
            emit(EditProfileSuccess(editProfileResponse: r));
          }
      );
    } else {
      // translate the message pls
      emit(EditProfileFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }
}
