import 'package:flutter/material.dart';

import '../suite/settings_pages.dart';

class SettingsLanguageView extends StatelessWidget {
  const SettingsLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> languages = <String>['English', 'Mongolian', 'Japanese'];
    return Scaffold(
      appBar: AppBar(title: const Text('Choose language')),
      body: ListView(
        children: languages
            .map((String lang) => ListTile(
                  title: Text(lang),
                  onTap: () => SettingsPages.selectLanguage(lang),
                ))
            .toList(),
      ),
    );
  }
}
