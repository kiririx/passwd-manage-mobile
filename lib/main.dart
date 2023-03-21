import 'package:passwd_manage_mobile/page/kernel_page.dart';
import 'package:passwd_manage_mobile/share_data.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


const platform = MethodChannel('com.example.icloud/save');

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
        primarySwatch: Colors.orange,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffc9c9c9)), // 设置底部线颜色
          ),
        ),
      ),
      home: ShareDataWidget(
        data: ShareData(theme: widget.theme),
        child: const KernelPage(),
      ),
    );
  }
}

Future<void> _saveFileToICloud(String filename, String content) async {
  try {
    final result = await platform.invokeMethod('saveFileToICloud', {
      'filename': filename,
      'content': content,
    });
    print(result);
  } on PlatformException catch (e) {
    print('Error: ${e.message}');
  }
}
