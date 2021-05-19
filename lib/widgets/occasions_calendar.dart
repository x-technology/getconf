import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get_conf/bloc/get_occasions_block.dart';
import 'package:get_conf/model/occasion.dart';
import 'package:get_conf/model/occasion_response.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils.dart';

class OccasionsCalendar extends StatefulWidget {
  @override
  _OccasionsCalendarState createState() => _OccasionsCalendarState();
}

class _OccasionsCalendarState extends State<OccasionsCalendar> {
  List<Occasion> _occasions = <Occasion>[];
  final ValueNotifier<List<Occasion>> _selectedEvents = ValueNotifier([]);

  // Using a `LinkedHashSet` is recommended due to equality comparison override
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  @override
  void initState() {
    super.initState();
    occasionsBloc.getOccasions();
    listenForOccasions();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      // Update values in a Set
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
    });

    _selectedEvents.value = _getOccasionsForDays(_selectedDays);
  }

  void listenForOccasions() async {
    occasionsBloc.subject.listen((OccasionResponse data) => setState(() {
          if (data.error != "") {
            debugPrint('Occasions load failed');
          } else {
            _occasions = data.occasions;
          }
        }));
  }

  List<Occasion> _getOccasionsForDay(DateTime day) {
    return _occasions.where((i) {
      return i.datetime.toUtc().compareTo(day) == 0;
    }).toList();
  }

  List<Occasion> _getOccasionsForDays(Set<DateTime> days) {
    // Implementation example
    // Note that days are in selection order (same applies to events)
    return [
      for (final d in days) ..._getOccasionsForDay(d),
    ];
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (_occasions.length > 0) ...[
          TableCalendar<Occasion>(
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            headerStyle: HeaderStyle(formatButtonVisible: false),
            startingDayOfWeek: StartingDayOfWeek.monday,
            onDaySelected: _onDaySelected,
            eventLoader: _getOccasionsForDay,
            selectedDayPredicate: (day) {
              return _selectedDays.contains(day);
            },
          ),
          ElevatedButton(
            child: Text('Clear selection'),
            onPressed: () {
              setState(() {
                _selectedDays.clear();
                _selectedEvents.value = [];
              });
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Occasion>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ]
      ],
    );
  }
}
