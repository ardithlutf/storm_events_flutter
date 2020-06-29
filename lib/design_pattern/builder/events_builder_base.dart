import 'package:flutter/material.dart';

import 'events.dart';

abstract class EventsBuilderBase {
  @protected
  Events events;

  void createEvents() {
    events = Events();
  }

  Events getEvents() {
    return events;
  }

  void addNewYork();
  void addChicago();
  void addHouston();
  void addLosAngeles();
  void addWashington();
}