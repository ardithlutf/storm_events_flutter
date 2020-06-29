import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'package:stormeventslima/design_pattern/builder/events.dart';
import 'events_information_label.dart';

class EventsInformationColumn extends StatelessWidget {
  final Events events;

  const EventsInformationColumn({
    @required this.events,
  }) : assert(events != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
//        EventsInformationLabel('DD/MM/YYYY'),
//        Text(events.getFormattedPrice()),
        SizedBox(height: spaceM),
        EventsInformationLabel('Kota yang dilanda'),
        Text(
          events.getFormattedCitys(),
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: spaceM),
        EventsInformationLabel('Bencana lain yang sering muncul'),
        Text(
          events.getFormattedEvents2(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
