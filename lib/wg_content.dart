import 'package:passwd_manage_mobile/my_widget/blank.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class WgContent extends StatelessWidget {
  const WgContent({Key? key,
    this.qaHash,
    required this.topic,
    required this.content,
    required this.theme,
    this.tapFunc})
      : super(key: key);

  final String? qaHash;
  final String topic;
  final String content;
  final ThemeContent theme;
  final void Function()? tapFunc;

  @override
  Widget build(BuildContext context) {
    var container = Container(
      height: 170.0,
      width: 320,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SizedBox(
            child: BlankColumn(
              width: 15,
              backgroundColor: theme.borderColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
          ),
          Expanded(
              child: Column(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
                    child: Column(
                      children: [
                        const BlankRow(height: 20),
                        Row(children: [
                          Text(
                            topic,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme.topicColor),
                          )
                        ]),
                        const BlankRow(height: 20),
                        Row(children: [
                          Expanded(
                            // flex: 1,
                              child: Text((){
                                if (content.length > 70) {
                                  return "${content.substring(0, 70)}...";
                                }
                                return content;
                              }(),
                                  style: TextStyle(color: theme.contentColor)))
                        ])
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
    var detector = GestureDetector(onTap: tapFunc,child: container,);
    return detector;
  }
}
