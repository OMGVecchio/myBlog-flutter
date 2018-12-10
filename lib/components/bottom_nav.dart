// 已废弃，此组件要单独加在每个 Page 下，会在切换页面时重新渲染底部 Tabbar，体验不友好
import 'package:flutter/material.dart';

class SelfBottomNav extends StatelessWidget {
  final int index;

  SelfBottomNav({ @required this.index });
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) {
        switch (index) {
          case 1:
            Navigator.pushReplacementNamed(context, '/');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cv');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/');
        }
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
}
