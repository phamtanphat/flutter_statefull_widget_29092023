String formatTime(DateTime dateTime) {
  var day = dateTime.day;
  var month = dateTime.month;
  var year = dateTime.year;
  return "$day/$month/$year";
}

DateTime increaseOneDay(DateTime dateTime) {
  return DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch + (24 * 60 * 60 * 1000));
}

DateTime decreaseOneDay(DateTime dateTime) {
  return DateTime.fromMillisecondsSinceEpoch(dateTime.millisecondsSinceEpoch - (24 * 60 * 60 * 1000));
}