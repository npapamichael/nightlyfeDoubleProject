import 'package:flutter/material.dart';
import 'package:nightlyfe/services/point_handler.dart';

class PointsDisplay extends StatefulWidget {
  const PointsDisplay({Key? key}) : super(key: key);

  @override
  _PointsDisplayState createState() => _PointsDisplayState();
}

class _PointsDisplayState extends State<PointsDisplay> {
  @override
  void initState() {
    super.initState();
    PointsHandler.onPointsChanged = _refreshPoints;
  }

  void _refreshPoints() {
    setState(() {}); //REFRESH UI
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        'Points: ${PointsHandler.getPoints()}',
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'PressStart2P'),
      ),
    );
  }
}
