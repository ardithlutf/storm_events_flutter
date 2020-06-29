import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:stormeventslima/design_pattern/proxy/city/city.dart';
import 'package:stormeventslima/design_pattern/proxy/city/city_details.dart';
import 'package:stormeventslima/design_pattern/proxy/icity_details_service.dart';
import 'package:stormeventslima/widgets/platform_specific/platform_button.dart';

import '../../../../constants.dart';
import 'city_details_column.dart';

class CityDetailsDialog extends StatefulWidget {
  final City customer;
  final ICityDetailsService service;

  const CityDetailsDialog({
    @required this.customer,
    @required this.service,
  })  : assert(customer != null),
        assert(service != null);

  @override
  _CityDetailsDialogState createState() => _CityDetailsDialogState();
}

class _CityDetailsDialogState extends State<CityDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service
        .getCityDetails(widget.customer.id)
        .then((CityDetails customerDetails) => setState(() {
              widget.customer.details = customerDetails;
            }));
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: Container(
        height: 200.0,
        child: widget.customer.details == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: lightBackgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(0.65),
                  ),
                ),
              )
            : CityDetailsColumn(
                customerDetails: widget.customer.details,
              ),
      ),
      actions: <Widget>[
        PlatformButton(
          child: Text('Close'),
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: _closeDialog,
        ),
      ],
    );
  }
}
