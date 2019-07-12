import 'package:flutter/material.dart';

import './run.dart';

// page_entry 中的页面切换直接使用的 stack，性能存在问题，在此模板中尝试下 TabBar+TabBarView+AutomaticKeepAliveClientMixin

class _TabChoice {
  final String title;
  final IconData icon;
  const _TabChoice({this.title, this.icon});
}

const List<_TabChoice> _tabChoiceList = <_TabChoice>[
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
  _TabChoice(title: '跑步',icon: Icons.directions_run),
  _TabChoice(title: '徒步', icon: Icons.directions_walk),
];

class SportsIndexPage extends StatefulWidget {
  @override
  createState() => _SportsIndexState();
}

class _SportsIndexState extends State {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('运动模块'),
          bottom: TabBar(
            isScrollable: true,
            tabs: _tabChoiceList.map((choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabChoiceList.map((choice) {
            return SportsRunPage();
          }).toList(),
        ),
      ),
      length: _tabChoiceList.length,
    );
  }
}
