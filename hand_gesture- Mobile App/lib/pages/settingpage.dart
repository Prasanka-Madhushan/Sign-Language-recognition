import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Mock provider for settings management
class SettingsProvider extends ChangeNotifier {
  bool _notificationsEnabled = true;

  bool get notificationsEnabled => _notificationsEnabled;

  set notificationsEnabled(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  // Call this method on app startup
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
    notifyListeners();
  }

  // Toggle notification settings
  Future<void> toggleNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    _notificationsEnabled = !_notificationsEnabled;
    await prefs.setBool('notificationsEnabled', _notificationsEnabled);
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
    //var settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          /*SwitchListTile(
            title: Text('Enable Notifications'),
            value: settingsProvider.notificationsEnabled,
            onChanged: (bool value) {
              settingsProvider.toggleNotifications();
            },
          ),*/
          ListTile(
            title: Text('Manage Account'),
            onTap: () {
              // Navigation to Account Management Page or Dialog
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Show privacy policy dialog or navigate to a web view
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
