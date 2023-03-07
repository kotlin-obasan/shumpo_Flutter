import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ShoppingWebView extends StatefulWidget {
  @override
  ShoppingWebViewState createState() => ShoppingWebViewState();
}

class ShoppingWebViewState extends State<ShoppingWebView> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            progress < 1.0 ? LinearProgressIndicator(value: progress) : SizedBox.shrink(),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://syunpou.com/")),
                onProgressChanged: (_, int progress) {
                  setState(() {
                    this.progress = progress / 100;
                  });
                },
              ),
            ),
          ]
        )
      ),
    );
  }
}