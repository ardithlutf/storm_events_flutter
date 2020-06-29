import 'package:flutter/material.dart';

import 'package:stormeventslima/design_pattern/proxy/city/city.dart';
import 'package:stormeventslima/design_pattern/proxy/city_details_service.dart';
import 'package:stormeventslima/design_pattern/proxy/city_details_service_proxy.dart';
import 'package:stormeventslima/design_pattern/proxy/icity_details_service.dart';

import '../../../constants.dart';
import 'city_details_dialog/customer_details_dialog.dart';

class ProxyExample extends StatefulWidget {
  @override
  _ProxyExampleState createState() => _ProxyExampleState();
}

class _ProxyExampleState extends State<ProxyExample> {
  final ICityDetailsService _customerDetailsServiceProxy =
      CityDetailsServiceProxy(CityDetailsService());
  final List<City> _customerList = List.generate(10, (_) => City());

  void _showCityDetails(City customer) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext _) {
        return CityDetailsDialog(
          service: _customerDetailsServiceProxy,
          customer: customer,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: <Widget>[
            Text(
              'Klik untuk melihat detail user',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spaceL),
            for (var customer in _customerList)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      customer.name[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: Icon(Icons.info_outline),
                  title: Text(customer.name),
                  onTap: () => _showCityDetails(customer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
