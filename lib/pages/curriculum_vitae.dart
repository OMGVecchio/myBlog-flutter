import 'package:flutter/material.dart';

class CurriculumVitaePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('生涯'),
      ),
      body: ListView(
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
                              image: DecorationImage(
                                image: AssetImage('assets/images/cats.gif'),
                                fit: BoxFit.fitWidth,
                              )
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
                    children: <Widget>[
                      ListTile(
                        title: Text('Vue/Nuxt/Weex'),
                      ),
                      ListTile(
                        title: Text('React/Next/ReactNative'),
                      ),
                      ListTile(
                        title: Text('Flutter'),
                      ),
                      ListTile(
                        title: Text('Nodejs'),
                      ),
                      ListTile(
                        title: Text('Webpack'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
