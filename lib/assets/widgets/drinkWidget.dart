import 'package:flutter/material.dart';
import 'package:nightlyfe/services/point_handler.dart';
import 'dart:async';

class DrinkWidget extends StatelessWidget {
  final String image;
  final String name;
  final List<String> traits;
  final String description;
  final String base;
  final int points;
  final String recipe;

  const DrinkWidget({
    required this.image,
    required this.name,
    required this.traits,
    required this.description,
    required this.base,
    required this.points,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InkWell(
            onTap: () => showDrinkDetails(context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(image, width: 200, height: 200, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'BebasNeue',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void showDrinkDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2A2A2A),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 36),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily: 'BebasNeue',
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          contentPadding: const EdgeInsets.all(20),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.75,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(image, width: 100, height: 150),
                  const SizedBox(height: 10),
                  Text(
                    'Traits: ${traits.join(', ')}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                    color: Colors.deepOrange,
                  ),
                  const SizedBox(height: 10),
                  Text(description, style: const TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 20),
                  ExpansionTile(
                    title: const Text(
                      'Recipe',
                      style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: 'BebasNeue',
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          recipe,
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'BebasNeue'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Points required: $points',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'PressStart2P',
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  int currentPoints = PointsHandler.getPoints();
                  if (currentPoints >= points) {
                    PointsHandler.subtractPoints(points);
                    Navigator.pop(context);
                    _showSuccessModal(context);
                  } else {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Insufficient points. $points required'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    PointsHandler.getPoints() >= points ? Colors.green : Colors.grey,
                  ),
                ),
                child: const Text('Redeem', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return _SuccessModal(image: image, points: points);
      },
    );
  }
}

//SUCCESS MODAL
class _SuccessModal extends StatefulWidget {
  final String image;
  final int points;

  const _SuccessModal({required this.image, required this.points});

  @override
  __SuccessModalState createState() => __SuccessModalState();
}

class __SuccessModalState extends State<_SuccessModal> {
  late int _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _remainingTime = 120;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        _timer.cancel();
        Navigator.pop(context);
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF2A2A2A),
      title: const Text(
        'Drink Redeemed Successfully!',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'BebasNeue',
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.image, width: 100, height: 150),
            const SizedBox(height: 20),
            const Text(
              'Drink redeemed successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'PressStart2P',
              ),
            ),
            const Divider(thickness: 1.5, color: Colors.deepOrange),
            const Text(
              'Please do not exit this modal until the bartender has taken your order.',
              style: TextStyle(color: Colors.redAccent, fontSize: 16, fontFamily: 'BebasNeue'),
            ),
            const SizedBox(height: 20),
            Text(
              'Time remaining: ${_formatTime(_remainingTime)}',
              style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'PressStart2P'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
