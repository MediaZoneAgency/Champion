import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Utils/color_manager.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/utils/routes.dart';

import '../../logic/sign_in_cubit.dart';


class SignInStateUi extends StatelessWidget {
  const SignInStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>const PopScope(
              canPop: false,
              child:  Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primaryColor,
                ),
              ),
            ),
          );
        } else if (state is SignInSuccess) {
          Navigator.pop(context);
          context.pushNamedAndRemoveUntil(Routes.navBarScreen, predicate: (Route<dynamic> route) { return false; });
          
        } else if (state is SignInFailed) {

          Navigator.pop(context);
          print("lllll");

          ShowDialogError.showErrorDialog(context, 'Error', state.message);
        }  else {}
      },
      child: const SizedBox.shrink(),
    );
  }
}
