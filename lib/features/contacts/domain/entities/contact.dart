import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int id;
  final String name;
  final String email;

  const Contact({required this.id, required this.name, required this.email});

  @override
  List<Object?> get props => [id, name, email];
}
