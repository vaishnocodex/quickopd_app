extension DateFormatter on String {
  String formattedDate() {
    try {
      DateTime appointmentDate = DateTime.parse(this);
      DateTime now = DateTime.now();
      DateTime tomorrow = now.add(const Duration(days: 1));

      if (_isSameDate(appointmentDate, now)) {
        return "Today, ${_formatDate(appointmentDate)} at ${_formatTime(appointmentDate)}";
      } else if (_isSameDate(appointmentDate, tomorrow)) {
        return "Tomorrow, ${_formatDate(appointmentDate)} at ${_formatTime(appointmentDate)}";
      } else {
        return "${_getWeekday(appointmentDate)}, ${_formatDate(appointmentDate)} at ${_formatTime(appointmentDate)}";
      }
    } catch (e) {
      return "Invalid Date"; // Handle parsing errors
    }
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String _formatDate(DateTime date) {
    return "${date.day} ${_getMonth(date)}, ${date.year}";
  }

  String _formatTime(DateTime date) {
    int hour = date.hour;
    int minute = date.minute;
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour % 12;
    hour = hour == 0 ? 12 : hour;
    String minuteStr = minute.toString().padLeft(2, '0');
    return "$hour:$minuteStr $period";
  }

  String _getMonth(DateTime date) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[date.month - 1];
  }

  String _getWeekday(DateTime date) {
    const weekdays = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ];
    return weekdays[date.weekday - 1];
  }
}
