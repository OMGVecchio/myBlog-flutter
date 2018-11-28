const String defaultCoverUrl = 'https://vecchio.top/images/cover/wallhaven-851_1537242430407.jpg';

class ArticleUtils {
  static String getCoverUrl(String coverUrl) {
    RegExp exp = RegExp('^(https?:)?//');
    String articleCover = coverUrl != null
      ? exp.hasMatch(coverUrl)
        ? coverUrl
        : 'https://vecchio.top${coverUrl}'
      : defaultCoverUrl;
    return articleCover;
  }
}
