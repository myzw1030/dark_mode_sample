import 'package:dark_mode_sample/models/theme_mode.dart';
import 'package:dark_mode_sample/service/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.lightbulb),
          title: const Text('Dark/Light Mode'),
          onTap: () => {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const _ThemeModeSelectionPage(),
              ),
            ),
          },
        )
      ],
    );
  }
}

class _ThemeModeSelectionPage extends ConsumerStatefulWidget {
  const _ThemeModeSelectionPage();

  @override
  _ThemeModeSelectionPageState createState() => _ThemeModeSelectionPageState();
}

class _ThemeModeSelectionPageState
    extends ConsumerState<_ThemeModeSelectionPage> {
  ThemeMode _current = ThemeMode.system;
  // final preferencesService = PreferencesService();

  // 保存されたテーマモードを設定
  Future<void> _loadThemeMode() async {
    final mode = await PreferencesService.getThemeMode();
    setState(() => _current = mode);
  }

  // テーマモードを更新
  Future<void> _updateThemeMode(ThemeMode mode) async {
    setState(() => _current = mode);
    await PreferencesService.saveThemeMode(mode);
    ref.read(themeModeProvider.notifier).state = mode;
  }

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark/Light Mode'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              groupValue: _current,
              title: const Text('System'),
              onChanged: (value) => _updateThemeMode(value!),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              groupValue: _current,
              title: const Text('Light'),
              onChanged: (value) => _updateThemeMode(value!),
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              groupValue: _current,
              title: const Text('Dark'),
              onChanged: (value) => _updateThemeMode(value!),
            ),
          ],
        ),
      ),
    );
  }
}
