const int daysPerYear = 365;
const int daysPerMonth = 30;

String formatDuration(Duration d) {
  final years = d.inDays ~/ daysPerYear;
  final remainingDays = d.inDays % daysPerYear;
  final months = remainingDays ~/ daysPerMonth;
  final days = remainingDays % daysPerMonth;
  return '$years years $months months $days days';
}
