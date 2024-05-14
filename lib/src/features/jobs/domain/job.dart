import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

typedef JobID = String;

@immutable
class Job extends Equatable {
  const Job({
    required this.id,
    required this.name,
    required this.ratePerHour,
    this.sentAtMillis = '0',
  });
  final JobID id;
  final String name;
  final int ratePerHour;
  final String sentAtMillis;

  @override
  List<Object> get props => [name, ratePerHour];

  @override
  bool get stringify => true;

  factory Job.fromMap(Map<String, dynamic> data, String id) {
    final name = data['name'] as String;
    // final ratePerHour = data['ratePerHour'] as int;
    // final sentAtMillis = data['sentAtMillis'] as String;
    return Job(
      id: id,
      name: name,
      // ratePerHour: ratePerHour,
      // sentAtMillis: sentAtMillis,
      ratePerHour: -1,
      sentAtMillis: "1234567",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // 'ratePerHour': ratePerHour,
      // 'sentAtMillis': sentAtMillis,
    };
  }
}
