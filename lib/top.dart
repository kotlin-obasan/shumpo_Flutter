import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'membership_number.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  // 入力されたテキストをデータとして持つ
  String _membershipID = '';

  Future _loadID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _membershipID = (prefs.getString('id') ?? '');
      print("id: $_membershipID");
    });
  }

  @override
  void initState() {
    super.initState();
    _loadID();
  }

  @override
  Widget build(BuildContext context) {

    //ここから画面のコード
    return Scaffold(
      appBar: AppBar(
        // タイトルテキスト
        title: Text('春芳茶園アプリ'),
      ),
      //Fragmentにあたる部分
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('images/top.jpeg',),
            Text(
              '会員証番号',
              style: const TextStyle(fontSize: 20),
            ),
            //画像
            BarcodeWidget(
              barcode: Barcode.codabar(),
              data: _membershipID,
              width: 200,
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: null,
                  child: Text('バーコード削除'),
                ),
                ElevatedButton( //会員証追加画面に遷移
                  child: Text('会員証を追加'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MembershipPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 4,
                  ),
                ),
              ],
            ),
            Text('相談・お問い合わせはLINEでどうぞ')
          ]
        ),
      ),

    );
  }
}