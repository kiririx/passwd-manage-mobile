import 'package:flutter/widgets.dart';
import 'package:passwd_manage_mobile/my_widget/blank.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';

class PasswdRow extends StatelessWidget {
  const PasswdRow({Key? key, required this.title, required this.theme, this.tapFunc}) : super(key: key);

  final String title;

  final ThemeContent theme;

  final Function? tapFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      width: 350,
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
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: theme.topicColor),
                          )
                        ]),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
