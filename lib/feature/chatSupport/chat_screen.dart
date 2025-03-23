import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class WebViewChat extends StatefulWidget {
  @override
  _WebViewChatState createState() => _WebViewChatState();
}

class _WebViewChatState extends State<WebViewChat> {
  InAppWebViewController? webViewController;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: InAppWebView(

          initialUrlRequest: URLRequest(
            url: WebUri("https://tawk.to/chat/67ab1f923a842732607cecd1/1ijq76mqq"), // Replace with your Tawk.to link
          ),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
              useHybridComposition: true,
            ),
            ios: IOSInAppWebViewOptions(
              allowsInlineMediaPlayback: true,
            ),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
