import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);

  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) async =>
      await _getPersonFromUrl(
          'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) async =>
      await _getPersonFromUrl(
          'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'ContentType': 'application/json'});
    if (response.statusCode == 200) {
      final persons = json.decode(response.body);
      return (persons['result'] as List)
          .map((e) => PersonModel.fromJson(persons))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
