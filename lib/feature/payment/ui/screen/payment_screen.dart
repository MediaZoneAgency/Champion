
import 'package:education/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../../core/routes/routes.dart';

import '../../../../main.dart';
import '../../logic/payment_cubit.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startPayment();
  }
  void startPayment(){
    webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri.uri(Uri.parse('https://accept.paymob.com/api/acceptance/iframes/897437?payment_token=${PaymentCubit.get(context).paymentKey}'))));

  }
  InAppWebViewController? webViewController ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InAppWebView(
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(javaScriptEnabled: true),
      ),
          onWebViewCreated: (controller){
        webViewController=controller;
        startPayment();
          },
          onTitleChanged: (controller, title) {
            if (title != null) {
              print("Page title changed: $title");

              if (title.toLowerCase().contains("Paymob.accept")) {
                print("Payment Success!");
                //Navigator.pop(context, true);
               // NavigationService.navigatorKey.currentContext!.pushReplacementNamed(Routes.trackOrder);// Return failure status

              } else if (title.toLowerCase().contains("failure") || title.toLowerCase().contains("declined")) {
                print("Payment Failed!");
                Navigator.pop(context);
              }
            }
          },

            onLoadStop: (controller, url) async {
              String urlString = url.toString(); // Convert WebUri to String

              if (urlString.contains("confirmation")) {
                print("Payment Success! URL: $urlString");
context.pop();
              //  context.pushReplacementNamed(Routes.trackOrder);
                // Handle success: Close WebView or navigate
              }
            },
          onProgressChanged: (controller, progress) async {
            if (progress == 100) {
              WebUri? currentUrl = await controller.getUrl();

              if (currentUrl != null && currentUrl.toString().contains("mpgs_secure_callback")) {
                print("Payment Success! URL: ${currentUrl.toString()}");

                // Handle success: Close WebView or navigate
              }
            }
            else {

            }
          },

        )
    );
  }
}
