import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'article_detail.dart';
import '../utils/article_utils.dart';

Dio dio = Dio();

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章列表'),
      ),
      body: ArticleList(),
    );
  }
}

class ArticleList extends StatefulWidget {
  @override
  createState() => ArticleListState();
}

class ArticleListState extends State {
  final articleList = [];
  ArticleListState() {
    this._fetchArticleList();
  }
  void _fetchArticleList() async {
    Response res = await dio.get('https://vecchio.top/api/article');
    setState(() {
      articleList.addAll(res.data['data']);  
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: articleList.length,
      itemBuilder: (ctx, i) {
        if (i < articleList.length) {
          final articleInfo = articleList[i];
          final coverUrl = articleInfo['cover'];
          final articleCover = ArticleUtils.getCoverUrl(coverUrl);
          return Card(
            child: Column(
              children: <Widget>[
                Center(
                  child: Image.network(
                    articleCover,
                    fit: BoxFit.fitHeight,
                    height: 200,
                  ),
                ),
                ListTile(
                  title: Text(articleInfo['title']),
                  subtitle: Text(articleInfo['desc']),
                  onTap: () {
                    // Navigator.pushNamed(context, '/article');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => ArticleDetailPage(articleInfo['id']),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
