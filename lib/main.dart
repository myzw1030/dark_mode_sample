import 'package:dark_mode_sample/models/theme_mode.dart';
import 'package:dark_mode_sample/pages/main_page.dart';
import 'package:dark_mode_sample/service/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // Flutterのウィジェットバインディングの初期化
  WidgetsFlutterBinding.ensureInitialized();
  // 保存されたテーマモードを読み込み初期値に設定
  final initialThemeMode = await PreferencesService.getThemeMode();
  runApp(
    ProviderScope(
      // プロバイダーを新しい値で上書き
      overrides: [
        themeModeProvider.overrideWith(
          (ref) => ThemeModeNotifier(initialThemeMode),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeModeState,
      home: const MainPage(),
    );
  }
}
