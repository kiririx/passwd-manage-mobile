import 'package:passwd_manage_mobile/my_widget/blank.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClockingProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClockingProgressState();
  }

  /// 全局主题
  final ThemeGlobal themeGlobal;

  const ClockingProgress({Key? key, required this.themeGlobal})
      : super(key: key);
}

class ClockingProgressState extends State<ClockingProgress> {
  getValueTextElement(String val) {
    return Text(
      val,
      style: TextStyle(
          color: widget.themeGlobal.bottomIconSelectedColor, fontSize: 25),
    );
  }

  getLabelTextElement(String val) {
    return Text(
      val,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          height: 180,
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(30)),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        getValueTextElement("3"),
                        getLabelTextElement("今日打卡")
                      ],
                    ),
                    Column(children: [
                      getValueTextElement("20"),
                      getLabelTextElement("本周打卡")
                    ])
                  ],
                ),
                BlankRow(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      getValueTextElement("33"),
                      getLabelTextElement("本月打卡")
                    ]),
                    Column(children: [
                      getValueTextElement("129"),
                      getLabelTextElement("今年打卡")
                    ])
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
