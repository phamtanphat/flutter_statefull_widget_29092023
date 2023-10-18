String formatTime(DateTime dateTime) {
  var day = dateTime.day;
  var month = dateTime.month;
  var year = dateTime.year;
  var hour = dateTime.hour;
  var minute = dateTime.minute;
  var second = dateTime.second;
  return "$day/$month/$year $hour:$minute:$second";
}