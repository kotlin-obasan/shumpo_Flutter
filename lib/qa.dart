import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shumpo_chaen/shopping.dart';

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  // 入力されたテキストをデータとして持つ
  String _membershipID = '';

  Future _loadID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _membershipID = (prefs.getString('id') ?? '');
    });
  }

  Future _saveID() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('id', _membershipID);
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
        title: Text('教えて！濃茶っぱくん'),
      ),
      //Fragmentにあたる部分
      body: Container(
        // 余白を付ける
        padding: EdgeInsets.all(64),
        child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 数字のみのテキスト入力フィールド
              TextField(
                //数字しばり
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                // 入力されたテキストの値を受け取る（valueが入力されたテキスト）
                onChanged: (String value) {
                  // データが変更したことを知らせる
                  setState(() {
                    // データを変更
                    _membershipID = value;
                  });
                }
              ),
              const SizedBox(height: 8),
              Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // リスト追加ボタン
                child: ElevatedButton(
                  child: Text('教えて！濃茶っぱくん', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 8,
                  ),
                  onPressed: () {
                    _saveID();
                    Navigator.of(context).pop();
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                // 横幅いっぱいに広げる
                width: double.infinity,
                // キャンセルボタン
                child: TextButton(
                // ボタンをクリックした時の処理
                onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
                ),
              ),
            ],
          ),
      ),
    );
  }
}