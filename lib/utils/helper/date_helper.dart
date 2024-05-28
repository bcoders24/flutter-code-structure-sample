import 'package:intl/intl.dart';


class DateHelper{

  static const _locale = 'en';
  static const int _SECOND_MILLIS = 1000;
  static const int _MINUTE_MILLIS = 60 * _SECOND_MILLIS;
  static const int _HOUR_MILLIS = 60 * _MINUTE_MILLIS;

  static const _isoFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
  static const _isoFormatWithoutT = "yyyy-MM-dd HH:mm:ss.SSS'Z'";
  static final _timeFormat12SlashN = DateFormat("hh:mm\na",_locale);
  static final _timeFormat12 = DateFormat("hh:mm a",_locale);
  static final _timeFormat24 = DateFormat("HH:mm", _locale);
  static final _timeFormat24Post = DateFormat("HH:mm", _locale);

  static final _isoFormatDate = DateFormat(_isoFormat, _locale);
  static final _isoFormatDateWithoutT = DateFormat(_isoFormatWithoutT, _locale);
  static final _dateFormatLog = DateFormat("dd MMM yyyy",_locale);
  static final dateFormatGetEvent = DateFormat("yyyy-MM-dd", _locale);
  static final _dateFormatEvent = DateFormat("dd MMM yyyy", _locale);
  static final _dateFormatEventDateWithday = DateFormat("dd MMM (EE)", _locale);
  static final _joiningDate = DateFormat("dd MMM yyyy \n EEEE", _locale);
  static final _dateFormatEventDetail = DateFormat("EEEE, MMM dd", _locale);
  static final _dateFormatNotification = DateFormat("MMM dd", _locale);
  static final _expiryMonthCard = DateFormat("MM", _locale);
  static final _expiryYearCard = DateFormat("dd", _locale);
  static final _addCardDateFormat = DateFormat("MM/yyyy", _locale);
  static final _dateFormateWithoutString = DateFormat("yyyy-MM-dd", _locale);
  static final _dateFormateNoString = DateFormat("dd/MM/yyyy", _locale);

  static final _getTimeFormate = DateFormat("h:mm a", _locale);
  static final _walletScreenFormate = DateFormat("dd MMM yyyy h:mm a", _locale);
  static final _dateTimeFormat = DateFormat("dd MM yyyy HH:mm", _locale);
  static final _dateDay = DateFormat("dd", _locale);
  static final _weekendFormat = DateFormat("dd MMM yyyy", _locale);
  static final _dateFormatDay = DateFormat("EEE", _locale);
  static final _calenderScreenDate = DateFormat("MMM yyyy", _locale);
  static final _dayName = DateFormat("EEEE", _locale);
  static final _bookingFormat = DateFormat("EE dd MMM", _locale);
  static final _bookingAtFormat = DateFormat("EEE dd MMM, h:mm a", _locale);

  static String getBookingAtDate(DateTime? dateTime){
    if(dateTime==null){
      return "";
    }
    return _bookingAtFormat.format(dateTime);
  }

  static String getDayName(DateTime dateTime){
    return _dayName.format(dateTime);
  }

  static String formatBlockDate(String date){
    DateTime dateTime = dateFormatGetEvent.parse(date);
    return _dateFormatLog.format(dateTime);
  }

  static String getCalenderScreenDate(DateTime dateTime) {
    return _calenderScreenDate.format(dateTime);
  }

  static String getIsoFormatDate(DateTime dateTime) {
    return _isoFormatDate.format(dateTime);
  }

  static DateTime getUtcDate(String date){
    return _isoFormatDate.parse(date, true);
  }

  static DateTime getUtcDateWithoutT(String date){
    return _isoFormatDateWithoutT.parse(date, true);
  }

  static DateFormat getDateFormat(String dateFormat){
    return DateFormat(dateFormat, _locale);
  }

  static String getStringFromDate(String dateFormat, DateTime dateTime){
    return getDateFormat(dateFormat).format(dateTime);
  }

  static DateTime getDateFromString(String dateFormat, String dateTime){
    return getDateFormat(dateFormat).parse(dateTime);
  }

  static String getMeetingDate(DateTime dateTime){
    return _dateFormatEvent.format(dateTime);
  }

  static String getDateWithDay(DateTime dateTime){
    return _dateFormatEventDateWithday.format(dateTime);
  }

