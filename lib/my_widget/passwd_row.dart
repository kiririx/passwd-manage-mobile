import 'package:flutter/widgets.dart';
import 'package:passwd_manage_mobile/my_widget/blank.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';

class PasswdRow extends StatelessWidget {
  const PasswdRow({Key? key, required this.title, required this.theme, this.tapFunc}) : super(key: key);

  final String title;

  final ThemeContent theme;

  final void Function()? tapFunc;

  @override
  Widget build(BuildContext context) {
    var container = Container(
      height: 55.0,
      width: 350,
      // padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
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
    return GestureDetector(onTap: tapFunc, child: container,);
  }
}
