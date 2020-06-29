import 'package:stormeventslima/design_pattern/builder/city.dart';

class Events {
  final List<City> _city = [];

  void addCity(City city) {
    _city.add(city);
  }

  String getFormattedCitys() {
    return _city.map((x) => x.getName()).join(', ');
  }

  String getFormattedEvents2() {
    var events_2 = Set<String>();

    _city.forEach((x) => events_2.addAll(x.getEvents2()));

    return events_2.join(', ');
  }
}