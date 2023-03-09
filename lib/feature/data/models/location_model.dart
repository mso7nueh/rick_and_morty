import 'package:rick_and_morty/feature/domain/entities/person_entity.dart';

class LocationModel extends LocationEntity {
  LocationModel({name, url}) : super(name, url);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(name: json['name'], url: json['url']);
  }
}
