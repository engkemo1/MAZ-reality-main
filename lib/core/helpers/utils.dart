import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../theming/colors.dart';

class Utils {
  static bool shouldUseDarkText(Color color) {
    return (color.red * 0.299 + color.green * 0.587 + color.blue * 0.114) > 186;
  }
}

DateTime convertTimeStamp(String date) {
  final dateTime = DateFormat("yyyy-MM-dd").parse(date, true);
  return DateTime(
    dateTime.year,
    dateTime.month,
    dateTime.day,
  ).toLocal();
}

extension EmptyPadding on num {
  SizedBox get pw => SizedBox(width: toDouble());

  SizedBox get ph => SizedBox(height: toDouble());
}

bool isNullOrEmpty(dynamic obj) => obj == null || ((obj is String || obj is List || obj is Map) && obj.isEmpty);

bool notNullNorEmpty(dynamic obj) =>
    obj != null && ((obj is String || obj is List || obj is Map) && obj.isNotEmpty);

launchPhoneDialer(String phone) async {
  final String url = "tel:$phone";
  if (await launchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

String getSubStringAfter(String text,String? condition) {
  final int lastIndex = text.lastIndexOf(condition ?? '-');
  if (lastIndex != -1 && lastIndex < text.length - 1) {
    final String subText = text.substring(lastIndex + 1).trim();
    return subText;
  } else {
    return text;
  }
}

int daysRemainingTillNextMonth(DateTime date) {
  var daysLeft = 0;
  var lastDayOfNextRegistrationMonth = 0;

  final nextRegistrationCalender = getNextMonth(date);

  final nextRegistrationMonth = nextRegistrationCalender.month;

  lastDayOfNextRegistrationMonth = getLastDayOf(nextRegistrationCalender);

  final currentCalendar = DateTime.now();
  final currentMonth = currentCalendar.month;

  if (currentMonth == nextRegistrationMonth) {
    final currentDay = currentCalendar.day;
    daysLeft = lastDayOfNextRegistrationMonth - currentDay;
  } else {
    daysLeft = -1;
  }
  return daysLeft;
}

const Map<String, String> arabicDigits = <String, String>{
  '0': '\u0660',
  '1': '\u0661',
  '2': '\u0662',
  '3': '\u0663',
  '4': '\u0664',
  '5': '\u0665',
  '6': '\u0666',
  '7': '\u0667',
  '8': '\u0668',
  '9': '\u0669',
};

String toArabicDigits(number) {
  final StringBuffer sb = StringBuffer();
  for (int i = 0; i < number.length; i++) {
    sb.write(arabicDigits[number[i]] ?? number[i]);
  }
  return sb.toString();
}

DateTime getNextMonth(DateTime date) {
  final nextMonth = (date.month < 12) ? DateTime(date.year, date.month + 1, 0) : DateTime(date.year + 1, 1, 0);
  return nextMonth;
}

int getLastDayOf(DateTime dateTime) {
  return getNextMonth(dateTime).day;
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

int checkDateAfterDate(String? dateFormat, String? date1, String? date2) {
  try {
    final DateFormat sdf = DateFormat("yyyy-MM-dd hh:mm:ss");

    final DateTime cal1 = sdf.parse(date1 ?? '');
    final DateTime cal2 = sdf.parse(date2 ?? '');
    if (cal1.isAfter(cal2)) {
      return 1;
    }
    if (cal1.isBefore(cal2)) {
      return 2;
    }
    if (cal1 == cal2) {
      return 0;
    }
  } catch (e) {
    e.toString();
  }
  return 0;
}

class DashedLinePainter extends CustomPainter {
  Color? color;

  DashedLinePainter({this.color}) {
    color ??= ColorsManager.lighterBlue;
  }

  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = color!
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

String convertDateFormatToAnother(
    String? srcDateFormat, String srcDate, String? destDateFormat, String? locale, bool useLocal) {
  try {
    final DateFormat srcDf = DateFormat(srcDateFormat, 'en');

    // parse the data string into Date object
    final DateTime date = srcDf.parse(srcDate);
    final DateFormat destDf = DateFormat(destDateFormat, (useLocal) ? locale : 'en');
    // format the data into another format
    destDf.format(date);
  } catch (e) {
    e.toString();
  }
  return srcDate;
}

// void showOffersConsumptionDialog(
//   List<AvailableOffer>? availableOfferModelArrayList,
//   ScratchEntity? scratch,
// ) {}

// void showEmployeeDialog(String? voucher) {}

// void showDefaultPhoneWarningDialog(bool hasDefaultPhone) {
//   // val defaultPhoneWarningDialog = DefaultPhoneWarningDialog.newInstance(
//   //     AppConstants.COME_FROM_HOME,
//   //     hasDefaultPhone
//   // ) as DefaultPhoneWarningDialog
//   // defaultPhoneWarningDialog.setDefaultPhoneWarningDialogCallBack(this)
//   // defaultPhoneWarningDialog.isCancelable = false
//   // defaultPhoneWarningDialog.show(
//   //     requireActivity().supportFragmentManager,
//   //     DefaultPhoneWarningDialog.TAG
//   // );
// }
