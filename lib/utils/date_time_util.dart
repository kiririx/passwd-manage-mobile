import 'package:intl/intl.dart';

class DateTimeUtil {

  /// 获取当前日期是本年度第几周
  static getWeekOfYear(DateTime dateTime) {
    int dayOfYear = int.parse(
        DateFormat("D").format(dateTime)); // 当年的第几天
    int weekOfYear = (dayOfYear / 7).floor() + 1;
    return weekOfYear;
  }
}