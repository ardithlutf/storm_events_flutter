import 'events.dart';
import 'events_builder_base.dart';

class EventsMaker {
  EventsBuilderBase eventsBuilder;

  EventsMaker(this.eventsBuilder);

  void changeEventsBuilder(EventsBuilderBase eventsBuilder) {
    this.eventsBuilder = eventsBuilder;
  }

  Events getEvents() {
    return eventsBuilder.getEvents();
  }

  void prepareEvents() {
    eventsBuilder.createEvents();

    eventsBuilder.addChicago();
    eventsBuilder.addHouston();
    eventsBuilder.addLosAngeles();
    eventsBuilder.addNewYork();
    eventsBuilder.addWashington();
  }
}