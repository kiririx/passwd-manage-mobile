import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class MonthPicker extends CommonPickerModel {
  MonthPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.year);
    setMiddleIndex(this.currentTime.month);
    setRightIndex(this.currentTime.month);
  }

  @override
  String? leftStringAtIndex(int index) {
    return index.toString();
  }

  @override
  String? middleStringAtIndex(int index) {
    return index.toString();
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index > 12 || index < 1) {
      return null;
    }
    return index.toString();
  }

  @override
  List<int> layoutProportions() {
    return [2, 0, 2];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentLeftIndex(), currentRightIndex(), 1, 1, 1, 1)
        : DateTime(currentLeftIndex(), currentRightIndex(), 1, 1, 1, 1);
  }
}

class YearPicker extends CommonPickerModel {
  YearPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.year);
    setMiddleIndex(1);
    setRightIndex(1);
  }

  @override
  String? leftStringAtIndex(int index) {
    return index.toString();
  }

  @override
  List<int> layoutProportions() {
    return [4, 0, 0];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(currentLeftIndex(), 1, 1, 1, 1, 1)
        : DateTime(currentLeftIndex(), 1, 1, 1, 1, 1);
  }
}

class WeekPicker extends CommonPickerModel {
  WeekPicker({DateTime? currentTime, LocaleType? locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    setLeftIndex(this.currentTime.year);
    setMiddleIndex(this.currentTime.month);
    setRightIndex(this.currentTime.month);
  }

  @override
  String? leftStringAtIndex(int index) {
    return index.toString();
  }

  @override
  String? middleStringAtIndex(int index) {
    return index.toString();
  }

  @override
  String? rightStringAtIndex(int index) {
    if (index < 1) {
      return null;
    }
    var year = currentLeftIndex();
    var df = DateFormat('MM/dd');

    var startDate = DateTime(year).add(Duration(days: 7 * (index - 1) + 1));
    var start = df.format(startDate);

    var endDate = DateTime(year).add(Duration(days: 7 * index));
    var end = df.format(endDate);

    if (startDate.year > year) {
      return null;
    }
    return "$index周 [$start ~ $end]";
  }

  @override
  List<int> layoutProportions() {
    return [1, 0, 3];
  }

  @override
  DateTime finalTime() {
    var startDate = DateTime(currentLeftIndex())
        .add(Duration(days: 7 * (currentRightIndex() - 1) + 1));
    return startDate;
  }
}
