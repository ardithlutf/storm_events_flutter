import 'package:faker/faker.dart';

import 'city_details.dart';

class City {
  String id;
  String name;
  CityDetails details;

  City() {
    id = faker.guid.guid();
    name = faker.person.name();
  }
}
