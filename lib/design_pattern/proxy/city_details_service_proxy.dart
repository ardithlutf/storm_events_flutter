
import 'city/city_details.dart';
import 'icity_details_service.dart';

class CityDetailsServiceProxy implements ICityDetailsService {
  final ICityDetailsService service;
  final Map<String, CityDetails> customerDetailsCache =
      Map<String, CityDetails>();

  CityDetailsServiceProxy(this.service);

  @override
  Future<CityDetails> getCityDetails(String id) async {
    if (customerDetailsCache.containsKey(id)) {
      return customerDetailsCache[id];
    }

    var customerDetails = await service.getCityDetails(id);
    customerDetailsCache[id] = customerDetails;

    return customerDetails;
  }
}
