import 'package:flutter/material.dart';

class User {
  User? user;
  int? id;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String country;
  String? city;
  String? address;
  String? postalCode;
  String? phoneNumber;
  String? apartmentSuite;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.country = 'Pakistan',
    this.city,
    this.address,
    this.postalCode,
    this.phoneNumber,
    this.apartmentSuite,
  });

  List<User> userData = [
    User(
      id: 1,
      username: 'JohnDoe',
      email: 'johndoe@example.com',
      password: 'password123',
    ),
  ];
  void addUser(User newUser) {
    int lastId = userData.last.id! + 1;
    newUser.id = lastId;
    userData.add(newUser);
    debugPrint(
        'ID: ${user!.id}, Username: ${user!.username}, Email: ${user!.email} added to userData list');
  }
}
