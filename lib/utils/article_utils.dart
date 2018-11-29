class ArticleUtils {
  static const String host = 'http://127.0.0.1:3000';

  static const String defaultCoverUrl = '${ArticleUtils.host}/images/cover/wallhaven-851_1537242430407.jpg';

  static String getCoverUrl(String coverUrl) {
    RegExp exp = RegExp('^(https?:)?//');
    String articleCover = (coverUrl != null && coverUrl != '')
      ? exp.hasMatch(coverUrl)
        ? coverUrl
        : (ArticleUtils.host + coverUrl)
      : ArticleUtils.defaultCoverUrl;
    return articleCover;
  }
}
