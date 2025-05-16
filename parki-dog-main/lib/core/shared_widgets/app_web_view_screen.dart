import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebViewScreen extends StatefulWidget {
  final String initialUrl;

  const AppWebViewScreen({super.key, required this.initialUrl});

  @override
  State<AppWebViewScreen> createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<AppWebViewScreen> {
  late final WebViewController _controller;
  PlatformWebViewControllerCreationParams params =
      const PlatformWebViewControllerCreationParams();

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          // Handle navigation events (optional)
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith('https://www.youtube.com/')) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },
        ),
      )
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('app bar web view')),
      body: WebViewWidget(controller: _controller),
    );
  }
}
