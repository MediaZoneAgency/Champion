import 'package:education/core/helpers/extensions.dart';
import 'package:education/feature/profile/ui/screen/progress_screen.dart';
import 'package:education/feature/profile/ui/widget/ui_loading_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/network_image.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theming_change/theme_cubit.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/ui/widget/cart_bar.dart';
import '../../logic/profile_cubit.dart';
import '../widget/guest_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   title: Text(
      //     S.of(context).profile,
      //     style: ThemeCubit.get(context).themeMode== ThemeMode.light ?
      //     TextStyles.poppinsMedium18contantGray: TextStyles.poppinsMedium18contantGray.copyWith(color:Colors.white),
      //   ),
      // ),

      body: Column(
        children: [
SizedBox(height: 20.h,),
          profileBar(username: S.of(context).profile),

          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Skeletonizer(
                  enabled: true,
                  child: UiLoadingProfile(),
                );
              } else if (state is ProfileSuccess) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.0.w),
                  child: Row(
                    children: [
                      AppCachedNetworkImage(
                        image: ProfileCubit.get(context).profileUser!.profilePicture,
                        width: 54,
                        height: 54,
                        radius: 200,
                      ),
                      horizontalSpace(17),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
              ProfileCubit.get(context).profileUser!.name!,
                            style: ThemeCubit.get(context).themeMode == ThemeMode.light
                                ? TextStyles.poppinsRegular16contantGray
                                : TextStyles.poppinsRegular16contantGray.copyWith(color: Colors.white),
                          ),
                          Text(
                            ProfileCubit.get(context).profileUser!.email!,
                            style: ThemeCubit.get(context).themeMode == ThemeMode.light
                                ? TextStyles.poppinsRegular16LightGray
                                : TextStyles.poppinsRegular16LightGray.copyWith(color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return GuestProfile();
              }
            },
          ),

          verticalSpace(15.h),
          Expanded(

            child: ListView(
              children: [
                ProfileCubit.get(context).token!=''?ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/notification (1).svg'),
                  text:S.of(context).Notifications,
                  onTap: () {},
                ):SizedBox(),

                ProfileCubit.get(context).token!=''?ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/editnew.svg'),
                  text: S.of(context).EditProfession,
                  onTap: () {
                    context.pushNamed(Routes.accountInfoScreen);
                  },
                ):SizedBox(),
                ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/message-questionneew.svg'),
                  text: S.of(context).GetHelp,
                  onTap: () {
                    context.pushNamed(Routes.chatSupprot);
                  },
                ),
                // ProfileMenuItem(
                //   icon: SvgPicture.asset('assets/img/terms  conditionsnw.svg'),
                //   text:S.of(context).TermsConditions,
                //   onTap: () {},
                // ),
                ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/provcynew.svg'),
                  text:S.of(context).PrivacyPolicy,
                 onTap: () async { // Make the callback async
  // Replace 'https://www.example.com' with the actual website URL
  final Uri websiteUri = Uri.parse('https://champion-edu.com/privacy-policy/');

  // Check if the URL can be launched (optional but recommended)
  if (await canLaunchUrl(websiteUri)) {
    try {
      // Attempt to launch the URL
      await launchUrl(
        websiteUri,
        mode: LaunchMode.externalApplication, // Opens in default browser outside the app
        // Other modes include:
        // LaunchMode.inAppWebView (requires platform setup)
        // LaunchMode.platformDefault
      );
    } catch (e) {
       // Handle potential errors during launch (less common for http/https URLs)
       print('Error launching URL: $e');
       // Show an error message to the user if needed
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $websiteUri')),
       );
    }
  } else {
    // Handle the case where the URL cannot be launched
    print('Could not launch $websiteUri');
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $websiteUri')),
     );
  }
},
                ),
                ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/progressnew.svg'),
                  text: S.of(context).AboutApp,
         // ... (Inside your Widget's build method or wherever the onTap is)

onTap: () async { // Make the callback async
  // Replace 'https://www.example.com' with the actual website URL
  final Uri websiteUri = Uri.parse('https://info@clustersplatform.com/');

  // Check if the URL can be launched (optional but recommended)
  if (await canLaunchUrl(websiteUri)) {
    try {
      // Attempt to launch the URL
      await launchUrl(
        websiteUri,
        mode: LaunchMode.externalApplication, // Opens in default browser outside the app
        // Other modes include:
        // LaunchMode.inAppWebView (requires platform setup)
        // LaunchMode.platformDefault
      );
    } catch (e) {
       // Handle potential errors during launch (less common for http/https URLs)
       print('Error launching URL: $e');
       // Show an error message to the user if needed
       ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $websiteUri')),
       );
    }
  } else {
    // Handle the case where the URL cannot be launched
    print('Could not launch $websiteUri');
     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $websiteUri')),
     );
  }
},

// ... (Rest of your widget code, e.g., the child of GestureDetector)
                ),
                ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/procircle.svg'),
                  text: S.of(context).Progress,
                  onTap: () {
 Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProgressScreen()),
        );
                  },
                ),
                ProfileMenuItem(
                  icon: SvgPicture.asset('assets/img/setting-2 (1).svg'),
                  text:S.of(context).Settings,
                  onTap: () {
                    context.pushNamed(Routes.settingsScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final Widget icon;
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        children: [
          ListTile(
            leading: icon,
            title: Text(text),
            onTap: onTap,
          ),
          Divider(color: ColorsManager.WhiteGray),
        ],
      ),
    );
  }
}
