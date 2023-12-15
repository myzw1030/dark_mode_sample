import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// アプリ全体のテーマモードの状態を管理するプロパイダー
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