  static String getEventDate(String date){
    DateTime aDate = dateFormatGetEvent.parse(date);
    return _dateFormatEvent.format(aDate);
  }

  static String getDashboardDate(String date){
    DateTime aDate = dateFormatGetEvent.parse(date);
    return _dateFormatEvent.format(aDate);
  }



  static String getEventDetailDate(String date){
    DateTime aDate = dateFormatGetEvent.parse(date);
    return _dateFormatEvent.format(aDate);
  }

  static DateTime getEventDateObject(String? date){
    return dateFormatGetEvent.parse(date!);
  }

  static String getEventStringDate(DateTime? date){
    return dateFormatGetEvent.format(date!);
  }

  static String formatScheduleBookingDate(DateTime? dateTime ){
    return dateTime==null?"":_dateFormateNoString.format(dateTime);
  }
  static String getPayoutRequestDate(DateTime? date){
    return _dateFormateNoString.format(date!);
  }
  static String formatBookingDate(String? date){
    DateTime dateTime = dateFormatGetEvent.parse(date!);
    return _bookingFormat.format(dateTime);
  }

  static String formatSlotDate(DateTime? date){
    // DateTime dateTime = dateFormatGetEvent.parse(date!);
    return _dateFormateWithoutString.format(date!);
  }

  static String getEventTime(String? time){
    if(time==null){
      return "";
    }
    DateTime date = _timeFormat24.parse(time);
    return _timeFormat12.format(date);
  }

  static DateTime getEventTimeObject(String time){
    return _timeFormat24.parse(time);
  }


  static String getTime12SlashN(DateTime? dateTime){
    return _timeFormat12SlashN.format(dateTime!);
  }

  static String getTime12(DateTime? dateTime){
    return _timeFormat12.format(dateTime!);
  }

  static String convertDateto24(DateTime dateTime){
    return _timeFormat24.format(dateTime);
  }

  static String getChatTime(int time){
    if (time < 1000000000000) {
      // if timestamp given in seconds, convert to millis
      time *= 1000;
    }
    var now =  DateTime.now().millisecondsSinceEpoch;
    if (time > now || time <= 0) {
      return "just now";
    }
    final int diff = now - time;
    if (diff < _MINUTE_MILLIS) {
      return "just now";
    } else if (diff < 2 * _MINUTE_MILLIS) {
      return "a minute ago";
    }else {
      var date = DateTime.fromMillisecondsSinceEpoch(time);
      return _timeFormat12.format(date);
    }
  }

  static String getTimeAgo(int time){
    if (time < 1000000000000) {
      // if timestamp given in seconds, convert to millis
      time *= 1000;
    }
    var now =  DateTime.now().millisecondsSinceEpoch;
    if (time > now || time <= 0) {
      return "just now";
    }
    // TODO: localize
    final int diff = now - time;
    if (diff < _MINUTE_MILLIS) {
      return "just now";
    } else if (diff < 2 * _MINUTE_MILLIS) {
      return "a minute ago";
    } else if (diff < 50 * _MINUTE_MILLIS) {
      return "${(diff / _MINUTE_MILLIS).floor()} minutes ago";
    } else if (diff < 90 * _MINUTE_MILLIS) {
      return "an hour ago";
    } else if (diff < 24 * _HOUR_MILLIS) {
      return "${(diff / _HOUR_MILLIS).floor()} hours ago";
    } else if (diff < 48 * _HOUR_MILLIS) {
      return "yesterday";
    } else {
      var date = DateTime.fromMillisecondsSinceEpoch(time);
      return _dateFormatLog.format(date);
    }
  }

  static String getDateTimeAgo(DateTime? date) {
    if (date == null) {
      return "";
    }

    int time = date.millisecondsSinceEpoch;

    int now = DateTime.now().millisecondsSinceEpoch;

    if (time > now || time <= 0) {
      return "";
    }

    final int diff = now - time;
    if (diff < _MINUTE_MILLIS) {
      return "now";
    } else if (isToday(date)) {
      return "Today, ${_timeFormat12.format(date)}";
    } else if (dayIsYesterday(date)) {
      return "yesterday";
    } else {
      return _dateFormatLog.format(date);
    }
  }

