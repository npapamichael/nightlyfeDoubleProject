import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:nightlyfe/assets/functionals/favorites_manager.dart';

class EventWidget extends StatefulWidget { //EVENT PROPERTIES
  final String title;
  final String date;
  final String description;
  final String imagePath;
  final String bottomText;

  const EventWidget({super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.bottomText,
  });

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  //LOAD STATUS
  Future<void> _loadFavoriteStatus() async {
    await FavoritesManager.loadFavorites();
    setState(() {
      _isFavorite = FavoritesManager.isFavorite(widget.title);
    });
  }

  //TOGGLE FAVORITE
  Future<void> _toggleFavorite(bool newValue) async {
    setState(() {
      _isFavorite = newValue;
    });

    Map<String, dynamic> eventData = {
      'title': widget.title,
      'date': widget.date,
      'description': widget.description,
      'imagePath': widget.imagePath,
      'bottomText': widget.bottomText,
    };

    if (newValue) {
      await FavoritesManager.addFavorite(eventData);
    } else {
      await FavoritesManager.removeFavorite(eventData as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: const Color(0xFF2A2A2A),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Close button
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 36,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        // Title and Favorite Button
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BebasNeue',
                            fontSize: 25,
                          ),
                        ),
                        FavoriteButton(
                          isFavorite: _isFavorite,
                          iconDisabledColor: Colors.white,
                          iconColor: Colors.red,
                          valueChanged: (newValue) => _toggleFavorite(newValue),
                        ),
                      ],
                    ),
                    content: Container(
                      color: const Color(0xFF2A2A2A),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Image.asset(
                              widget.imagePath,
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.date,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'BebasNeue',
                              ),
                            ),
                            Container(
                              height: 1.5,
                              color: Colors.deepOrange,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              widget.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Oswald',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ).then((_) {
                setState(() {});
              });
            },
            child: Center(
              child: Image.asset(
                widget.imagePath,
                width: 250,
                height: 250,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            widget.bottomText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'BebasNeue',
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
