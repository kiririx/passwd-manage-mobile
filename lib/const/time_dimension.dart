// 时间维度枚举
enum TimeDimension {
  day(idx: 0, text: "日"),
  week(idx: 1, text: "周"),
  month(idx: 2, text: "月"),
  year(idx: 3, text: "年");

  const TimeDimension({required this.text, required this.idx});

  final String text;
  final int idx;
}
