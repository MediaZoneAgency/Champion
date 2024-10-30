import 'package:bloc/bloc.dart';
import 'package:education/feature/sign_in/data/repo/signin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../core/helpers/cash_helper.dart';
import '../data/models/log_in_respone.dart';
import '../data/models/login_model.dart';
part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authService) : super(SignInInitial());
 final SignInRepo authService;

  static SignInCubit get(context) => BlocProvider.of(context);
  bool isObscureText1 = true;
  bool isObscureText2 = true;
  bool? isChecked = false;
  String logInPhone=" ";

  void changeLogInPhone(String newPhone) {
    logInPhone = newPhone;
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


  Future<void> login( LogInModel loginModel) async {
    emit(SignInLoading());
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      final response = await authService.login(loginModel);
      response.fold(
            (r) => emit(SignInFailed(message: r.message)),
            (r) {
          // Save sign-in response securely
          CashHelper.setStringSecured(
            key: Keys.signInResponse,
            value: r.toJson(),
          );
          CashHelper.setStringSecured(
            key: Keys.token,
            value: r.token!,
          );
          emit(SignInSuccess(signInResponse: r));
          print('saved ${r.toJson()}');
        },
      );
    } else {
      emit(SignInFailed(message: 'No internet connection.'));
    }
  }


}
