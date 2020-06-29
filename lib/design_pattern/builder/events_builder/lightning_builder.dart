import '../city/index.dart';
import '../events_builder_base.dart';

class LightningBuilder extends EventsBuilderBase {
  @override
  void addHouston() {
//    events.addCity(Houston());
  }

  @override
  void addChicago() {
    events.addCity(Chicago());
  }

  @override
  void addLosAngeles() {
//    events.addCity(LosAngeles());
  }

  @override
  void addNewYork() {
    events.addCity(NewYork());
  }

  @override
  void addWashington() {
//    events.addCity(Washington());
  }

}
