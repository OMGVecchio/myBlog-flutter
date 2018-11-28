import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

Dio dio = Dio();

class ArticleDetailPage extends StatelessWidget {
  final articleId;
  ArticleDetailPage(this.articleId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文章详情'),
      ),
      body: ArticleDetail(this.articleId),
    );
  }
}

class ArticleDetail extends StatefulWidget {
  final articleId;
  ArticleDetail(this.articleId);
  @override
  createState() => ArticleDetailState(this.articleId);
}

class ArticleDetailState extends State {
  final articleId;
  Map articleDetail;
  ArticleDetailState(this.articleId) {
    this._fetchArticleDetail();
  }
  void _fetchArticleDetail() async {
    // Response res = await dio.get('https://vecchio.top/api/article/${this.articleId}');
    Response res = await dio.get('https://vecchio.top/api/article/f24be360-9bac-11e8-af01-d933a8a0c468');
    setState(() {
      articleDetail = res.data['data'];
    });
  }
  @override
  Widget build(BuildContext context) {
    if (articleDetail == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              articleDetail['title'],
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(DateTime.fromMillisecondsSinceEpoch(articleDetail['createTime']).toString()),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 8.0, 0, 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  articleDetail['desc'],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Text(
                articleDetail['article'].toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
