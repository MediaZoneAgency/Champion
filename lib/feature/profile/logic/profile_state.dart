part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {

}
final class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure( this.message);
}
final class ObscureText1 extends ProfileState {}

final class ObscureText2 extends ProfileState {}
final class CountrySelected extends ProfileState {
  final String country;
  CountrySelected(this.country);
}

final class DeleteAccountLoading extends ProfileState {}

final class  DeleteAccountSuccess extends ProfileState {
  final String message;
  DeleteAccountSuccess(this.message);
}

final class  DeleteAccountFailure extends ProfileState {
  final ApiErrorModel error;
  DeleteAccountFailure(this.error);
}

final class EditProfileLoading extends ProfileState {}

final class EditProfileSuccess extends ProfileState {
  final  EditProfileResponse editProfileResponse;
  EditProfileSuccess({required this.editProfileResponse});
}

final class EditProfileFailure extends ProfileState {
  final ApiErrorModel error;
  EditProfileFailure( this.error);
}

