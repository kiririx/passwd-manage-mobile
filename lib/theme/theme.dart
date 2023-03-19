// in main page center, a content widget's theme is there.
import 'dart:ui';

enum ThemeContent {
  orange(
      topicColor: Color(0xffF09825),
      contentColor: Color(0xffF09825),
      borderColor: Color(0xffF2D085),
      backgroundColor: Color(0xffffefcc)),
  pink(
      topicColor: Color(0xffEA6071),
      contentColor: Color(0xffEA6071),
      borderColor: Color(0xffF7A7B1),
      backgroundColor: Color(0xffFDDFE2)),
  purple(
      topicColor: Color(0xffA368F9),
      contentColor: Color(0xffA368F9),
      borderColor: Color(0xffC7A9F2),
      backgroundColor: Color(0xffE9DFF7));

  const ThemeContent(
      {required this.topicColor,
      required this.contentColor,
      required this.backgroundColor,
      required this.borderColor});

  // the topic text color
  final Color topicColor;

  // the content text color
  final Color contentColor;

  // background color
  final Color backgroundColor;

  final Color borderColor;
}

enum ThemeGlobal {
  orange(
      topBarColor: Color(0xffffefcc),
      bodyColor: Color(0xffFFF5E9),
      topBarTextColor: Color(0xff000000),
      bottomColor: Color(0xffffefcc),
      bottomIconSelectedColor: Color(0xffF09825),
      topBarIconColor: Color(0xff000000)),
  white(
      topBarColor: Color(0xffffffff),
      bodyColor: Color(0xffffffff),
      topBarTextColor: Color(0xff000000),
      bottomColor: Color(0xffffffff),
      bottomIconSelectedColor: Color(0xff000000),
      topBarIconColor: Color(0xff000000)),
  black(
      topBarColor: Color(0xff000000),
      bodyColor: Color(0xff000000),
      topBarTextColor: Color(0xffffffff),
      bottomColor: Color(0xff000000),
      bottomIconSelectedColor: Color(0xff000000),
      topBarIconColor: Color(0xffffffff));

  const ThemeGlobal(
      {required this.topBarColor,
      required this.bodyColor,
      required this.bottomColor,
      required this.topBarTextColor,
      required this.topBarIconColor, required this.bottomIconSelectedColor});

  /// topBar颜色
  final Color topBarColor;
  /// 底部颜色
  final Color bottomColor;
  /// body颜色
  final Color bodyColor;
  /// 顶部文本颜色
  final Color topBarTextColor;
  /// 顶部图标颜色
  final Color topBarIconColor;
  /// 底部图标选中颜色
  final Color bottomIconSelectedColor;
  /// 个人中心
  // final Color personalCenter;
}
