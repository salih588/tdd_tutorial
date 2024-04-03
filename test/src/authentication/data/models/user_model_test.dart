
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_tutorial/core/utils/typedef.dart';
import 'package:tdd_tutorial/src/authentication/data/models/user_model.dart';
import 'package:tdd_tutorial/src/authentication/domain/entities/user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {

  const tModel = UserModel.empty();

  test('should be a subclass of [User] entity', () {
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () { 
    test('should return a [UserModel] with right data', () {

      final result = UserModel.fromMap(tMap);
      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with right data', () {

      final result = UserModel.fromJson(tJson);
      expect(result, equals(tModel));
    });
  });
  
  group('toMap', () {
    test('should return a [Map] with the right data', () {
      final result = tModel.toMap();
      expect(result, tMap);
    });
  });

  group('toJson', () {
    test('should return a [JSON] string with the right data', () {
      final result = tModel.toJson();
      expect(result, tJson);
    });
  });
  
  group('copyWith', () {
    test('should return a [UserModel] with different data', () {
      final result = tModel.copyWith(name: 'Paul');
      expect(result.name, equals('Paul'));
    });
  });
  
}