import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'widgets/sign_in.dart';

class HomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const HomePage({super.key, required this.onThemeChanged});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'en';
  bool _isDarkMode = false;

  void _changeLanguage(String language) async {
    await FlutterI18n.refresh(context, Locale(language));
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    });
    widget.onThemeChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(FlutterI18n.translate(context, 'app_title')),
        actions: [
          Switch(
            value: _isDarkMode,
            onChanged: _toggleTheme,
          ),
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => _toggleTheme(!_isDarkMode),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(FlutterI18n.translate(context, 'language')),
            Row(
              children: [
                Radio<String>(
                  value: 'en',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _changeLanguage(value);
                    }
                  },
                ),
                const Text('English'),
                Radio<String>(
                  value: 'vi',
                  groupValue: _selectedLanguage,
                  onChanged: (String? value) {
                    if (value != null) {
                      _changeLanguage(value);
                    }
                  },
                ),
                const Text('Vietnamese'),
              ],
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            SignInForm(
              key: UniqueKey(),
            ),
          ],
        ),
      ),
    );
  }
}
