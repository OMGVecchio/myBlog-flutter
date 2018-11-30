import 'package:flutter/material.dart';

const FULL_STAR = 5;

class CurriculumVitaePage extends StatelessWidget {
  List<Widget> _buildBodySkill() {
    return [
      SkillListWidget()
    ];
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
                  children: _buildBodySkill(),
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
      'title': '2016~，ZBJ'
    }]
  }, {
    'title': 'Education',
    'isExpanded': false,
    'type': 3,
  }];

  List<Widget> _buildSkillItem(title, star) {
    List<Widget> itemContent = [
      Text(title)
    ];
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
        bodyItem = body.map((bodyItem) {
          return Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildSkillItem(bodyItem['title'], bodyItem['star']),
            ),
          );
        }).toList();
        break;
        // 经验
        case 2:
          bodyItem = [Text('经验')];
          break;
        // 学历
        default:
          bodyItem = [Text('学历')];
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
