
import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/sign_in/logic/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/theming/colors.dart';
class OtpStateUi extends StatelessWidget {
  const OtpStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is OtpLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.black,
              ),
            ),
          );
        } else if (state is OtpSuccess) {
          Navigator.pop(context);
          context.pushNamed(Routes.resetPasswordScreen);
        } else if (state is OtpFailure) {
          Navigator.pop(context);
          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
