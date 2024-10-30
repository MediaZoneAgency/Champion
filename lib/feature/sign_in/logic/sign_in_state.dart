part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {

}

final class SignInInitial extends SignInState {}
final class SignInSuccess extends SignInState {
  final LoginResponseModel signInResponse;
  SignInSuccess({required this.signInResponse});
}
final class SignInLoading extends SignInState {
}

final class ObscureText1 extends SignInState {}

final class ObscureText2 extends SignInState {}

final class ChangeCheckboxValue extends SignInState {}



final class SignInFailed extends SignInState {
  final String message;
  SignInFailed({required this.message});
}