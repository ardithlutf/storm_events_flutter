import 'package:faker/faker.dart';

import 'city/city_details.dart';
import 'icity_details_service.dart';

class CityDetailsService implements ICityDetailsService {
  @override
  Future<CityDetails> getCityDetails(String id) async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        var email = faker.internet.email();
        var hobby = faker.sport.name();
        var position = faker.job.title();

        return CityDetails(id, email, hobby, position);
      },
    );
  }
}
