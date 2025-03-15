import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';

class EventSelector extends StatefulWidget {
  final List<String> events;
  final EventSlectorController? controller;

  const EventSelector(this.events, {super.key, this.controller});

  @override
  State<EventSelector> createState() => _EventSelectorState();
}

class _EventSelectorState extends State<EventSelector> {
  
  late List<String> events;
  late EventSlectorController controller;
  
  @override
  void initState() {
    events = widget.events;
    controller = widget.controller ?? EventSlectorController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        itemCount: events.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, ind) {
          return GestureDetector(
            onTap:() {
              setState(() {
                controller.setSelectedEvent(ind);
              });
            },
            child: EventDisplay(
              events[ind],
              selected: ind == controller.selectedEvent,
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}

class EventSlectorController {
  int selectedEvent;
  final int initialSelection;
  final void Function(int event)? onSelectionChange;
  
  EventSlectorController({this.initialSelection = 0, this.onSelectionChange}):
    selectedEvent = initialSelection;
  
  void setSelectedEvent(int event) {
    selectedEvent = event;
    if (onSelectionChange != null && event != selectedEvent) {
      onSelectionChange!(event);
    }
  }
}

class EventDisplay extends StatelessWidget {
  
  final String eventName;
  final bool selected;
  
  const EventDisplay(this.eventName, {super.key, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: selected ? SharedColors.selectedEventColor : SharedColors.unselectedEventColor,
        border: Border.all(
          color: SharedColors.categoryHighlightBorderColor,
          width: 0.6
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        eventName,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }
}