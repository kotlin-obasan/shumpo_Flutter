import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shumpo_chaen/insta_top.dart';
import 'package:shumpo_chaen/qa.dart';
import 'package:shumpo_chaen/shopping.dart';
import 'package:shumpo_chaen/top.dart';

import 'insta.dart';
import 'membership_number.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ja', ''), // Japanese
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Noto Sans JP', // ここを追加
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _MyAppState();
}

class _MyAppState extends State<Home> {

  var _pages = <Widget>[
    InstaTop(),
    // InstaWebView(),
    QAPage(),
    TopPage(),
    ShoppingWebView(),
    MembershipPage(),
  ];

  int _selectedValue = 2;

  void _onTapped(int index) {
    setState(() {
      _selectedValue = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: _pages.elementAt(_selectedValue),
        // ),
        body: IndexedStack(
          index: _selectedValue,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.info), label: "お知らせ", backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer), label: "Q&A", backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "HOME", backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "ネット通販", backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "設定", backgroundColor: Colors.green),
          ],
          currentIndex: _selectedValue,
          onTap: _onTapped,
        ),
    );
  }
  
}