import 'package:passwd_manage_mobile/my_widget/bottom.dart';
import 'package:passwd_manage_mobile/my_widget/clocking_progress.dart';
import 'package:passwd_manage_mobile/my_widget/date_picker.dart' as my_picker;
import 'package:passwd_manage_mobile/my_widget/passwd_row.dart';
import 'package:passwd_manage_mobile/page/personal_center.dart';
import 'package:passwd_manage_mobile/route/api_router.dart';
import 'package:passwd_manage_mobile/utils/api_util.dart';
import 'package:passwd_manage_mobile/utils/date_time_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwd_manage_mobile/share_data.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../const/time_dimension.dart';
import '../my_widget/blank.dart';
import '../route/page_router.dart';
import '../theme/theme.dart';
import '../wg_content.dart';
import 'package:intl/intl.dart';

const String centerHomePage = "HOME_PAGE";
const String centerPersonalCenter = "PAGE_PERSONAL_CENTER";

Map<String, MultiPage> centerWidget = {};

putKernelPage(String pageName, {Widget? topBar, Widget? body}) {
  var page = centerWidget[pageName];
  page ??= MultiPage();
  if (topBar != null) {
    page.topBar = topBar;
  }
  if (body != null) {
    page.body = body;
  }
  centerWidget[pageName] = page;
}

getKernelBody(String pageName) {
  return centerWidget[pageName]!.body;
}

getKernelTopBar(String pageName) {
  return centerWidget[pageName]!.topBar;
}

class MultiPage {
  late Widget? topBar;
  late Widget body;

// const MultiPage();
}

class KernelPage extends StatefulWidget {
  const KernelPage({Key? key}) : super(key: key);

  @override
  State<KernelPage> createState() => _KernelPageState();
}

class _KernelPageState extends State<KernelPage> {
  /// 当前页面
  String currentPage = centerHomePage;

  /// 内容主题集合
  final contentThemes = [
    ThemeContent.orange,
    ThemeContent.pink,
    ThemeContent.purple
  ];

  /// 内容主题计数器
  var contentThemePointer = 0;

  final _qaList = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();
    loadQAList();
  }

  void onLeftArrowPressed() {}

  void onRightArrowPressed() {}

  void loadQAList() {
    ApiClient.get(apiPasswdList, query: {"pageNum": 0, "pageSize": 20})
        .then((val) {
      setState(() {
        _qaList.clear();
        List<dynamic> list = val.data['passwds'];
        for (var element in list) {
          _qaList.add(element);
        }
        print(_qaList.toString());
      });
    });
  }

  void afterSave() {
    loadQAList();
  }

  getAppBar(BuildContext context) {
    if (currentPage == centerPersonalCenter) {
      return null;
    }
    var globalTheme = ShareDataWidget.of(context)!.data.theme;
    return AppBar(
      backgroundColor: globalTheme.topBarColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () => onLeftArrowPressed(),
                  child: Text(
                    '',
                    style: TextStyle(
                        color: globalTheme.topBarIconColor, fontSize: 14),
                  )),
              const BlankColumn(width: 50),
              TextButton(
                  onPressed: () => {},
                  child: Text(
                    "",
                    style: TextStyle(
                        color: globalTheme.topBarTextColor, fontSize: 18),
                  )),
              const BlankColumn(width: 50),
              TextButton(
                  onPressed: () => onRightArrowPressed(),
                  child: Text(
                    '',
                    style: TextStyle(
                        color: globalTheme.topBarIconColor, fontSize: 14),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  createHomePageBody() {
    var globalTheme = ShareDataWidget.of(context)!.data.theme;
    return RefreshIndicator(
      onRefresh: () async {
        loadQAList();
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: () {
            var widgetList = <Widget>[];
            for (var qaContent in _qaList) {
              // 如果计数器超过主题范围，设置为0
              if (contentThemePointer == contentThemes.length) {
                contentThemePointer = 0;
              }

              widgetList.add(const BlankRow(height: 10));
              widgetList.add(PasswdRow(
                title: qaContent['topic'],
                theme: contentThemes[contentThemePointer],
                tapFunc: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: globalTheme.bodyColor,
                          child: Wrap(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.music_note),
                                title: Text('标题'),
                                subtitle: Text('腾讯云'),
                                onTap: () {
                                  // do something
                                  // Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.videocam),
                                title: Text('用户名'),
                                subtitle: Text('1102321323'),
                                onTap: () {
                                  // do something
                                  // Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.videocam),
                                title: Text('密码'),
                                subtitle: Text('************'),
                                onTap: () {
                                  // do something
                                  // Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.videocam),
                                title: Text('备注'),
                                subtitle: Text(
                                    '这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述这是一个描述\n\n\n\n'),
                                onTap: () {
                                  // do something
                                  // Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
              ));
              // 增加计数器
              contentThemePointer++;
            }
            return widgetList;
          }(),
        ),
      ),
    );
  }

  createPersonalCenterBody() {
    var globalTheme = ShareDataWidget.of(context)!.data.theme;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "我的",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () => {}, icon: const Icon(Icons.settings))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // 头像
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/icon.jpeg",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "树理理",
                          style: TextStyle(fontSize: 20),
                        ),
                        BlankRow(height: 13),
                        Text(
                          "累计打卡23天",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ClockingProgress(themeGlobal: globalTheme)
          ],
        ),
      ),
    );
  }

  getBody(BuildContext context) {
    late Widget body;
    switch (currentPage) {
      case centerHomePage:
        body = createHomePageBody();
        break;
      case centerPersonalCenter:
        body = createPersonalCenterBody();
        break;
    }
    return body;
  }

  bottomBar(BuildContext context, {required ThemeGlobal globalTheme}) {
    return BottomAppBar(
      color: globalTheme.bottomColor,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: () {
                return currentPage == centerHomePage ? Color(0xffF09825) : null;
              }(),
            ),
            onPressed: () {
              setState(() {
                currentPage = centerHomePage;
              });
            },
          ),
          const SizedBox(),
          IconButton(
            icon: Icon(Icons.add_chart_rounded, color: () {
              return currentPage == centerPersonalCenter
                  ? Color(0xffF09825)
                  : null;
            }()),
            onPressed: () {
              setState(() {
                currentPage = centerPersonalCenter;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var globalTheme = ShareDataWidget.of(context)!.data.theme;
    var currentTimeDimension = TimeDimension.day;
    return Scaffold(
      backgroundColor: const Color(0xffFFF5E9),
      appBar: getAppBar(context),
      body: getBody(context),
      bottomNavigationBar: bottomBar(context, globalTheme: globalTheme),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: globalTheme.bottomColor,
        onPressed: () {
          Navigator.push(
                  context,
                  routeAddOrEditPage(globalTheme, currentTimeDimension,
                      title: "", content: ""))
              .then((value) => afterSave());
        },
        child: Icon(
          Icons.add,
          color: globalTheme.topBarTextColor,
        ),
      ),
    );
  }
}
