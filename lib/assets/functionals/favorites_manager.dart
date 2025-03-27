import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritesManager {
  static List<Map<String, dynamic>> _favoriteEvents = [];

  static Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = _getCurrentUserId();

    if (userId == null) return;

    final String? storedFavorites = prefs.getString("favorite_events_$userId");

    if (storedFavorites != null) {
      List<dynamic> decodedList = jsonDecode(storedFavorites);
      _favoriteEvents = decodedList.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      _favoriteEvents = [];
    }
  }

  static List<Map<String, dynamic>> getFavorites() {
    return _favoriteEvents;
  }

  static bool isFavorite(String title) {
    return _favoriteEvents.any((event) => event['title'] == title);
  }

  static Future<void> addFavorite(Map<String, dynamic> eventData) async {
    if (!_favoriteEvents.any((event) => event['title'] == eventData['title'])) {
      _favoriteEvents.add(eventData);
      await _saveFavorites();
    }
  }

  static Future<void> removeFavorite(String title) async {
    _favoriteEvents.removeWhere((event) => event['title'] == title);
    await _saveFavorites();
  }

  static Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = _getCurrentUserId();

    if (userId == null) return; //NO UDER LOGGED IN

    final String encodedData = jsonEncode(_favoriteEvents);
    await prefs.setString("favorite_events_$userId", encodedData);
  }

  static String? _getCurrentUserId() {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
