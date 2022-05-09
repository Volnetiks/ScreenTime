import 'package:flutter/material.dart';

class AppModel extends StatefulWidget {
  const AppModel({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<AppModel> createState() => _AppModelState();
}

class _AppModelState extends State<AppModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.index == 0 || widget.index == 4
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: widget.index == 0
                  ? const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0))
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
            )
          : const BoxDecoration(color: Colors.white),
      height: 50,
      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        const SizedBox(
          width: 15,
        ),
        const Text("Netflix")
      ]),
    );
  }
}
