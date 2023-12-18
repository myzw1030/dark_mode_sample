import 'package:dark_mode_sample/service/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// アプリ全体のテーマモードの状態を管理するプロパイダー
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
    (ref) => ThemeModeNotifier(ThemeMode.system));

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  // テーマモードの初期設定
  ThemeModeNotifier(ThemeMode initialMode) : super(initialMode);

  // 保存されたテーマモードを設定
  // Future<void> loadThemeMode() async {
  //   final mode = await PreferencesService.getThemeMode();
  //   state = mode;
  // }

  // テーマモードを更新
  Future<void> updateThemeMode(ThemeMode mode) async {
    state = mode;
    await PreferencesService.saveThemeMode(mode);
  }
}
