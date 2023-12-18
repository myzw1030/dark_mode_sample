import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String themeModeKey = 'themeMode';
  // 選択されたテーマモードを文字列として端末保存する
  static Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(themeModeKey, mode.toString());
  }

  // 保存されたテーマモードをローカルストレージから読み込む
  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    // 保存されたテーマモードの文字列を取得する（見つからなければsystem）。
    final themeModeString =
        prefs.getString(themeModeKey) ?? ThemeMode.system.toString();
    // 保存された文字列に対応するThemeModeの値を取得する（一致しない場合はsystem）。
    return ThemeMode.values.firstWhere(
      (element) => element.toString() == themeModeString,
      orElse: () => ThemeMode.system,
    );
  }
}
