import 'package:passwd_manage_mobile/my_widget/bottom.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PersonalCenter extends StatefulWidget {
  const PersonalCenter({super.key});

  @override
  State<StatefulWidget> createState() => _PersonalCenterState();
}

class _PersonalCenterState extends State<PersonalCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            const Text(
              "我的",
              style: TextStyle(fontSize: 30.0),
            ),
            IconButton(onPressed: () => {}, icon: const Icon(Icons.settings))
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(context, globalTheme: ThemeGlobal.orange),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeGlobal.orange.bottomColor,
        onPressed: () => {},
        child: Icon(
          Icons.add,
          color: ThemeGlobal.orange.topBarTextColor,
        ),
      ),
    );
  }
}
