class Utils {
  static formatTime (int timeStamp) {
    DateTime dt = new DateTime.fromMillisecondsSinceEpoch(timeStamp);
    return dt.toString();
  }
}
