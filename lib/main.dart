import 'package:flutter/material.dart';

import 'extensions/hex_color.dart';
import 'models/app_model.dart';

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
            children: const [
              Text("Screen Time",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              Text("Last Week",
                  style: TextStyle(color: Colors.purple, fontSize: 14)),
            ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
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
