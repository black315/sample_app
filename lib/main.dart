import 'package:flutter/material.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // "debug"ラベル非表示
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'Sample App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // ホーム画面を表示
      home: HomePage(),
    );
  }
}

// ホーム画面用Widget
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample app'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(list[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final addedText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return AddPage();
            }),
          );
          if (addedText != null) {
            setState(() {
              list.add(addedText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// 追加画面用Widget
class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample app'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(_input, style: TextStyle(color: Colors.blue)),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _input = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              // 追加ボタン
              child: RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop(_input);
                },
                child: Text('add', style: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: double.infinity,
              // キャンセルボタン
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop(_input);
                },
                child: Text('cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}