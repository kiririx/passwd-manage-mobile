import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/widgets.dart';

class ShareData {
  ShareData({required this.theme});

  // 全局主题
  ThemeGlobal theme;
}

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({Key? key, required this.data, required Widget child})
      : super(key: key, child: child);

  final ShareData data;

  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }

  static ShareDataWidget? of(BuildContext context) {
    var wd = context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
    return wd;
  }
}
