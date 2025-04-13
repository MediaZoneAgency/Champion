import 'package:education/core/helpers/extensions.dart';
import 'package:education/core/theming/colors.dart';
import 'package:education/feature/splash/logic/splash_cubit.dart';

import 'package:flutter/material.dart';


import '../../../core/db/cash_helper.dart';
import '../../../core/network/dio_factory.dart';
import '../../../core/routes/routes.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and the sliding animation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),  // Adjust the duration as needed
    );

    slidingAnimation = Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero).animate(animationController);

    // Start the animation
    animationController.forward();

    // Navigate to home screen after animation
    _navigateToHome();
  }

 _navigateToHome() async {
Future.delayed(const Duration(seconds: 5), () async {
      WidgetsFlutterBinding.ensureInitialized();
      String? token = await CashHelper.getStringSecured(key: Keys.token);
     // print(token);
      //context.pushReplacementNamed(Routes.welcome);
      //  DioFactory.setTokenIntoHeaderAfterLogin(response.token!);
    if(  token == null){
      context.pushReplacementNamed(Routes.navBarScreen);
    }else{
      if(await SplashCubit.get(context).checkToken(token)){
        print(await SplashCubit.get(context).checkToken(token));
          await CashHelper.clear();
        
        context.pushReplacementNamed(Routes.signUpScreen);
      }else{
        DioFactory.setTokenIntoHeaderAfterLogin(token);
     
       context.pushReplacementNamed(Routes.navBarScreen);
      } 
        //   .then((value) {
        // if (value) {
        //   context.pushReplacementNamed(Routes.welcome);
        // }
     // });

    }


    });
}


  @override
  void dispose() {
    // Dispose the animation controller to free up resources
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center(
        // Apply the SlideTransition to the image
        child: SlideTransition(
          position: slidingAnimation,
          child:Center(
            child: Image.asset(
              'assets/img/champion-03.png', // مسار الصورة الخاصة بك
              fit: BoxFit.cover,
            ),
          ),


        ),
      ),
    );
  }
}
