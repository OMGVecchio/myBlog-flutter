import 'package:flutter/material.dart';

class CurriculumVitaePage extends StatelessWidget {
  List<Widget> _buildBodySkill() {
    // return [
    //   ListTile(
    //     title: Text('Vue/Nuxt/Weex'),
    //   ),
    //   ListTile(
    //     title: Text('React/Next/ReactNative'),
    //   ),
    //   ListTile(
    //     title: Text('Flutter'),
    //   ),
    //   ListTile(
    //     title: Text('Nodejs'),
    //   ),
    //   ListTile(
    //     title: Text('Webpack'),
    //   ),
    // ];
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
                            // )
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
    'title': 'Vue/Nuxt/Weex',
    'isExpanded': false,
  }, {
    'title': 'React/Next/ReactNative',
    'isExpanded': false,
  }, {
    'title': 'Flutter',
    'isExpanded': false,
  }, {
    'title': 'Nodejs',
    'isExpanded': false,
  }, {
    'title': 'Webpack',
    'isExpanded': false,
  }];

  List<ExpansionPanel> _buildSkillList() {
    return skillList.map((skill) {
      return ExpansionPanel(
        headerBuilder: (context, isExpanded) {
          return Text(skill['title']);
        },
        body: Text(skill['title']),
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
      children: _buildSkillList(),
    );
  }
}
