import 'package:flutter/material.dart';
import 'package:nightlyfe/assets/functionals/favorites_manager.dart';
import 'package:nightlyfe/assets/widgets/eventWidget.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<Map<String, dynamic>> favoriteEvents = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    await FavoritesManager.loadFavorites();
    setState(() {
      favoriteEvents = FavoritesManager.getFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Events',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'BebasNeue',
          ),
        ),
        backgroundColor: const Color(0xFF4a0404),
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF292929),
        ),
        child: favoriteEvents.isEmpty
            ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'No',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'PressStart2P',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Favorited',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'PressStart2P',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Events',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'PressStart2P',
                ),
              ),
            ],
          ),
        )
            : ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: favoriteEvents.length,
          itemBuilder: (context, index) {
            final event = favoriteEvents[index];
            return EventWidget(
              title: event['title'],
              date: event['date'],
              description: event['description'],
              imagePath: event['imagePath'],
              bottomText: event['bottomText'],
            );
          },
        ),
      ),
    );
  }
}
