import 'package:dark_mode_sample/models/theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeModeSelectionPage extends ConsumerWidget {
  const ThemeModeSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themeModeProvider);
    final themeModeNotifier = ref.read(themeModeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark/Light Mode'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: themeModeState,
              title: const Text('System'),
              onChanged: (value) {
                if (value != null) {
                  themeModeNotifier.updateThemeMode(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: themeModeState,
              title: const Text('Light'),
              onChanged: (value) {
                if (value != null) {
                  themeModeNotifier.updateThemeMode(value);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: themeModeState,
              title: const Text('Dark'),
              onChanged: (value) {
                if (value != null) {
                  themeModeNotifier.updateThemeMode(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
