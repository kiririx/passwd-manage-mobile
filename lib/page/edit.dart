import 'package:passwd_manage_mobile/const/time_dimension.dart';
import 'package:passwd_manage_mobile/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddOrEditPage extends StatefulWidget {
  const AddOrEditPage(
      {Key? key,
      required this.theme,
      required this.timeDimension,
      this.dataId,
      required this.topBarLabel,
      required this.title,
      required this.content})
      : super(key: key);

  final ThemeGlobal theme;

  /// 时间维度参数
  final TimeDimension timeDimension;

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
        child: Column(
          children: [
            // 标题编辑框
            SizedBox(
                child: TextField(
              // 当title是空的时候，就说明是新增的数据，所以焦点应该在这里，content的逻辑同理
              autofocus: _titleCtrl.text == "",
              controller: _titleCtrl,
              decoration: const InputDecoration(
                  border: InputBorder.none, contentPadding: EdgeInsets.all(15)),
            )),
            // 内容编辑框
            SizedBox(
                child: TextField(
                    autofocus: _titleCtrl.text != "",
                    keyboardType: TextInputType.multiline,
                    controller: _contentCtrl,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15)),
                    inputFormatters: [
                      // max input count
                      LengthLimitingTextInputFormatter(1000),
                    ],
                    style: const TextStyle(height: 1.5)))
          ],
        ),
      ),
    );
  }
}
