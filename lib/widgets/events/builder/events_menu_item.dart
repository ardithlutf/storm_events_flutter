import 'package:flutter/foundation.dart';
import 'package:stormeventslima/design_pattern/builder/events_builder_base.dart';

class EventsMenuItem {
  final String label;
  final EventsBuilderBase eventsBuilder;

  EventsMenuItem({
    @required this.label,
    @required this.eventsBuilder,
  })  : assert(label != null),
        assert(eventsBuilder != null);
}
