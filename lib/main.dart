import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/data/datasources/person_remote_data_source.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PersonRemoteDataSourceImpl personRemoteDataSourceImpl = PersonRemoteDataSourceImpl(client: http.Client());

  @override
  Widget build(BuildContext context) {
    personRemoteDataSourceImpl.getAllPersons(1);
    return const Placeholder();
  }
}
