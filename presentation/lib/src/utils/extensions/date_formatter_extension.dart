import 'package:intl/intl.dart';

extension DateFormatterExtension on DateTime {
  /// Returns DateTime in ['MMM d, yyy'] format
  /// ```
  /// DateFormat('MMM d, yyyy').format(DateTime(2023, 6, 6)) /// returns "Jun 6, 2023"
  /// DateFormat('MMM d, yyyy').format(DateTime(2023, 6, 13)) /// returns "Jun 13, 2023"
  /// ```
  String get abbreviatedMonthDayYear => DateFormat('MMM d, yyyy').format(this);

  /// Returns DateTime in ['MMMM yyyy'] format
  /// ```
  /// DateFormat('MMMM yyyy').format(DateTime(2023, 6, 12)) /// returns "June 2023"
  /// ```
  String get fullMonthYear => DateFormat('MMMM yyyy').format(this);

  /// Returns DateTime in ['MM/dd/yy'] format
  /// ```
  /// DateFormat('MM/dd/yy').format(DateTime(2023, 6, 12)) /// returns "06/12/23"
  /// DateFormat('MM/dd/yy').format(DateTime(2023, 6, 4)) /// returns "06/04/23"
  /// ```
  String get slashMonthDayYearShort => DateFormat('MM/dd/yy').format(this);

  /// Returns DateTime in ['M/d/yy'] format
  /// ```
  /// DateFormat('M/d/yy').format(DateTime(2023, 6, 12)) /// returns "6/12/23"
  /// DateFormat('M/d/yy').format(DateTime(2023, 6, 4)) /// returns "6/4/23"
  /// ```
  String get slashMonthDayYearAllShort => DateFormat('M/d/yy').format(this);

  /// Returns DateTime in ['MMMM d, yyyy'] format
  /// ```
  /// DateFormat('MMMM d, yyyy').format(DateTime(2023, 6, 6)) /// returns "June 6, 2023"
  /// DateFormat('MMMM d, yyyy').format(DateTime(2023, 6, 13)) /// returns "June 13, 2023"
  /// ```
  String get fullMonthDayYear => DateFormat('MMMM d, yyyy').format(this);

  /// Returns DateTime in ['h:mm a'] format
  /// ```
  /// DateFormat('h:mm a').format(DateTime(2023, 6, 6, 2, 43)) /// returns "2:43 AM"
  /// DateFormat('h:mm a').format(DateTime(2023, 6, 6, 15, 43)) /// returns "3:43 PM"
  /// ```
  String get hoursMinutesPartOfDay => DateFormat('h:mm a').format(this);

  /// Returns DateTime in ['MMMM'] format
  /// ```
  /// DateFormat('MMMM').format(DateTime(2023, 6, 12)) /// returns "June"
  /// ```
  String get fullMonth => DateFormat('MMMM').format(this);

  /// Returns DateTime in ['EEEE'] format
  /// ```
  /// DateFormat('EEEE').format(DateTime(2023, 6, 13)) /// returns "Tuesday"
  /// ```
  String get fullDayOfWeek => DateFormat('EEEE').format(this);

  /// Returns DateTime in ['MMM’ yy'] format
  /// ```
  /// DateFormat('MMM’ yy').format(DateTime(2023, 6, 6)) /// returns "Jun’ 23"
  /// ```
  String get abbreviatedMonthYearShort => DateFormat('MMM’ yy').format(this);

  /// Returns DateTime in ['MMM yyyy'] format
  /// ```
  /// DateFormat('MMM yyyy').format(DateTime(2023, 6, 6)) /// returns "Jun 2023"
  /// ```
  String get abbreviatedMonthYearFull => DateFormat('MMM yyyy').format(this);

  /// Returns DateTime in ['MM/dd/yyyy'] format
  /// ```
  /// DateFormat('MM/dd/yyyy').format(DateTime(2023, 6, 12)) /// returns "06/12/2023"
  /// DateFormat('MM/dd/yyyy').format(DateTime(2023, 6, 4)) /// returns "06/04/2023"
  /// ```
  String get slashMonthDayYearFull => DateFormat('MM/dd/yyyy').format(this);

  /// Returns the formatted date and time string in the format 'MMMM dd, yyyy hh:mm a UTC'.
  ///
  /// Example:
  /// ```
  /// DateTime myDateTime = DateTime(2023, 6, 6, 15, 30);
  /// String formatted = myDateTime.formattedDateTime; // "June 06, 2023 03:30 PM UTC"
  /// ```
  String get fullDateTimeInUTC =>
      DateFormat('MMMM dd, yyyy hh:mm a UTC').format(toUtc());

  /// Returns DateTime in ['E M/d'] format
  /// ```
  /// DateFormat('E M/d').format(DateTime(2023, 6, 12)) /// returns "Thu 9/1"
  /// ```
  String get weekdayMonthSlashDay => DateFormat('E M/d').format(this);

  /// Returns DateTime in ['d MMM yyy'] format
  /// ```
  /// DateFormat('d MMM yyy').format(DateTime(2023, 6, 6)) /// returns "6 Jun 2023"
  /// DateFormat('d MMM yyy').format(DateTime(2023, 6, 13)) /// returns "13 Jun 2023"
  /// ```
  String get dayAbbreviatedMonthYear => DateFormat('d MMM yyyy').format(this);

  String get messageFormattedTime => DateFormat('hh:mm a').format(this);
}
