import 'dart:convert';

import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../core/utils/typedef.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.avatar,
  });

  const UserModel.empty()
      : this(
          id: '1',
          createdAt: '_empty.createdAt',
          name: '_empty.name',
          avatar: '_empty.avatar',
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
          avatar: map['avatar'] as String,
        );

  UserModel copyWith({
    String? id,
    String? createdAt,
    String? name,
    String? avatar,
  }) {
    return UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar);
  }

  DataMap toMap() => {
        'id': id,
        'createdAt': createdAt,
        'name': name,
        'avatar': avatar,
      };

  String toJson() => jsonEncode(toMap());
}
