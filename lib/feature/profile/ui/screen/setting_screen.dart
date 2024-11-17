import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/db/cached_app.dart';
import '../../../../core/db/cash_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/network/dio_factory.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/sharedWidgets/app_text_button.dart';
import '../../../../core/sharedWidgets/custom_cart_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widget/country_list_tile.dart';
import '../widget/language_list_tile.dart';
import '../widget/setting_item_list_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              CustomAppBar( title: S.of(context).Setting),
              verticalSpace(20),
        
               
                SettingItemListTile(title: S.of(context).ChangePassword,onTap: () {
                  context.pushNamed(Routes.resetPasswordScreen);
                  }),
                const Divider(),
                SwitchListTile(
                  title: Text(S.of(context).PushNotifications, style: TextStyles.poppinsMedium16BlackMeduim,),
                  activeTrackColor: ColorsManager.primaryColorLight,
                  value: true, onChanged:(value) {
                },),
                const Divider(),
               LanguageListTile(),
                const Divider(),
                const CountrylistTile(),
                const Divider(),
                SettingItemListTile(title: S.of(context).DeleteAccount,onTap: () {
                  context.pushNamed(Routes.deleteAccountScreen);
                }),
                const Divider(),
        
              Spacer(),
                AppTextButton(
                        buttonText: S.of(context).Logout,
                        textStyle: TextStyles.poppinsMedium20white,
                        verticalPadding: 3,
                        buttonHeight: 55,
                        onPressed: () async {
                          DioFactory.removeTokenIntoHeaderAfterLogout();
                          await  CashHelper.clear();
                         CachedApp.clearCache();
                          context.pushNamedAndRemoveUntil(Routes.loginScreen, predicate: (Route<dynamic> route) { return false; });
                        },
                      ),
            ],
          ),
        ),
      ),
    );
  }
}