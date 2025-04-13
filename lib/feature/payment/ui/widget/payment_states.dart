
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/show_dialog_error.dart';
import '../../../../core/theming/colors.dart';

import '../../../nav_bar/logic/nav_bar_cubit.dart';
import '../../logic/payment_cubit.dart';

class PaymentStateUi extends StatelessWidget {
  const PaymentStateUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit,PaymentState>(
      listener: (context, state) async {
        if (state is PaymentLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => PopScope(
              child: Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryBlueLight,
                ),
              ),
            ),
          );
        }
        // Handle LoginSuccess state
        else if (state is PaymentSuccess) {

          if (Navigator.canPop(context)) {
            Navigator.of(context).pop();
           context.pushNamed(Routes.paymentScreen);
          }
        }

        // Handle LoginError and show the dialog here
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ShowDialogError.showErrorDialog(
              context,
              "attention", // Pass the "attention" title here
              "Payment Failed",
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}