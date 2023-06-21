import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:todo_app/datetime/date_time.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.white,
        showColorTip: true,
        showText: true,
        scrollable: true,
        size: 40,
        colorsets: const {
          1: Color.fromARGB(20, 70, 179, 8),
          2: Color.fromARGB(40, 70, 179, 8),
          3: Color.fromARGB(60, 70, 179, 8),
          4: Color.fromARGB(80, 70, 179, 8),
          5: Color.fromARGB(100, 70, 179, 8),
          6: Color.fromARGB(120, 70, 179, 8),
          7: Color.fromARGB(150, 70, 179, 8),
          8: Color.fromARGB(180, 70, 179, 8),
          9: Color.fromARGB(220, 70, 179, 8),
          10: Color.fromARGB(255, 70, 179, 8),
        },
       // onClick: (value) {
        //  ScaffoldMessenger.of(context)
          //    .showSnackBar(SnackBar(content: Text(value.toString())));
        //},
      ),
    );
  }
}
