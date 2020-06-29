import 'city/city_details.dart';

abstract class ICityDetailsService {
  Future<CityDetails> getCityDetails(String id);
}
