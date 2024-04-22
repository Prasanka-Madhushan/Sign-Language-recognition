import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock provider for theme settings
class ThemeProvider extends ChangeNotifier {
  bool _darkMode = false;

  bool get darkMode => _darkMode;

  set darkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }

  // Call this method on app startup
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = prefs.getBool('darkMode') ?? false;
    notifyListeners();
  }

  // Toggle the theme mode
  Future<void> toggleDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    _darkMode = !_darkMode;
    await prefs.setBool('darkMode', _darkMode);
    notifyListeners();
  }
}

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: themeProvider.darkMode ? Colors.grey[850] : Colors.blue,
      ),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: Text('Dark Mode'),
            value: themeProvider.darkMode,
            onChanged: (bool value) {
              themeProvider.toggleDarkMode();
            },
          ),
          ListTile(
            title: Text('Manage Notifications'),
            onTap: () {
              // Navigation to Notification Settings Page or Dialog
            },
          ),
          ListTile(
            title: Text('Account Privacy'),
            onTap: () {
              // Navigation to Privacy Settings Page or Dialog
            },
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}
