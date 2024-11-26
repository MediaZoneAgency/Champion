import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/db/cached_app.dart';
import '../../../core/db/cash_helper.dart';
import '../../../core/error/error_model.dart';
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
  String token = '';
  String selectedCountry = "Select Country";

  void obscureText1() {
    isObscureText1 = !isObscureText1;
    emit(ObscureText1());
  }

  void obscureText2() {
    isObscureText2 = !isObscureText2;
    emit(ObscureText2());
  }

  Future<void> getToken() async {
    try {
      final fetchedToken = await CashHelper.getStringSecured(key: Keys.token);

      if (fetchedToken == null) {
        // إذا لم يتم العثور على التوكين، يمكن إرسال حالة تعبر عن ذلك
        if (!isClosed) emit(TokenNotFound());
      } else {
        token = fetchedToken;
        if (!isClosed) emit(GetToken());
      }
    } catch (e) {
      // إذا حدث خطأ أثناء جلب التوكين
      if (!isClosed) emit(TokenError(e.toString()));
    }
  }

  void updateSelectedCountry(String country) {
    selectedCountry = country;
    emit(CountrySelected(country));
  }

  Future<void> getProfile() async {
    await getToken();
    if (token != '') {
      try {
        profileUser = CachedApp.getCachedData(CachedDataType.profile.name);
        log("aaaaaaa");
        emit(ProfileSuccess());
      } catch (e) {
        emit(ProfileLoading());
        final result = await profileRepo.fetchProfile();
        result.fold(
          (failure) {
            profileUser = null;
            emit(ProfileFailure(failure.message));
            log('yarab nekhlas');
          },
          (profileApi) async {
            log('thannnks god');
            profileUser = profileApi;
            await CashHelper.setStringSecured(
                key: Keys.userId, value: profileApi.id.toString() ?? '');
            CachedApp.saveData(profileUser, CachedDataType.profile.name);
            emit(ProfileSuccess());
          },
        );
      }
    }
  }
  // Future<void> getProfileData() async {
  //   getToken();
  //   log("aaaaaaaaaa");
  //   //token= (await CashHelper.getStringScoured(key: Keys.token))!;
  //   if(token!=''){
  //     try{
  //       profile=CachedApp.getCachedData(CachedDataType.profile.name);
  //       emit(FetchProfileDataSuccess());
  //     }
  //     catch(e){
  //       emit(FetchProfileDataLoading());
  //       final result = await profileRepoImpl.getProfile();
  //       result.fold(
  //             (failure) {
  //           emit(FetchProfileDataError(failure));
  //         },
  //             (response) async {
  //           profile = response;
  //           await CashHelper.setStringScoured(
  //               key: Keys.userId, value: response.id.toString() ?? '');
  //           CachedApp.saveData(profile,CachedDataType.profile.name);
  //           emit(FetchProfileDataSuccess());
  //         },
  //       );
  //     }
  //   }

  Future<void> deletUserAccount() async {
    emit(DeleteAccountLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await profileRepo.deletAccount();
      response.fold((error) {
        emit(DeleteAccountFailure(error));
      }, (profileData) {
        emit(DeleteAccountSuccess('Account deleted successfully'));
      });
      return;
    } else {
      emit(DeleteAccountFailure(
          ApiErrorModel(message: 'No internet connection')));
    }
  }

  Future<void> editProfile(ProfileModel profile) async {
    emit(EditProfileLoading());
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response =
          await profileRepo.featchProfileNew(editProfile: profile);
      response.fold((l) => emit(EditProfileFailure(l)), (r) async{
      profileUser=r;
        emit(EditProfileSuccess(editProfileResponse: r));
      });
    } else {
      // translate the message pls
      emit(
          EditProfileFailure(ApiErrorModel(message: 'No internet connection')));
    }
  }
  // Future<void> editProfileData(ProfileModel profile) async {
  //   emit(EditProfileDataLoading());
  //
  //   final result = await profileRepoImpl.editProfile(profile);
  //   result.fold(
  //         (failure) {
  //       emit(EditProfileDataError(failure));
  //     },
  //         (response) async {
  //
  //       profile = response;
  //       emit(EditProfileDataSuccess());
  //       getProfileData();
  //     },
  //   );
  // }
}
