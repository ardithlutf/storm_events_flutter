import 'package:flutter/material.dart';

abstract class City {
  @protected
  List<String> events_2;
  @protected
  String name;

  List<String> getEvents2() {
    return events_2;
  }

  String getName() {
    return name;
  }
}