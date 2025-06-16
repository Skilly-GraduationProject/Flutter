import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_windows/webview_windows.dart';

import '../../../../../../core/navigation/router_path.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final webviewController = WebviewController();
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    initWebView();
  }

  Future<void> initWebView() async {
    await webviewController.initialize();
    await webviewController.loadUrl(widget.paymentUrl);
    webviewController.url.listen((url) {
      print('URL changed: $url');
      if (url.contains('success=true')) {
        GoRouter.of(context).go(RouterPath.paymentSuccessView);
      }
    });

    setState(() {});
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? Webview(webviewController)
        : const Center(child: CircularProgressIndicator());
  }
}
