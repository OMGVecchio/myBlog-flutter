import 'package:flutter/material.dart';

import 'pages/article_list.dart';
import 'pages/curriculum_vitae.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: ArticleListPage(),
      routes: <String, WidgetBuilder> {
        '/cv': (BuildContext ctx) => CurriculumVitae()
      },
    );
  }
}
