import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

import 'address.dart';
import 'company.dart';

@immutable
class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  const UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, address: $address, phone: $phone, website: $website, company: $company)';
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> data) => UserModel(
        id: data['id'] as int?,
        name: data['name'] as String?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        address: data['address'] == null
            ? null
            : Address.fromMap(data['address'] as Map<String, dynamic>),
        phone: data['phone'] as String?,
        website: data['website'] as String?,
        company: data['company'] == null
            ? null
            : Company.fromMap(data['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        'address': address?.toMap(),
        'phone': phone,
        'website': website,
        'company': company?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserModel].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  UserModel copyWith({
    int? id,
    String? name,
    String? username,
    String? email,
    Address? address,
    String? phone,
    String? website,
    Company? company,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      company: company ?? this.company,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! UserModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      username.hashCode ^
      email.hashCode ^
      address.hashCode ^
      phone.hashCode ^
      website.hashCode ^
      company.hashCode;
}
