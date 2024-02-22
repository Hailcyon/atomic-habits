import 'package:flutter/material.dart';

class Habit {
  final String id;
  final String name;
  final List<String> days;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String place;

  Habit({required this.id, required this.name, required this.days, required this.startTime, required this.endTime, required this.place});

  
  factory Habit.fromMap(String id, Map<String, dynamic> data) {
    return Habit(
      id: id,
      name: data['name'] ?? '',  // Using null-aware operators for safety
      days: List<String>.from(data['days'] ?? []),
      startTime: data['start time'] ?? '',
      endTime: data['end time'] ?? '',
      place: data['place'] ?? '',
    );
  }
}