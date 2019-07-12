import 'package:flutter/material.dart';

// 底部 Tabbar 映射到的所有 Page
import 'article/article_list.dart';
import 'sports/index.dart';
import 'curriculum_vitae.dart';

class PageEntry extends StatefulWidget {
  @override
  createState() => _PageEntryState();
}

class _PageEntryState extends State {
  int _index = 0;
  final _body = [
    ArticleListPage(),
    SportsIndexPage(),
    CurriculumVitaePage(),
  ];

  // 插入渲染树时调用，只调用一次
  @override
  void initState() {
    super.initState();
  }

  // state 依赖的对象发生变化时调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  // 组件状态改变时候调用，可能会调用多次
  @override
  void didUpdateWidget(StatefulWidget widget) {
    super.didUpdateWidget(widget);
  }

  // 当移除渲染树的时候调用
  @override
  void deactivate() {
    super.deactivate();
  }

  // 组件即将销毁时调用
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        /** 页面无法持久化 */
        // body: _body[_index],

        /** 报错 */
        // body: IndexedStack(
        //   index: _index,
        //   children: _body,
        // ),

        /** 保持页面持久化，但是会实例化所有子页面，性能开销有问题。而且这里不能提出成一个函数返回值？ */
        /** 高效的页面持久化方案见 pages/sports */
        body: Stack(
          children: [
            Offstage(
              offstage: _index != 0,
              child: _body[0],
            ),
            Offstage(
              offstage: _index != 1,
              child: _body[1],
            ),
            Offstage(
              offstage: _index != 2,
              child: _body[2],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int index) {
            setState(() {
              _index = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text('Blog'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              title: Text('Sports'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              title: Text('Cv'),
            ),
          ],
        ),
      ),
    );
  }
}
