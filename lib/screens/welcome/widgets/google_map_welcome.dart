import 'package:date_app/widgets/condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GoogleMapWelcome extends StatefulWidget {
  const GoogleMapWelcome({super.key});

  @override
  State<GoogleMapWelcome> createState() => _GoogleMapWelcomeState();
}

class _GoogleMapWelcomeState extends State<GoogleMapWelcome> {
  late WebViewController _webViewController;
  bool _showDialog = true;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/maps')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(
          '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3715.581404132864!2d105.3180187750413!3d21.367000280368355!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31349223310aed35%3A0xc2395308e6d79544!2zxJDhu4FuIEjDuW5n!5e0!3m2!1svi!2s!4v1727496980064!5m2!1svi!2s" width="100%" height="100%" style="border:0;" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConditionWidget(
          condition: _showDialog,
          tWidget: SizedBox(
            height: 300,
            child: AlertDialog(
              elevation: 3,
              shadowColor: Colors.amber,
              title: const Text('Allow access location?'),
              actions: [
                TextButton(onPressed: () {}, child: const Text('No')),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showDialog = false;
                    });
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          ),
          fWidget: WebViewWidget(controller: _webViewController),
        ),
      ),
    );
  }
}
