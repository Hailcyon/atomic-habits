class Habit {
  final String id;
  final String name;
  final List<String> days;
  final String startTime;
  final String endTime;
  final String place;
  final String iconPath;

  Habit({
    required this.id,
    required this.name,
    required this.days,
    required this.startTime,
    required this.endTime,
    required this.place,
    required this.iconPath,
  });

  factory Habit.fromMap(String id, Map<String, dynamic> data) {
    return Habit(
      id: id,
      name: data['name'] ?? '',
      days: List<String>.from(data['days'] ?? []),
      startTime: data['start time'] ?? '--:--', // Default to "--:--" if not set
      endTime: data['end time'] ?? '--:--', // Default to "--:--" if not set
      place: data['place'] ?? '',
      iconPath: data['icon path'] ?? '',
    );
  }
}
