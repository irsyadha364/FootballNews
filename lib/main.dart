// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:football_news/models/news_model.dart';
import 'package:football_news/data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'MyApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  _buildNews() {
    List<Widget> newsList = [];
    newsData.forEach((News news) {
      newsList.add(
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(1),
          color: Colors.green,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    news.image,
                    fit: BoxFit.contain,
                    width: MediaQuery.of(context).size.width * 0.45,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.all(1),
                    color: Colors.white,
                    height: 97,
                    width: MediaQuery.of(context).size.width * 0.539,
                    alignment: Alignment.centerLeft,
                    child: Text(news.description),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(14),
                width: double.infinity,
                color: Colors.white,
                child: Text(
                  news.title,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
    return Column(
      children: newsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  'BERITA TERBARU',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  'PERTANDINGAN HARI INI',
                  style: TextStyle(fontSize: 14),
                  ),
              ],
            ),
          ),
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: Colors.purpleAccent,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'images/img1.jpg',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        color: Colors.white,
                        child: const Center(
                          child: Text(
                            'Costa Mendekat Ke Palmeiras',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        width: double.infinity,
                        child: const Text(
                          'Transfer'
                        ),
                      )
                    ],
                  ),
                ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildNews()
             ],
            ),
          ),
        ],
      ),
    );
  }
}