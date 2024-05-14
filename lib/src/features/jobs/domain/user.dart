import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

typedef UserId = String;

@immutable
class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    // required this.ratePerHour,
    // this.sentAtMillis = '0',
  });
  final UserId id;
  final String name;
  // final int ratePerHour;
  // final String sentAtMillis;

  @override
  // List<Object> get props => [name, ratePerHour];
  List<Object> get props => [name];

  @override
  bool get stringify => true;

  factory User.fromMap(Map<String, dynamic> data, String id) {
    final name = data['name'] as String;
    // // final ratePerHour = data['ratePerHour'] as int;
    // // final sentAtMillis = data['sentAtMillis'] as String;
    return User(
      id: id,
      name: name,
      // // ratePerHour: ratePerHour,
      // // sentAtMillis: sentAtMillis,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      // // 'ratePerHour': ratePerHour,
      // // 'sentAtMillis': sentAtMillis,
    };
  }
}
