import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

/*
 * This class contains the logic for getting and calculating the time. It has
 * two functions that take a unix timestamp. One returns the exact date and
 * time. The other one returns the time elapsed since the given time.
 */

class TimeHelper {

  TimeHelper(){
    timeago.setLocaleMessages('en', CustomTimeMessages());
  }

  // Returns time elapsed since the given time
  String relativeTime(int timestamp) {
    DateTime formatDate = DateTime.fromMillisecondsSinceEpoch(timestamp );
    DateTime now = DateTime.now();
    Duration difference = now.difference(formatDate);
    return timeago.format(now.subtract(difference));
  }

  // Returns exact date and time
  String dateFromTimestamp(int timestamp) {
    DateTime formatDate = DateTime.fromMillisecondsSinceEpoch(timestamp );
    return DateFormat.yMd().add_jm().format(formatDate);
  }
}

// Messages to describe relative time
class CustomTimeMessages implements timeago.LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'now';
  @override String aboutAMinute(int minutes) => '1 minute ago';
  @override String minutes(int minutes) => '$minutes minutes ago';
  @override String aboutAnHour(int minutes) => '1 hour ago';
  @override String hours(int hours) => '$hours hours ago';
  @override String aDay(int hours) => '1 day ago';
  @override String days(int days) => '$days days ago';
  @override String aboutAMonth(int days) => '1 month ago';
  @override String months(int months) => '$months months ago';
  @override String aboutAYear(int year) => '1 year ago';
  @override String years(int years) => '$years years ago';
  @override String wordSeparator() => ' ';
}