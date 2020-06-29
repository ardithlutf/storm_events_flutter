import 'package:flutter/material.dart';

class EventsInformationLabel extends StatelessWidget {
  final String label;

  const EventsInformationLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
