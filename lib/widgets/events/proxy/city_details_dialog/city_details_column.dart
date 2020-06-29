import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:stormeventslima/design_pattern/proxy/city/city_details.dart';

import '../../../../constants.dart';
import 'city_info_group.dart';

class CityDetailsColumn extends StatelessWidget {
  final CityDetails customerDetails;

  const CityDetailsColumn({
    @required this.customerDetails,
  }) : assert(customerDetails != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CityInfoGroup(
          label: 'E-mail',
          text: customerDetails.email,
        ),
        const SizedBox(height: spaceL),
        CityInfoGroup(
          label: 'Jabatan',
          text: customerDetails.position,
        ),
        const SizedBox(height: spaceL),
        CityInfoGroup(
          label: 'Hobi',
          text: customerDetails.hobby,
        ),
      ],
    );
  }
}
