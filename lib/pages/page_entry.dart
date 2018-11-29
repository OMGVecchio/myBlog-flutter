import 'package:flutter/material.dart';

// 底部 Tabbar 映射到的所有 Page
import 'article/article_list.dart';
import 'curriculum_vitae.dart';

class PageEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageEntryWidget();
  }
}

class PageEntryWidget extends StatefulWidget {
  @override
  createState() => PageEntryState();
}

class PageEntryState extends State {
  var _index = 0;
  var _body = [
    ArticleListPage(),
    null,
    CurriculumVitaePage()
  ];

  Widget getBottomNav(int index) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        setState(() {
          _index = index;
        });
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(Icons.book),
          title: new Text('Blog'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.image),
          title: new Text('没开通'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.work),
          title: new Text('CV'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        body: _body[_index],
        bottomNavigationBar: getBottomNav(_index),
      ),
    );
  }
}
