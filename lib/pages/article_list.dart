import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'article_detail.dart';
import '../utils/article_utils.dart';

Dio dio = Dio();

class ArticleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ArticleList();
  }
}

class ArticleList extends StatefulWidget {
  @override
  createState() => ArticleListState();
}

class ArticleListState extends State {
  final articleList = [];
  final articleTags = [];
  var realArticleList = [];
  ArticleListState() {
    this._fetchArticleData();
  }
  void _fetchArticleData() async {
    Response listRes = await dio.get('${ArticleUtils.host}/api/article');
    Response tagsRes = await dio.get('${ArticleUtils.host}/api/tags');
    setState(() {
      articleList.addAll(listRes.data['data']);
      articleTags.addAll(tagsRes.data['data']);
      realArticleList = articleList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章列表'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (tag) {
              setState(() {
                var newArticleList = [];
                articleList.forEach((article) {
                  var tags = article['tags'];
                  if (tags == null || (tags != null && tags.length != 0 && tags.indexOf(tag) != -1)) {
                    newArticleList.add(article);
                  }
                });
                setState(() {
                  realArticleList = newArticleList;
                });
              });
            },
            itemBuilder: (context) {
              return articleTags.map((tag) {
                return PopupMenuItem(
                  // value 是 onSelected 里选中的值
                  value: tag,
                  child: Text(tag),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: realArticleList.length,
        itemBuilder: (ctx, i) {
          if (i < realArticleList.length) {
            final articleInfo = realArticleList[i];
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
      ),
    );
  }
}
