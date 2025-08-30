import '../../domain/entities/contact.dart';

class ContactModel extends Contact {
  const ContactModel({required super.id, required super.name, required super.email});

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(id: json['id'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}
