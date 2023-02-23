import 'package:passwd_manage_mobile/page/kernel_page.dart';
import 'package:passwd_manage_mobile/share_data.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(theme: ThemeGlobal.orange));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.theme}) : super(key: key);

  final ThemeGlobal theme;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShareDataWidget(
        data: ShareData(theme: widget.theme),
        child: const KernelPage(),
      ),
    );
  }
}

