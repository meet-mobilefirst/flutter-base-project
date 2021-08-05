import 'dart:async';
import 'dart:developer' as dev;
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:baseproject/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AppMethods {
  static String validate(String value, String filed) {
    if (value.isEmpty) {
      return '$filed can \'t be empty';
    }
    return null;
  }

  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email can \'t be empty';
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value.trim()))
        return 'Enter valid email';
      else
        return null;
    }
  }

  /// To change status bar icon colors to white and black
  static void changeStatusBarIconColor({bool isWhiteStatusIconColor = true}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // For Android.
      // Use [light] for white status bar and [dark] for black status bar.
      statusBarIconBrightness:
          isWhiteStatusIconColor ? Brightness.light : Brightness.dark,

      // For iOS.
      // Use [dark] for white status bar and [light] for black status bar.
      statusBarBrightness:
          isWhiteStatusIconColor ? Brightness.dark : Brightness.light,
    ));
  }

  static bool isNumber(String item) {
    return '0123456789'.split('').contains(item);
  }

  /// enter padding value from top if you want to compare with your own
  /// defaults to 80
  static bool isPhoneHasNotch({double topPaddingValue}) {
    double _topPaddingValue;
    if (topPaddingValue != null) {
      _topPaddingValue = topPaddingValue;
    } else {
      _topPaddingValue = 80;
    }
    print("WINDOW TOP PADDING :: " + window.viewPadding.top.toString());

    if (window.viewPadding.top > _topPaddingValue) {
      return true;
    } else {
      return false;
    }
  }

  static bool isBottomPadding() {
    print("WINDOW BOTTOM PADDING :: " + window.viewPadding.bottom.toString());
    dev.log("WINDOW BOTTOM PADDING :: " + window.viewPadding.bottom.toString());

    if (window.viewPadding.bottom > 0) {
      return true;
    } else {
      return false;
    }
  }

  /// With the card number with Luhn Algorithm
  /// https://en.wikipedia.org/wiki/Luhn_algorithm
  static String validateCardNum(String input) {
    if (input.isEmpty) {
      return "This field is required";
    }

    input = getCleanedNumber(input);

    if (input.length < 8) {
      return "Card is invalid";
    }

    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);

      // every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }

    if (sum % 10 == 0) {
      return null;
    }

    return "Card is invalid";
  }

  static String getCleanedNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static CardType getCardTypeFrmNumber(String input) {
    CardType cardType;
    if (input.startsWith(new RegExp(
        r'((5[1-5])|(222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720))'))) {
      cardType = CardType.Master;
    } else if (input.startsWith(new RegExp(r'[4]'))) {
      cardType = CardType.Visa;
    } else {
      cardType = CardType.Invalid;
    }
    return cardType;
  }

  static String getCleanedCardNumber(String text) {
    RegExp regExp = new RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }

  static String validateDate(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }

    int year;
    int month;
    // The value contains a forward slash if the month and year has been
    // entered.
    if (value.contains(new RegExp(r'(\/)'))) {
      var split = value.split(new RegExp(r'(\/)'));
      // The value before the slash is the month while the value to right of
      // it is the year.
      month = int.parse(split[0]);
      year = int.parse(split[1]);
    } else {
      // Only the month was entered
      month = int.parse(value.substring(0, (value.length)));
      year = -1; // Lets use an invalid year intentionally
    }

    if ((month < 1) || (month > 12)) {
      // A valid month is between 1 (January) and 12 (December)
      return 'Expiry month is invalid';
    }

    var fourDigitsYear = convertYearTo4Digits(year);
    if ((fourDigitsYear < 1) || (fourDigitsYear > 2099)) {
      // We are assuming a valid should be between 1 and 2099.
      // Note that, it's valid doesn't mean that it has not expired.
      return 'Expiry year is invalid';
    }

    if (!hasDateExpired(month, year)) {
      return "Card has expired";
    }
    return null;
  }

  /// Convert the two-digit year to four-digit year if necessary
  static int convertYearTo4Digits(int year) {
    if (year < 100 && year >= 0) {
      var now = DateTime.now();
      String currentYear = now.year.toString();
      String prefix = currentYear.substring(0, currentYear.length - 2);
      year = int.parse('$prefix${year.toString().padLeft(2, '0')}');
    }
    return year;
  }

  static bool hasDateExpired(int month, int year) {
    return !(month == null || year == null) && isNotExpired(year, month);
  }

  static bool isNotExpired(int year, int month) {
    // It has not expired if both the year and date has not passed
    return !hasYearPassed(year) && !hasMonthPassed(year, month);
  }

  static bool hasMonthPassed(int year, int month) {
    var now = DateTime.now();
    // The month has passed if:
    // 1. The year is in the past. In that case, we just assume that the month
    // has passed
    // 2. Card's month (plus another month) is more than current month.
    return hasYearPassed(year) ||
        convertYearTo4Digits(year) == now.year && (month < now.month + 1);
  }

  static bool hasYearPassed(int year) {
    int fourDigitsYear = convertYearTo4Digits(year);
    var now = DateTime.now();
    // The year has passed if the year we are currently is more than card's
    // year
    return fourDigitsYear < now.year;
  }

  static List<int> getExpiryDate(String value) {
    var split = value.split(new RegExp(r'(\/)'));
    return [int.parse(split[0]), int.parse(split[1])];
  }

  static String validateCVV(String value) {
    if (value.isEmpty) {
      return "This field is required";
    }

    if (value.length == 3) {
      return null;
    }

    if (value.length < 3 || value.length > 4) {
      return "CVV is invalid";
    }
    return null;
  }

  static DateTime getCurrentDateTime() {
    return DateTime.now();
  }

  static String getTodaysDayInId() {
    String _day = DateFormat('EEEE').format(getCurrentDateTime());

    switch (_day.toLowerCase()) {
      case "monday":
        return "1";

        break;

      case "tuesday":
        return "2";

        break;
      case "wednesday":
        return "3";

        break;
      case "thursday":
        return "4";

        break;
      case "friday":
        return "5";

        break;
      case "saturday":
        return "6";

        break;
      case "sunday":
        return "7";

        break;
    }
  }

  static DateTime getDatefromString(String dateTime) {
    DateTime _dateTime = new DateFormat("dd MMM yyyy").parse(dateTime);
    return _dateTime;
  }

  static String getTimeFromString(String time) {
    DateTime _dateTime = DateFormat('hh:mm').parse(time);
    String _newDateFormat = DateFormat('hh:mm a').format(_dateTime);

    return _newDateFormat;
  }

  static DateTime getDateTimeFromStringWithHHMMAFormat(String dateTime) {
    DateTime _dateTime = new DateFormat('hh:mm a').parse(dateTime);
    return _dateTime;
  }

  static Duration differenceInDates(DateTime date1, DateTime date2) {
    Duration _compare = date1.difference(date2);
    return _compare;
  }

  static DateTime getDateTimeFromUTCFormat(String dateTime) {
    DateTime _dateTime = DateTime.parse(dateTime).toLocal();

    return _dateTime;
  }

  static String getDateTimeInddMMMyyyyFromUtc(DateTime dateTime) {
    String _date = DateFormat("dd MMM yyyy").format(dateTime);
    return _date;
  }

  /// To get the difference between created time and current time
  static String getCreatedAndCurrentTimeDifference(DateTime createdTime) {
    DateTime _createdTime = createdTime;
    DateTime _currentTime = DateTime.now();
    // (_currentTime.difference(_reviewTime).inHours / 24).round();
    Duration _difference = _currentTime.difference(_createdTime);
    // int _differenceinSeconds = _currentTime.difference(_reviewTime).inSeconds ;
    if (_difference.inDays > 0) {
      return _difference.inDays.toString() + "d";
    } else if (_difference.inHours > 0) {
      return _difference.inHours.toString() + "h";
    } else if (_difference.inMinutes > 0) {
      return _difference.inMinutes.toString() + "m";
    } else {
      return _difference.inSeconds.toString() + "s";
    }
  }
}
