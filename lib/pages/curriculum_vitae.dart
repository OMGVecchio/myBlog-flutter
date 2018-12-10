import 'package:flutter/material.dart';

const FULL_STAR = 5;

class CurriculumVitaePage extends StatelessWidget {
  List<Widget> _buildBodyCardList() {
    return [ SkillListWidget() ];
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      alignment: Alignment(0, 3),
                      children: <Widget>[
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //   image: AssetImage('assets/images/cats.gif'),
                            //   fit: BoxFit.fitWidth,
                            // ),
                            image: DecorationImage(
                              image: AssetImage('assets/images/one_piece_poster.jpg'),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/octocat.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: _buildBodyCardList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildDrawerItem() {
    final List<Widget> itemListWidget = [
      UserAccountsDrawerHeader(
        accountName: Text('Vecchio'),
        accountEmail: Text('vecchio.wc@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/images/octocat.png'),
          radius: 35.0,
        ),
      ),
    ];
    final List<Map> itemList = [{
      'text': 'facbook',
      'icon': Icons.book
    }, {
      'text': 'twitter',
      'icon': Icons.picture_as_pdf
    }, {
      'text': 'weibo',
      'icon': Icons.shopping_cart
    }, {
      'text': 'github',
      'icon': Icons.storage
    }];
    itemList.forEach((item) {
      itemListWidget.addAll([
        ListTile(
          title: Text(item['text']),
          leading: Icon(item['icon']),
        ),
      ]);
    });
    return itemListWidget;
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        children: _buildDrawerItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生涯'),
      ),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }
}

class SkillListWidget extends StatefulWidget {
  @override
  createState() => SkillListState();
}

class SkillListState extends State {
  final List<Map> skillList = [{
    'title': 'Skill',
    'isExpanded': true,
    'type': 1,
    'body': [{
      'title': 'Vue/Nuxt/Weex',
      'star': 4,
    }, {
      'title': 'React/Next/ReactNative',
      'star': 4,
    }, {
      'title': 'Flutter',
      'star': 4,
    }, {
      'title': 'Nodejs',
      'star': 4,
    }, {
      'title': 'Webpack',
      'star': 4,
    }],
  }, {
    'title': 'Experience',
    'isExpanded': false,
    'type': 2,
    'body': [{
      'period': '2016 ~ 今',
      'org': '重庆猪八戒网络有限公司',
      'desc': '工作期间，在八戒客、猪妈、八戒智投以及点击无忧中承担了主要研发工作，此外还开发了类商城的小程序应用；其中八戒客主要偏 H5 及公众号移动端开发；猪妈是以 Vue 为核心的内部数据管理系统；点击无忧则是以 Next 为基础的投放系统；八戒智投是基于 DMP 的 DSP 广告平台；此外，还参与了其它众多项目的迭代，大量使用 Node、Nuxt 及 Webpack。'
    }]
  }, {
    'title': 'Education',
    'isExpanded': false,
    'type': 3,
    'body': [{
      'period': '2012 ~ 2016',
      'school': 'CQUPT Bachelor Degree',
    }]
  }];

  List<Widget> _buildSkillItem(title, star) {
    List<Widget> itemContent = [ Text(title) ];
    if (star != null) {
      List<Widget> starList = List<Widget>.generate(FULL_STAR, (index) {
        if (index < star) {
          return Icon(Icons.star);
        }
        return Icon(Icons.star_border);
      });
      itemContent.add(Container(
        child: Row(
          children: starList,
        ),
      ));
    }
    return itemContent;
  }

  List<Widget> _buildBodyList(int type, List body) {
    List<Widget> bodyItem = <Widget>[
      ListTile(
        title: Text('暂无信息'),
      ),
    ];
    if (body == null) {
      return bodyItem;
    }
    switch(type) {
      // 技能
      case 1:
        bodyItem = body.map((item) => Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildSkillItem(item['title'], item['star']),
          ),
        )).toList();
        break;
      // 经验
      case 2:
        bodyItem = body.map((item) => ListTile(
          leading: Text(item['period']),
          title: Text(item['org']),
          subtitle: Text(item['desc']),
        )).toList();
        break;
      // 学历
      default:
        bodyItem = body.map((item) => ListTile(
          leading: Text(item['period']),
          title: Text(item['school']),
        )).toList();
    }
    return bodyItem;
  }

  List<ExpansionPanel> _buildBody() {
    return skillList.map((skill) {
      return ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: <Widget>[
                Icon(Icons.keyboard_capslock),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(skill['title']),
                ),
              ],
            ),
          );
        },
        body: Container(
          child: Column(
            children: _buildBodyList(skill['type'], skill['body']),
          ),
        ),
        isExpanded: skill['isExpanded'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (index, isExpanded) {
        setState(() {                  
          skillList[index]['isExpanded'] = !isExpanded;
        });
      },
      children: _buildBody(),
    );
  }
}
