import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../share_data.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingState();
  }
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var globalTheme = ShareDataWidget.of(context)!.data.theme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globalTheme.topBarColor,
        title: Row(
          children: [
            Row(
              children: [TextButton(onPressed: () => {}, child: Text("< 设置"))],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
