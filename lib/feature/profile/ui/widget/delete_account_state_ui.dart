
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/db/cash_helper.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/theming/colors.dart';
import '../../logic/profile_cubit.dart';

class DeleteAccountStateUi extends StatelessWidget {
  const DeleteAccountStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is  DeleteAccountLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColorLight,
              ),
            ),
          );
        } else if (state is  DeleteAccountSuccess) {
          CashHelper.clear();
          Navigator.pop(context);
          context.pushNamedAndRemoveUntil(
            Routes.loginScreen,
            predicate: (Route<dynamic> route) => false,
          );
          Fluttertoast.showToast(
            msg: "Account deleted successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: ColorsManager.primaryColorLight,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        } else if (state is  DeleteAccountFailure) {
          Navigator.pop(context); // Close loading dialog
          ShowDialogError.showErrorDialog(context, 'Error', state.error.message!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
