import 'package:flutter/widgets.dart';

/// 空白行
class BlankRow extends StatelessWidget {
  const BlankRow({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(height: height);
  }
}

/// 空白列
class BlankColumn extends StatelessWidget {
  const BlankColumn(
      {Key? key, required this.width, this.backgroundColor, this.borderRadius})
      : super(key: key);

  final double width;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration:
            BoxDecoration(color: backgroundColor, borderRadius: borderRadius));
  }
}
