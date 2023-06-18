extension DateExtension on DateTime {
  bool isInSameDay(DateTime date) {
    if (day == date.day && month == date.month && year == date.year) {
      return true;
    }
    return false;
  }
}