  static String getSinceAgo(DateTime dateTime){
    var now =  DateTime.now();
    final difference = now.difference(dateTime);
    if(difference.inDays>29){
      if((difference.inDays/30).floor() == 1)
        return "Active since 1 month";
      else
        return "Active since ${(difference.inDays/30).floor()}months";
    }else if(difference.inDays>=1 && difference.inDays<=29){
      if(difference.inDays == 1)
        return "Active since 1 day";
      else
        return "Active since ${difference.inDays} days";
    }else if(difference.inHours >= 1){
      if(difference.inHours == 1)
        return "Active since 1 hour";
      else
        return "Active since ${difference.inHours} hours";
    }else if(difference.inMinutes >= 1){
      if(difference.inMinutes == 1)
        return "Active since 1 minute";
      else
        return "Active since ${difference.inMinutes} minutes";
    }else{
      return "Active since ${difference.inSeconds} seconds";
    }
  }

  static String getNotificationHeaderDate(DateTime? date){
    if (date == null) {
      return "";
    }

    int time = date.millisecondsSinceEpoch;

    int now = DateTime.now().millisecondsSinceEpoch;

    if (time > now || time <= 0) {
      return "Today";
    }

    final int diff = now - time;
    if (isToday(date)) {
      return "Today";
    } else if (dayIsYesterday(date)) {
      return "Yesterday";
    } else {
      return _dateFormatLog.format(date);
    }
  }

  static bool isToday(DateTime date) {
    return isSameDay(date, DateTime.now());
  }

  static bool isSameDay(DateTime dateTime1, DateTime dateTime2){
    final aDate1 = DateTime(dateTime1.year, dateTime1.month, dateTime1.day);
    final aDate2 = DateTime(dateTime2.year, dateTime2.month, dateTime2.day);
    return aDate1 == aDate2;
  }

  static bool dayIsYesterday(DateTime dateTime){
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final aDate = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return yesterday == aDate;
  }

  static String getNotificationDate(DateTime? dateTime) {
    if (dateTime == null) {
      return "";
    }
    return _dateFormatNotification.format(dateTime.toLocal());
  }

