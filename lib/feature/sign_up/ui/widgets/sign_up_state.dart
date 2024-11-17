import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Utils/color_manager.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';


class SignUpStateUi extends StatelessWidget {
  const SignUpStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
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
        } else if (state is SignUpSuccess &&
           SignUpCubit.get(context).isChecked == true){
          Navigator.pop(context);
          context.pushNamedAndRemoveUntil(
            Routes.navBarScreen,
            predicate: (Route<dynamic> route) => false,
          );
        } else if (state is SignUpFailed) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(context, 'Error', state.message);
        }  else {}
      },
      child: const SizedBox.shrink(),
    );
  }
}
