
import 'package:education/core/theming/colors.dart';
import 'package:education/feature/sign_in/logic/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/sharedWidgets/show_dialog_error.dart';
class ResendCodeStateUi extends StatelessWidget {
  const ResendCodeStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is ResendCodeLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color:ColorsManager.darkColor,
              ),
            ),
          );
        } else if (state is  ResendCodeSuccess) {
          Navigator.pop(context);
        } else if (state is ResendCodeFailure) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