  static DateTime excludeSeconds(DateTime dateTime){
    return DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute);
  }

  static DateTime getOnlyDate(DateTime dateTime){
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static String joiningDate(DateTime? dateTime){
    return _joiningDate.format(dateTime!);
  }

  static String expiryMonth(DateTime dateTime){
    return _expiryMonthCard.format(dateTime);
  }

  static String expiryYear(DateTime dateTime){
    return _expiryYearCard.format(dateTime);
  }

  static DateTime getAddCardDate(String date){
    return _addCardDateFormat.parse(date);
  }

  static String getCardDate(DateTime? date){
    if(date==null) return "";
    return _addCardDateFormat.format(date);
  }

  static String getUpdateDateMyPostList(DateTime? dateTime) {
    if(dateTime==null) return "0";
    return _dateFormateNoString.format(dateTime);
  }
  static String getPickupTimeMyPostList(String? time) {
    if(time==null){
      return "";
    }
    var date = _timeFormat24Post.parse(time);
    return _timeFormat12.format(date);
  }

  static DateTime getPickUpTimeDateObject(String? time){
    return _timeFormat24Post.parse(time!);
  }

  static String getPostDateToSend(DateTime? date){
    return dateFormatGetEvent.format(date!);
  }

  static String convertDateto24Post(DateTime? dateTime){
    return _timeFormat24Post.format(dateTime!);
  }

  static String getPickupDateMyPostList(String? time) {
    if(time == null) {
      return '';
    }else {
      var date = _dateFormateWithoutString.parse(time);
      return _dateFormateNoString.format(date);
    }

  }

  static String getMyPostDetailsDate(String? time) {
    if(time==null) {
      return '';
    }
    var date = _dateFormateWithoutString.parse(time);
    return _dateFormatLog.format(date);
  }

  static String getChatScreenTime(DateTime? time){
    if(time==null){
      return '';
    }
    return _timeFormat12.format(time);
  }

  static String getWalletDate(DateTime? time){
    if(time==null){
      return '';
    }
    return _walletScreenFormate.format(time);
  }

  static String getTime(DateTime? time){
    if(time==null){
      return '';
    }
    return _getTimeFormate.format(time);
  }

  static bool isTimeBetween(DateTime time, DateTime startTime, DateTime endTime){
    time = _dateTimeFormat.parse(_dateTimeFormat.format(time));
    startTime = _dateTimeFormat.parse(_dateTimeFormat.format(startTime));
    endTime = _dateTimeFormat.parse(_dateTimeFormat.format(endTime));
    if((time.isAfter(startTime) && time.isBefore(endTime)) ||
        time.isAtSameMomentAs(startTime)){
      return true;
    }else{
      return false;
    }
  }

  static DateTime findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  static DateTime findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  static DateTime getStartOfTheMonth() {
    return DateTime(DateTime.now().year, DateTime.now().month, 1);
  }

  static DateTime getEndOfTheMonth() {
    return DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
  }

  static String getWeekendDate(DateTime dateTimeStart, DateTime dateTimeEnd) {
    String date = "${_dateDay.format(dateTimeStart)}-${_weekendFormat.format(dateTimeEnd)}";
    return date;
  }
  static DateTime getEndOfTheYear() {
    return DateTime(DateTime.now().year, 12, 31);
  }
  static String getDay(DateTime dateTime){
    return _dateFormatDay.format(dateTime);
  }

  static String convertHourMinuteToTime(int hour, int minute){
    // Ensure that the hour and minute values are within valid ranges
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return "Invalid time";
    }

    // Format the values to a 24-hour time format
    String hourString = hour < 10 ? '0$hour' : '$hour';
    String minuteString = minute < 10 ? '0$minute' : '$minute';

    return '$hourString:$minuteString';
  }

  static (int hour, int minute) convertFrom24HourFormat(String time24Format) {
    // Parse the time string (HH:mm)
    List<String> parts = time24Format.split(':');

    // Ensure that the time format is valid
    if (parts.length != 2) {
      return (0, 0); // Default values in case of an invalid format
    }

    // Extract hour and minute as integers
    int hour = int.tryParse(parts[0]) ?? 0;
    int minute = int.tryParse(parts[1]) ?? 0;

    // Ensure that the extracted values are within valid ranges
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return (0, 0); // Default values in case of invalid ranges
    }

    return (hour, minute);

  }

  static bool isAfter(String currentTime, String compareToTime){
    DateTime dateTime1 = DateTime.parse("2022-01-01 $currentTime");
    DateTime dateTime2 = DateTime.parse("2022-01-01 $compareToTime");

    return dateTime1.isAfter(dateTime2);
  }

  static bool isBefore(String time1, String time2) {
    DateTime dateTime1 = DateTime.parse("2022-01-01 $time1");
    DateTime dateTime2 = DateTime.parse("2022-01-01 $time2");

    return dateTime1.isBefore(dateTime2);
  }

  static   DateTime combineDateWithTime(String time) {
    // Get current date
    DateTime currentDate = DateTime.now();

    // Parse the given time string to get hour and minute components
    List<String> timeComponents = time.split(':');
    int hour = int.parse(timeComponents[0]);
    int minute = int.parse(timeComponents[1]);

    // Create a new DateTime object by combining current date with given time
    return DateTime(
      currentDate.year,
      currentDate.month,
      currentDate.day,
      hour,
      minute,
    );
  }

  
  static bool isEqual(String currentTime, String compareToTime){
    DateTime dateTime1 = DateTime.parse("2022-01-01 $currentTime");
    DateTime dateTime2 = DateTime.parse("2022-01-01 $compareToTime");

    return dateTime1.isAtSameMomentAs(dateTime2);
  }

  static bool isBeforeOrEqual(String time1, String time2) {
    DateTime dateTime1 = DateTime.parse("2022-01-01 $time1");
    DateTime dateTime2 = DateTime.parse("2022-01-01 $time2");

    return dateTime1.isBefore(dateTime2) || dateTime1.isAtSameMomentAs(dateTime2);
  }

  static int getSubscriptionRemainingDays(String? date){
    if(date == null){
      return -1;
    }
      DateTime dateTime = dateFormatGetEvent.parse(date);
      var diff = dateTime.difference(DateTime.now());
      return diff.inDays;
  }

  static bool isAfterBook(DateTime date, DateTime compareToDate) {
    return date.isAfter(compareToDate);
  }
  static bool isAfterCurrentTime(DateTime dateTime) {
    DateTime currentTime = DateTime.now();
    return dateTime.isAfter(currentTime);
  }

  static bool isDateTimePassed(DateTime dateTime) {
    DateTime currentTime = DateTime.now();
    return dateTime.isAfter(currentTime);
  }
}