import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InstaWebView extends StatefulWidget {
  @override
  InstaWebViewState createState() => InstaWebViewState();
}

class InstaWebViewState extends State<InstaWebView> {
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // タイトルテキスト
      //   title: Text('公式通販サイト'),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            progress < 1.0 ? LinearProgressIndicator(value: progress) : SizedBox.shrink(),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(url: Uri.parse("https://www.instagram.com/shumpo_special_japanese_tea/")),
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