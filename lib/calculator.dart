const daysPerYear = 365.25;
const daysPerMonth = 30.417;
const monthsPerYear = 12;

List<String> formatDuration(Duration d) {
  final years = (d.inDays / daysPerYear).floor();
  final remainingDays = (d.inDays % daysPerYear).floor();
  final months = (remainingDays / daysPerMonth).floor();
  final days = (remainingDays % daysPerMonth).floor();
  final totalMonths = (d.inDays / daysPerYear * monthsPerYear).floor();
  final totalDays = d.inDays;
  return [
    '$years years $months months $days days',
    '$totalMonths months $days days',
    '$totalDays days',
  ];
}
