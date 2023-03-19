import 'package:passwd_manage_mobile/const/time_dimension.dart';
import 'package:passwd_manage_mobile/page/edit.dart';
import 'package:passwd_manage_mobile/page/personal_center.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Map<String, WidgetBuilder> routes;
//
// void initRoutes() {
//   routes = {
//     "edit_page": (context) => AddOrEditPage()
//   }
// }

// var RouteAddOrEditPage = MaterialPageRoute(builder: (ctx) {
//   return AddOrEditPage(theme: globalTheme);
// });

/// 添加/编辑页面
routeAddOrEditPage(ThemeGlobal theme, TimeDimension timeDimension,
    { String topBarLabel = "新建条目",
    required String title,
    required String content}) {
  return MaterialPageRoute(builder: (ctx) {
    return AddOrEditPage(
      theme: theme,
      topBarLabel: topBarLabel,
      title: title,
      content: content,
    );
  });
}

/// 个人中心
routePersonalCenter() {
  return MaterialPageRoute(builder: (ctx) => const PersonalCenter());
}

/// 首页
routeHome() {
  return MaterialPageRoute(builder: (ctx) => const PersonalCenter());
}
