const daysPerYear = 365.25;
const daysPerMonth = 30.417;

String formatDuration(Duration d) {
  final years = (d.inDays ~/ daysPerYear).floor();
  final remainingDays = (d.inDays % daysPerYear).floor();
  final months = (remainingDays ~/ daysPerMonth).floor();
  final days = (remainingDays % daysPerMonth).floor();
  return '$years years $months months $days days';
}
