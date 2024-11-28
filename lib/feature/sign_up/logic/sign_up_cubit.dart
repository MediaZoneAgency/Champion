import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/db/cash_helper.dart';
import '../../../core/network/dio_factory.dart';
import '../data/models/register_model.dart';
import '../data/models/register_response.dart';
import '../data/repo/sign_up_repo.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authService) : super(SignUpInitial());
  final SignUpRepo authService;
  static SignUpCubit get(context) => BlocProvider.of(context);
  bool? isChecked = false;
  String signUpPhone="" ;
  int index = 0;

  bool isObscureText1 = true;
  bool isObscureText2 = true;


  void obscureText1() {
    isObscureText1 = !isObscureText1;
    emit(ObscureText1());
  }

  void obscureText2() {
    isObscureText2 = !isObscureText2;
    emit(ObscureText2());
  }
  void changeSignUpPhone(String newPhone) {
    signUpPhone = newPhone;
    // emit(ChangePhone());
  }
  void changeCheckboxValue(bool newIsChecked) {
    isChecked = newIsChecked;
    emit(ChangeCheckboxValue());
  }



  Future<void> signUp(RegisterRequestModel signUpModel) async {
  emit(SignUpLoading());
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  if (!connectivityResult.contains(ConnectivityResult.none)) {
    final response = await authService.register(signUpModel);
    response.fold(
            (l) => emit(SignUpFailed(message: l.message)),
            (r)  async {

              DioFactory.setTokenIntoHeaderAfterLogin(r.token!);
          CashHelper.setStringSecured(
            key: Keys.signUpResponse,
            value: r.toJson(),
          );
          CashHelper.setStringSecured(
            key: Keys.token,
            value: r.message!,
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