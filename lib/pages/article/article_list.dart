import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'article_detail.dart';
import '../../utils/article_utils.dart';

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
              if (tag == 'all-unique') {
                setState(() {
                  realArticleList = articleList;
                });  
              } else {
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
              }
            },
            itemBuilder: (context) {
              var tagItemList = [
                PopupMenuItem(
                  value: 'all-unique',
                  child: Text('全部'),
                )
              ];
              tagItemList.addAll(articleTags.map((tag) {
                return PopupMenuItem(
                  // value 是 onSelected 里选中的值
                  value: tag,
                  child: Text(tag),
                );
              }));
              return tagItemList;
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => ArticleDetailPage(articleInfo['id']),
                  ),
                );
              },
              child: Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            articleCover,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      title: Text(articleInfo['title']),
                      subtitle: Text(articleInfo['desc']),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
