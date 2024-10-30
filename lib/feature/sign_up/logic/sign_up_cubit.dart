import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/helpers/cash_helper.dart';
import '../data/models/register_model.dart';
import '../data/models/register_response.dart';
import '../data/repo/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authService) : super(SignUpInitial());
  final SignUpRepo authService;
  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isObscureText1 = true;
  bool isObscureText2 = true;
  bool? isChecked = false;
  String signUpPhone="" ;
  int index = 0;

  void changeSignUpPhone(String newPhone) {
    signUpPhone = newPhone;
    // emit(ChangePhone());
  }
  void obscureText1() {
    isObscureText1 = !isObscureText1;
    emit(ObscureText1());
  }

  void obscureText2() {
    isObscureText2 = !isObscureText2;
    emit(ObscureText2());
  }

  void changeCheckboxValue(bool newIsChecked) {
    isChecked = newIsChecked;
    emit(ChangeCheckboxValue());
  }



  Future<void> signUp(RegisterModel signUpModel) async {
  emit(SignUpLoading());
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  if (!connectivityResult.contains(ConnectivityResult.none)) {
    final response = await authService.register(signUpModel);
    response.fold(
            (l) => emit(SignUpFailed(message: l.errors)),
            (r)  {
          // Save sign-in response securely
          CashHelper.setStringSecured(
            key: Keys.signUpResponse,
            value: r.toJson(),
          );
          CashHelper.setStringSecured(
            key: Keys.token,
            value: r.token,
          );
          emit(SignUpSuccess(signUpResponse: r));
          print('saved ${r.toJson()}');
        }
    );
  } else {
    emit(SignUpFailed(message: 'No internet connection.'));
  }
}
  void focusNextField(BuildContext context) {
    if (index < 4) {
      FocusScope.of(context).nextFocus();
    }
  }

  void focusPreviousField(BuildContext context) {
    if (index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }
}