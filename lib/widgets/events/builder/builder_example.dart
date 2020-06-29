import 'package:flutter/material.dart';
import 'package:stormeventslima/design_pattern/builder/events_builder/flood_builder.dart';
import 'package:stormeventslima/design_pattern/builder/events_builder/lightning_builder.dart';

import '../../../constants.dart';
import '../../../design_pattern/builder/events_builder/index.dart';
import '../../../design_pattern/builder/events.dart';
import 'package:stormeventslima/design_pattern/builder/events_maker.dart';
import 'events_information/events_information_column.dart';
import 'events_menu_item.dart';

class BuilderExample extends StatefulWidget {
  @override
  _BuilderExampleState createState() => _BuilderExampleState();
}

class _BuilderExampleState extends State<BuilderExample> {
  final EventsMaker _eventsMaker = EventsMaker(TsunamiBuilder());
  final List<EventsMenuItem> _eventsMenuItems = [];

  EventsMenuItem _selectedEventsMenuItem;
  Events _selectedEvents;

  @override
  void initState() {
    super.initState();

    _eventsMenuItems.addAll([
      EventsMenuItem(
        label: 'Tsunami',
        eventsBuilder: TsunamiBuilder(),
      ),
      EventsMenuItem(
        label: 'Flood',
        eventsBuilder: FloodBuilder(),
      ),
      EventsMenuItem(
        label: 'Lightning',
        eventsBuilder: LightningBuilder(),
      ),
    ]);

    _selectedEventsMenuItem = _eventsMenuItems[0];
    _selectedEvents = _prepareSelectedEvents();
  }

  Events _prepareSelectedEvents() {
    _eventsMaker.prepareEvents();

    return _eventsMaker.getEvents();
  }

  void _onEventsMenuItemChanged(EventsMenuItem selectedItem) {
    setState(() {
      _selectedEventsMenuItem = selectedItem;
      _eventsMaker.changeEventsBuilder(selectedItem.eventsBuilder);
      _selectedEvents = _prepareSelectedEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Pilih events:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            DropdownButton(
              value: _selectedEventsMenuItem,
              items: _eventsMenuItems
                  .map<DropdownMenuItem<EventsMenuItem>>(
                    (EventsMenuItem item) => DropdownMenuItem(
                      value: item,
                      child: Text(item.label),
                    ),
                  )
                  .toList(),
              onChanged: _onEventsMenuItemChanged,
            ),
            SizedBox(height: spaceL),
            Row(
              children: <Widget>[
                Text(
                  'Informasi:',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(height: spaceM),
            EventsInformationColumn(events: _selectedEvents),
          ],
        ),
      ),
    );
  }
}
