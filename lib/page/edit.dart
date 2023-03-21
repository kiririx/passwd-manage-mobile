import 'package:passwd_manage_mobile/const/time_dimension.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:passwd_manage_mobile/utils/ICloudHelper.dart';

import '../share_data.dart';

class AddOrEditPage extends StatefulWidget {
  const AddOrEditPage(
      {Key? key,
      required this.theme,
      this.dataId,
      required this.topBarLabel,
      required this.title,
      required this.content})
      : super(key: key);

  final ThemeGlobal theme;

  /// id
  final String? dataId;
  final String title;
  final String content;
  final String topBarLabel;

  @override
  State<StatefulWidget> createState() {
    return AddOrEditPageState();
  }
}

class AddOrEditPageState extends State<AddOrEditPage> {
  /// get data from backend api
  Map<String, Object>? getData() {
    return null;
  }

  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _contentCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleCtrl.text = widget.title;
    _contentCtrl.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.theme.bodyColor,
      appBar: AppBar(
        backgroundColor: widget.theme.topBarColor,
        title: Text(
          widget.topBarLabel,
          style: TextStyle(color: widget.theme.topBarTextColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: widget.theme.topBarIconColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: Center(
        
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: '标题'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: '用户名'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              onSaved: (value) {
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '密码'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
              },
            ),
            TextFormField(
              // 设置为null，将允许多行输入
              maxLines: null,
              decoration: const InputDecoration(labelText: '描述'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              onSaved: (value) {
              },
            ),
          ],
        ),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 在此处添加悬浮按钮的点击事件处理代码
          ICloudHelper().saveFileToICloud("11111.txt", "abcdefg");
        },
        backgroundColor: Colors.orangeAccent,
        child: const Icon(Icons.check),
      ),
    );
  }
}
