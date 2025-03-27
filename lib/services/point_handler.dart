import 'package:shared_preferences/shared_preferences.dart';

class PointsHandler {
  static int _points = 0;
  static Function? onPointsChanged; //NOTIFY UI

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _points = prefs.getInt('user_points') ?? 0;
  }

  static int getPoints() {
    return _points;
  }

  static Future<void> addPoints(int value) async {
    _points += value;
    await _savePoints();
    onPointsChanged?.call(); //UPDATE UI ON POINT CHANGE
  }

  static Future<void> subtractPoints(int value) async {
    if (_points >= value) {
      _points -= value;
      await _savePoints();
      onPointsChanged?.call(); //UPDATE UI ON POINT CHANGE
    }
  }

  //SHARED PREFERENCES POINTS
  static Future<void> _savePoints() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_points', _points);
  }
}
