import 'package:flutter/material.dart';

import 'extensions/hex_color.dart';
import 'models/app_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const ScreenTime());
}

class ScreenTime extends StatelessWidget {
  const ScreenTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screen Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenTimePage(),
    );
  }
}

class ScreenTimePage extends StatefulWidget {
  const ScreenTimePage({Key? key}) : super(key: key);

  @override
  State<ScreenTimePage> createState() => _ScreenTimePageState();
}

class _ScreenTimePageState extends State<ScreenTimePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('12am', 12),
      _ChartData('1am', 12),
      _ChartData('2am', 15),
      _ChartData('3am', 30),
      _ChartData('4am', 6.4),
      _ChartData('5am', 14),
      _ChartData('6am', 12),
      _ChartData('7am', 15),
      _ChartData('8am', 30),
      _ChartData('9am', 6.4),
      _ChartData('10am', 14),
      _ChartData('11am', 12),
      _ChartData('12pm', 15),
      _ChartData('1pm', 30),
      _ChartData('2pm', 6.4),
      _ChartData('3pm', 14),
      _ChartData('4pm', 12),
      _ChartData('5pm', 15),
      _ChartData('6pm', 30),
      _ChartData('7pm', 6.4),
      _ChartData('8pm', 14),
      _ChartData('9pm', 12),
      _ChartData('10pm', 15),
      _ChartData('11pm', 30)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex("#f6f5fa"),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex("#f6f5fa"),
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Screen Time",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              Text("Last Week",
                  style:
                      TextStyle(color: Colors.purple.shade400, fontSize: 14)),
            ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 300,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SfCartesianChart(
                        primaryXAxis:
                            CategoryAxis(opposedPosition: true, interval: 6),
                        primaryYAxis: NumericAxis(
                            minimum: 0,
                            maximum: 60,
                            interval: 10,
                            isVisible: false),
                        tooltipBehavior: _tooltip,
                        series: <ChartSeries<_ChartData, String>>[
                          ColumnSeries<_ChartData, String>(
                              dataSource: data,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                              color: const Color.fromRGBO(8, 142, 255, 1))
                        ]),
                  )
                ],
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Most used",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Show Categories",
                    style: TextStyle(color: Colors.purple.shade400))
              ],
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return AppModel(index: index);
                    })),
          )
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
